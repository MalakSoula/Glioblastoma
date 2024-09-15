 # Analysis of Genes Expression in Glioblastoma Dataset
 # Description:
 
 This repository contains the code and all the analysis results emanating from an investigation into gene expression patterns in a Glioblastoma dataset
 We utilized various techniques for visualization, interpretation, and enrichment in order to make these expressions functionally meaningful.

# Requirements:

1- R (version 4.0 or later)

2- Required R packages: gplots, ggplot2, RColorBrewer

# Installation:

Install the necessary R packages using the following commands:
install.packages(c("gplots", "RColorBrewer", "ggplot2"))

 # Contents:
1- HackBio.R: The primary R script used for performing data analysis and visualizations.

2- up_regulated_genes.csv: A CSV file containing the list of up-regulated genes with their fold changes and p-values.

3- down_regulated_genes.csv: A CSV file containing the list of down-regulated genes with their fold changes and p-values.

4- enrichment.csv: A CSV file summarizing the top enriched pathways based on significance, number of genes, and fold enrichment.

# Usage
1- Load the Data
The script retrieves gene expression data from a specified URL.

2- Generate Heatmaps
The script creates multiple heatmaps to illustrate gene expression patterns, utilizing various color palettes and clustering methods.

3- Analyze Gene Expression
 The script calculates fold changes, log2 fold changes, and p-values for each gene to assess differential expression.

4- Identify Differentially Expressed Genes
Genes that are significantly upregulated or downregulated are identified based on the calculated fold change and p-values
Results are saved as CSV files for further investigation.

4- Visualize Pathway Enrichment
The script produces bubble plot to highlight the most significant pathways based on gene count and their associated significance levels.

# Instructions
1- Place the R script in your working directory.

2- Execute the R script to perform the analysis.
 
