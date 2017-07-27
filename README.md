## Overview
A statistical tool to identify diffentially expressed genes from two transcriptomes of an individual. The method iDEG takes RNA-Seq data as input and outputs a probability and an effect size of differential expression for each gene.

## Installation
```{r}
devtools::install_github("QikeLi/iDEG", build_vignettes=TRUE, 
   repos=BiocInstaller::biocinstallRepos(),
   dependencies=TRUE, type="source")
```
