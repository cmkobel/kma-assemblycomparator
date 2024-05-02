rule mashtree:
    input: 
        metadata = "{results_directory}/metadata.tsv",
        fasta = df["input_file_fasta"].tolist(),
    output: 
        tree = "{results_directory}/mashtree/mashtree.newick",
        dist = "{results_directory}/mashtree/mash_dist.tsv",
    conda: "../envs/mashtree.yaml"
    benchmark: "{results_directory}/benchmarks/benchmark.mashtree.tsv"
    threads: 16
    resources:
        mem_mb = 16000,
    shell: """
    
        mashtree \
            --numcpus {threads} \
            --outmatrix {output.dist:q} \
            {input.fasta:q} > {output.tree:q}

        {void_report}
    """ 



def get_mem_fasttree(wildcards, attempt): 
    return [16000, 32000, 64000, 0][attempt-1]
rule fasttree:
    input:
        metadata = "{results_directory}/metadata.tsv",
        fasta = core_genome_if_exists,
    output: "{results_directory}/fasttree/fasttree.newick"
    conda: "../envs/fasttree.yaml"
    benchmark: "{results_directory}/benchmarks/benchmark.fasttree.tsv"
    threads: 4
    retries: 2
    resources:
        mem_mb = get_mem_fasttree,
        runtime = "24h",
    shell: """

        OMP_NUM_THREADS={threads}

        FastTree \
            -nt \
            -gtr {input.fasta:q} \
        > {output:q} \
        2> {output:q}.log 

        {void_report}

    """



rule iqtree:
    input:
        metadata = "{results_directory}/metadata.tsv",
        fasta = core_genome_if_exists,
    output: 
        newick = "{results_directory}/iqtree/core_genome_iqtree.treefile"
    params:
        version_file = "{results_directory}/iqtree/iqtree_ac2_version.txt"
    conda: "../envs/iqtree.yaml"
    benchmark: "{results_directory}/benchmarks/benchmark.iqtree.tsv"
    threads: 16
    retries: 3
    resources:
        mem_mb = 32000,
        runtime = "24h",
    shell: """

        iqtree --version > {params.version_file}

        iqtree \
            -s {input.fasta:q} \
            -m GTR \
            --boot 100 \
            --prefix $(dirname {output.newick:q})/core_genome_iqtree \
            -redo

        # {void_report} Not in the report yet.


    """
