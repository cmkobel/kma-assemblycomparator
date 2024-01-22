FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="94b535d9ddfc1435166a6892e5f3fa72bc172f768e4d38d2d92f1833f210bca0"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: conda_definitions/abricate.yaml
#   prefix: /conda-envs/e96caef90ba4287605b7ab60379bb5dc
#   name: abricate
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults
#   dependencies:
#     - abricate
RUN mkdir -p /conda-envs/e96caef90ba4287605b7ab60379bb5dc
COPY conda_definitions/abricate.yaml /conda-envs/e96caef90ba4287605b7ab60379bb5dc/environment.yaml

# Conda environment:
#   source: conda_definitions/any2fasta.yaml
#   prefix: /conda-envs/756e0ce005a36bc03fd1b91447a60f6d
#   name: any2fasta
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - any2fasta
RUN mkdir -p /conda-envs/756e0ce005a36bc03fd1b91447a60f6d
COPY conda_definitions/any2fasta.yaml /conda-envs/756e0ce005a36bc03fd1b91447a60f6d/environment.yaml

# Conda environment:
#   source: conda_definitions/assembly-stats.yaml
#   prefix: /conda-envs/21dc339c1bfec2d112230fb9ed4a3121
#   name: assembly-stats
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults
#   dependencies:
#     - assembly-stats
RUN mkdir -p /conda-envs/21dc339c1bfec2d112230fb9ed4a3121
COPY conda_definitions/assembly-stats.yaml /conda-envs/21dc339c1bfec2d112230fb9ed4a3121/environment.yaml

# Conda environment:
#   source: conda_definitions/busco.yaml
#   prefix: /conda-envs/ed54eb0e2bd56cbb474809ff03c9d5a3
#   name: busco
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - busco=5.4.6
RUN mkdir -p /conda-envs/ed54eb0e2bd56cbb474809ff03c9d5a3
COPY conda_definitions/busco.yaml /conda-envs/ed54eb0e2bd56cbb474809ff03c9d5a3/environment.yaml

# Conda environment:
#   source: conda_definitions/checkm2.yaml
#   prefix: /conda-envs/679a46a27a9c8f5ec775838a5d75a05d
#   name: checkm2_conda
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - checkm2
RUN mkdir -p /conda-envs/679a46a27a9c8f5ec775838a5d75a05d
COPY conda_definitions/checkm2.yaml /conda-envs/679a46a27a9c8f5ec775838a5d75a05d/environment.yaml

# Conda environment:
#   source: conda_definitions/curl.yaml
#   prefix: /conda-envs/f7c4e0b49f1914099f4cced5dd00117a
#   name: curl
#   channels:
#     - conda-forge
#   dependencies:
#     - curl
#     - unzip
RUN mkdir -p /conda-envs/f7c4e0b49f1914099f4cced5dd00117a
COPY conda_definitions/curl.yaml /conda-envs/f7c4e0b49f1914099f4cced5dd00117a/environment.yaml

# Conda environment:
#   source: conda_definitions/dbcan.yaml
#   prefix: /conda-envs/5bddf671d68664d662b48c7ab768155e
#   name: dbcan
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - python=3.8
#     - dbcan
RUN mkdir -p /conda-envs/5bddf671d68664d662b48c7ab768155e
COPY conda_definitions/dbcan.yaml /conda-envs/5bddf671d68664d662b48c7ab768155e/environment.yaml

# Conda environment:
#   source: conda_definitions/diamond.yaml
#   prefix: /conda-envs/1f973b92cc12d86729a390f6a8856716
#   name: diamond
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - diamond>=2.1.8
RUN mkdir -p /conda-envs/1f973b92cc12d86729a390f6a8856716
COPY conda_definitions/diamond.yaml /conda-envs/1f973b92cc12d86729a390f6a8856716/environment.yaml

# Conda environment:
#   source: conda_definitions/fasttree.yaml
#   prefix: /conda-envs/ebff814bce7bc3bc66d9a0b9b4e8126e
#   name: fasttree
#   channels:
#     - bioconda
#   dependencies:
#     - fasttree
RUN mkdir -p /conda-envs/ebff814bce7bc3bc66d9a0b9b4e8126e
COPY conda_definitions/fasttree.yaml /conda-envs/ebff814bce7bc3bc66d9a0b9b4e8126e/environment.yaml

# Conda environment:
#   source: conda_definitions/gtdbtk.yaml
#   prefix: /conda-envs/6129deec2bbe1dd5cee82b4bca12b1ae
#   name: gtdbtk
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - gtdbtk
RUN mkdir -p /conda-envs/6129deec2bbe1dd5cee82b4bca12b1ae
COPY conda_definitions/gtdbtk.yaml /conda-envs/6129deec2bbe1dd5cee82b4bca12b1ae/environment.yaml

# Conda environment:
#   source: conda_definitions/interproscan.yaml
#   prefix: /conda-envs/3edd5ee462543ff6e33cf6576cdfcffb
#   name: interproscan
#   channels: 
#     - bioconda
#   dependencies:
#     - interproscan
#   
#   # conda install -c bioconda interproscan
RUN mkdir -p /conda-envs/3edd5ee462543ff6e33cf6576cdfcffb
COPY conda_definitions/interproscan.yaml /conda-envs/3edd5ee462543ff6e33cf6576cdfcffb/environment.yaml

# Conda environment:
#   source: conda_definitions/iqtree.yaml
#   prefix: /conda-envs/108c93bf8519b05838cdca347b9bf6fa
#   name: iqtree
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - iqtree>=2
RUN mkdir -p /conda-envs/108c93bf8519b05838cdca347b9bf6fa
COPY conda_definitions/iqtree.yaml /conda-envs/108c93bf8519b05838cdca347b9bf6fa/environment.yaml

# Conda environment:
#   source: conda_definitions/kraken2.yaml
#   prefix: /conda-envs/7a36c2bda181af2bc7b3e01efd455a2d
#   name: kraken2
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults
#   dependencies:
#     - kraken2
RUN mkdir -p /conda-envs/7a36c2bda181af2bc7b3e01efd455a2d
COPY conda_definitions/kraken2.yaml /conda-envs/7a36c2bda181af2bc7b3e01efd455a2d/environment.yaml

# Conda environment:
#   source: conda_definitions/mashtree.yaml
#   prefix: /conda-envs/b62c14d70e3e16658965b4ab951392ed
#   name: mashtree
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - mashtree
RUN mkdir -p /conda-envs/b62c14d70e3e16658965b4ab951392ed
COPY conda_definitions/mashtree.yaml /conda-envs/b62c14d70e3e16658965b4ab951392ed/environment.yaml

# Conda environment:
#   source: conda_definitions/mlst.yaml
#   prefix: /conda-envs/5db696091993795c7c85a68f6df73ceb
#   name: mlst
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults    
#   dependencies:
#     - mlst
RUN mkdir -p /conda-envs/5db696091993795c7c85a68f6df73ceb
COPY conda_definitions/mlst.yaml /conda-envs/5db696091993795c7c85a68f6df73ceb/environment.yaml

# Conda environment:
#   source: conda_definitions/motulizer.yaml
#   prefix: /conda-envs/e0b1329bcca3902e264fa723669e7f96
#   name: motulizer
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - motulizer
RUN mkdir -p /conda-envs/e0b1329bcca3902e264fa723669e7f96
COPY conda_definitions/motulizer.yaml /conda-envs/e0b1329bcca3902e264fa723669e7f96/environment.yaml

# Conda environment:
#   source: conda_definitions/prokka.yaml
#   prefix: /conda-envs/88a7fe7451bb32309f7ac6670e364e56
#   name: prokka
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults # not sure about whether this one should be present
#   dependencies:
#     - prokka 
#     - openjdk<=17.0.2
RUN mkdir -p /conda-envs/88a7fe7451bb32309f7ac6670e364e56
COPY conda_definitions/prokka.yaml /conda-envs/88a7fe7451bb32309f7ac6670e364e56/environment.yaml

# Conda environment:
#   source: conda_definitions/r-clusterProfiler.yaml
#   prefix: /conda-envs/891e586b9f3c2e255e7a3c8e1d01b14d
#   name: r-clusterProfiler
#   channels:
#     - conda-forge
#     - bioconda
#   dependencies:
#     - bioconductor-clusterprofiler
#     - r-tidyverse
#     - r-jsonlite
RUN mkdir -p /conda-envs/891e586b9f3c2e255e7a3c8e1d01b14d
COPY conda_definitions/r-clusterProfiler.yaml /conda-envs/891e586b9f3c2e255e7a3c8e1d01b14d/environment.yaml

# Conda environment:
#   source: conda_definitions/roary_see-comments-in-this-file.yaml
#   prefix: /conda-envs/c510ddc9269801c6f267bbc20945cb01
#   name: roary_new
#   channels:
#     - conda-forge
#     - bioconda
#     - r
#     - defaults
#   dependencies:
#     - roary
#   
#   
#   
#   # Warning: This only works if you set the channel priority to flexible. Not strict.
#   # conda config --set channel_priority false
#   # 
#   # Install roary
#   #
#   # Then set it back with
#   # conda config --set channel_priority strict
RUN mkdir -p /conda-envs/c510ddc9269801c6f267bbc20945cb01
COPY conda_definitions/roary_see-comments-in-this-file.yaml /conda-envs/c510ddc9269801c6f267bbc20945cb01/environment.yaml

# Conda environment:
#   source: conda_definitions/seqkit.yaml
#   prefix: /conda-envs/1e9be5c81cf2e48459587271cf703755
#   name: seqkit
#   channels:
#     - bioconda
#   dependencies:
#     - seqkit
RUN mkdir -p /conda-envs/1e9be5c81cf2e48459587271cf703755
COPY conda_definitions/seqkit.yaml /conda-envs/1e9be5c81cf2e48459587271cf703755/environment.yaml

# Conda environment:
#   source: conda_definitions/snp-dists.yaml
#   prefix: /conda-envs/79addc38bfc17b635a3fa2c401ab213e
#   name: snp-dists
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - snp-dists>=0.8
RUN mkdir -p /conda-envs/79addc38bfc17b635a3fa2c401ab213e
COPY conda_definitions/snp-dists.yaml /conda-envs/79addc38bfc17b635a3fa2c401ab213e/environment.yaml

# Conda environment:
#   source: report_subpipeline/conda_definitions/r-markdown.yaml
#   prefix: /conda-envs/7ec487d44d72b8b93e28e12e17ef59c0
#   name: r-markdown
#   channels:
#     - conda-forge
#     - bioconda
#     - defaults
#     - r
#   dependencies:
#     - r-base=4.2.2
#     - r-essentials=4.2
#     - r-tidyverse=2.0.0
#     - r-dt=0.28 # 0.31 in the one that fails
#     - r-prettydoc=0.4.1
#     - r-rmarkdown=2.25
#     - r-phytools=2.0_3 # 2.1_1 i nyeste conda
#     - r-ape=5.7_1
#     - r-gridextra=2.3
#     - zip=3.0
RUN mkdir -p /conda-envs/7ec487d44d72b8b93e28e12e17ef59c0
COPY report_subpipeline/conda_definitions/r-markdown.yaml /conda-envs/7ec487d44d72b8b93e28e12e17ef59c0/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/e96caef90ba4287605b7ab60379bb5dc --file /conda-envs/e96caef90ba4287605b7ab60379bb5dc/environment.yaml && \
    mamba env create --prefix /conda-envs/756e0ce005a36bc03fd1b91447a60f6d --file /conda-envs/756e0ce005a36bc03fd1b91447a60f6d/environment.yaml && \
    mamba env create --prefix /conda-envs/21dc339c1bfec2d112230fb9ed4a3121 --file /conda-envs/21dc339c1bfec2d112230fb9ed4a3121/environment.yaml && \
    mamba env create --prefix /conda-envs/ed54eb0e2bd56cbb474809ff03c9d5a3 --file /conda-envs/ed54eb0e2bd56cbb474809ff03c9d5a3/environment.yaml && \
    mamba env create --prefix /conda-envs/679a46a27a9c8f5ec775838a5d75a05d --file /conda-envs/679a46a27a9c8f5ec775838a5d75a05d/environment.yaml && \
    mamba env create --prefix /conda-envs/f7c4e0b49f1914099f4cced5dd00117a --file /conda-envs/f7c4e0b49f1914099f4cced5dd00117a/environment.yaml && \
    mamba env create --prefix /conda-envs/5bddf671d68664d662b48c7ab768155e --file /conda-envs/5bddf671d68664d662b48c7ab768155e/environment.yaml && \
    mamba env create --prefix /conda-envs/1f973b92cc12d86729a390f6a8856716 --file /conda-envs/1f973b92cc12d86729a390f6a8856716/environment.yaml && \
    mamba env create --prefix /conda-envs/ebff814bce7bc3bc66d9a0b9b4e8126e --file /conda-envs/ebff814bce7bc3bc66d9a0b9b4e8126e/environment.yaml && \
    mamba env create --prefix /conda-envs/6129deec2bbe1dd5cee82b4bca12b1ae --file /conda-envs/6129deec2bbe1dd5cee82b4bca12b1ae/environment.yaml && \
    mamba env create --prefix /conda-envs/3edd5ee462543ff6e33cf6576cdfcffb --file /conda-envs/3edd5ee462543ff6e33cf6576cdfcffb/environment.yaml && \
    mamba env create --prefix /conda-envs/108c93bf8519b05838cdca347b9bf6fa --file /conda-envs/108c93bf8519b05838cdca347b9bf6fa/environment.yaml && \
    mamba env create --prefix /conda-envs/7a36c2bda181af2bc7b3e01efd455a2d --file /conda-envs/7a36c2bda181af2bc7b3e01efd455a2d/environment.yaml && \
    mamba env create --prefix /conda-envs/b62c14d70e3e16658965b4ab951392ed --file /conda-envs/b62c14d70e3e16658965b4ab951392ed/environment.yaml && \
    mamba env create --prefix /conda-envs/5db696091993795c7c85a68f6df73ceb --file /conda-envs/5db696091993795c7c85a68f6df73ceb/environment.yaml && \
    mamba env create --prefix /conda-envs/e0b1329bcca3902e264fa723669e7f96 --file /conda-envs/e0b1329bcca3902e264fa723669e7f96/environment.yaml && \
    mamba env create --prefix /conda-envs/88a7fe7451bb32309f7ac6670e364e56 --file /conda-envs/88a7fe7451bb32309f7ac6670e364e56/environment.yaml && \
    mamba env create --prefix /conda-envs/891e586b9f3c2e255e7a3c8e1d01b14d --file /conda-envs/891e586b9f3c2e255e7a3c8e1d01b14d/environment.yaml && \
    mamba env create --prefix /conda-envs/c510ddc9269801c6f267bbc20945cb01 --file /conda-envs/c510ddc9269801c6f267bbc20945cb01/environment.yaml && \
    mamba env create --prefix /conda-envs/1e9be5c81cf2e48459587271cf703755 --file /conda-envs/1e9be5c81cf2e48459587271cf703755/environment.yaml && \
    mamba env create --prefix /conda-envs/79addc38bfc17b635a3fa2c401ab213e --file /conda-envs/79addc38bfc17b635a3fa2c401ab213e/environment.yaml && \
    mamba env create --prefix /conda-envs/7ec487d44d72b8b93e28e12e17ef59c0 --file /conda-envs/7ec487d44d72b8b93e28e12e17ef59c0/environment.yaml && \
    mamba clean --all -y
