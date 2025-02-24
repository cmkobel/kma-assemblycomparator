
rule kegg_pathway:
    input: 
        kegg_asset = base_variable + "/resources/ko00001.json", # Downloaded from kegg.jp
        eggnog_annotations = expand("{output_directory}/samples/{sample}/eggnog/{sample}.emapper.annotations", sample = df["sample"], output_directory = output_directory)
    output: 
        pathway_enrichment = "{output_directory}/kegg_pathway/kegg_pathway_enrichment_analysis.tsv"
    params:
        output_dir = "{output_directory}/kegg_pathway",
        script = base_variable + "/workflow/scripts/kegg_pathway_enrichment_analysis.R"
    conda: "../envs/r-clusterProfiler.yaml"
    benchmark: "{output_directory}/benchmarks/benchmark.kegg_pathway.tsv"
    shell: """
    
        # Collect version number.
        R -s -q -e "library(clusterProfiler); sessionInfo()"  | grep -P "R version|clusterProfiler" > "$(dirname {output.pathway_enrichment})/.software_version.txt"

        Rscript {params.script:q} \
            {input.kegg_asset:q} \
            {params.output_dir:q} \
            {input.eggnog_annotations:q}  
            
        {void_report}

    """



def get_mem_gtdbtk(wildcards, attempt): 
    return [150000, 300000, 400000, 500000][attempt-1]



# The rule is called by the software, whereas the results are called by the database. Is that confusing?
rule gtdbtk:
    input: 
        metadata = "{output_directory}/metadata.tsv",
        database_representative = DATABASES + "/gtdb/comparem2_gtdb_database_representative.flag",
        fasta = df["input_file_fasta"].tolist(),
    output: 
        tsv = "{output_directory}/gtdbtk/gtdbtk.summary.tsv"
    params:
        batchfile_content = df[['input_file_fasta', 'sample']].to_csv(header = False, index = False, sep = "\t"),
        out_dir = "{output_directory}/gtdbtk/",
        base_variable = base_variable, # not used?
        mash_db = f"{DATABASES}/gtdb_sketch_release220/mash_db.msh",
        passthrough_parameters = passthrough_parameter_unpack("gtdbtk"),
    threads: 8
    #retries: 3
    resources:
        # mem_mb = get_mem_gtdbtk, # works great, but I want to use a limited amount to test a potential hardware upgrade
        mem_mb = 131072,
        runtime = "48h"
    conda: "../envs/gtdbtk.yaml"
    benchmark: "{output_directory}/benchmarks/benchmark.gtdbtk.tsv"
    shell: """
    
        # Collect version number.
        gtdbtk -v > "$(dirname {output.tsv})/.software_version.txt"
        
        # Collect database version.
        echo -e "$(date -Iseconds)\t$(dirname {input.database_representative})" > "$(dirname {output.tsv})/.database_version.txt"

        # TODO: Using skip-ani-screen is not optimal, as it possibly speeds up a lot.
        mkdir -p $(dirname {params.mash_db:q})

        # I need to find a neat way of setting these variables. Maybe the user has an older/newer version than what is hardcoded here. 
        export GTDBTK_DATA_PATH="$(dirname {input.database_representative:q})/release220/" # Should be defined from config file, and not be hardwired.
        
        # Create batchfile
        echo '''{params.batchfile_content}''' > {wildcards.output_directory}/gtdbtk/batchfile.tsv
        
        gtdbtk classify_wf \
            --mash_db {params.mash_db:q} \
            --batchfile {wildcards.output_directory}/gtdbtk/batchfile.tsv \
            --out_dir {params.out_dir:q} \
            --cpus {threads} \
            --force \
            {params.passthrough_parameters} 

        # Homogenize database version number
        #cp {wildcards.output_directory}/gtdbtk/gtdbtk.bac120.summary.tsv {output:q}
        # New better version below that also incorporates archaea
        #cat {wildcards.output_directory}/gtdbtk/gtdbtk.*.summary.tsv {output:q}
        

        # Even better: Should be tested on originals
        echo -e "user_genome\tclassification\tfastani_reference\tfastani_reference_radius\tfastani_taxonomy\tfastani_ani\tfastani_af\tclosest_placement_reference\tclosest_placement_radius\tclosest_placement_taxonomy\tclosest_placement_ani\tclosest_placement_af\tpplacer_taxonomy\tclassification_method\tnote\tother_related_references(genome_id,species_name,radius,ANI,AF)\tmsa_percent\ttranslation_table\tred_value\twarnings" \
        > {output:q}
        tail --quiet -n +2 {wildcards.output_directory}/gtdbtk/gtdbtk.*.summary.tsv \
        >> {output:q}
        

        {void_report}

    """ 



rule gapseq_pan: 
    input:
        draft = expand("{output_directory}/samples/{sample}/gapseq/{sample}-draft.RDS", sample = df["sample"])
        rxnWeights = expand("{output_directory}/samples/{sample}/gapseq/{sample}-rxnWeights.RDS", sample = df["sample"])
        rxnXgenes = expand("{output_directory}/samples/{sample}/gapseq/{sample}-rxnXgenes.RDS", sample = df["sample"])
        pathways = expand("{output_directory}/samples/{sample}/gapseq/{sample}-all-Pathways.tbl", sample = df["sample"])
    output:
        dir = directory("{output_directory}/gapseq/pan/pan.tsv")
    benchmark: "{output_directory}/benchmarks/benchmark.gapseq_pan.{sample}.tsv"
    conda: "../envs/gapseq.yaml"
    shell: """
    
        cp {input.draft} {output.dir}
        cp {input.rxnWeights} {output.dir}
        cp {input.rxnXgenes} {output.dir}
        cp {input.pathways} {output.dir}
        

        gapseq pan \
            -m {output.dir} \
            -c {output.dir} \
            -g {output.dir} \
            -w {output.dir} \
    
    """