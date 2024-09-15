library(tidyverse)
library(gplots)
library(RColorBrewer)

url <- 'https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv'
data1 <- read.csv(url, header = TRUE, row.names = 1)

summary(data1)
data_z <- t(scale(t(data1)))

sum(is.na(data_z))  # Check for NAs
sum(is.infinite(data_z))  # Check for Inf values

# Generating heatmap 
diverging_color <- colorRampPalette(brewer.pal(11, "RdYlBu"))(100) 
sequential_color <- colorRampPalette(brewer.pal(9, "GnBu"))(100)

dev.new(width = 16, height = 16); heatmap.2(t(data_z), col = diverging_color, trace = "none", dendrogram = "both", 
                                            scale = "none", margins = c(16, 16), main = "Diverging color heatmap without clustering", 
                                            Colv = FALSE, key = TRUE, key.title = "Z-score", key.xlab = "Expression", 
                                            keysize = 1, Rowv = FALSE, distfun = function(x) dist(x, method = "maximum"),
                                            hclustfun = function(x) hclust(x, method = "complete"))

dev.new(width = 16, height = 16); heatmap.2(t(data_z), col = sequential_color, trace = "none", dendrogram = "both", 
                                            scale = "none", margins = c(16, 16), main = "Sequential color heatmap without clustering", 
                                            Colv = FALSE, key = TRUE, key.title = "Z-score", key.xlab = "Expression", 
                                            keysize = 1, Rowv = FALSE, distfun = function(x) dist(x, method = "maximum"),
                                            hclustfun = function(x) hclust(x, method = "complete"))


# Define tumor and control samples
group_1 <- data1[, c("TCGA.14.0736.02A.01R.2005.01", "TCGA.14.1402.02A.01R.2005.01", "TCGA.19.0957.02A.11R.2005.01", "TCGA.19.4065.02A.11R.2005.01", "TCGA.06.0152.02A.01R.2005.01")]
group_2 <- data1[, c("TCGA.19.5960.01A.11R.1850.01", "TCGA.02.2483.01A.01R.1849.01", "TCGA.06.2570.01A.01R.1849.01", "TCGA.06.5410.01A.01R.1849.01", "TCGA.14.0781.01B.01R.1849.01")]


# Calculate fold change
group_1_mean <- rowMeans(group_1)
group_2_mean <- rowMeans(group_2)
fold_change <- log2(group_2_mean) - log2(group_1_mean)
fold_change

# Calculate P value
p_value <- apply(data1, 1, function(row) {
  t.test(row[1:5], row[6:10])$p.value
})
p_value

#visualise FC and -ve pval
dev.new(width = 16, height = 16); plot(fold_change, -log10(p_value))

# Combine results into a data frame
results <- data.frame(FoldChange = fold_change, PValue = p_value)

# View the results
print(results)

# calculate up and down-regulated genes
up_regulated <- results %>%
  filter(FoldChange > 1.5, PValue < 0.05)

down_regulated <- results %>%
  filter(FoldChange < -1.5, PValue < 0.05)
up_regulated
down_regulated
                                            
# save up and down-regulated genes
write.csv(up_regulated,"up_regulated_genes.csv", row.names = FALSE)
write.csv(down_regulated,"down_regulated_genes.csv", row.names = FALSE)                                            

## Enrichment analysis 

pathways <- data.frame(
  Pathway = c("Alpha-Linolenic acid metabolism", 
              "Linoleic acid metabolism",
              "Viral protein interaction with cytokine and cytokine receptor", 
              "Fat digestion and absorption",
              "Protein digestion and absorption"),
  EnrichmentFDR = c(1.3E-02, 1.7E-02, 3.1E-05, 3.9E-02, 2.3E-03),
  nGenes = c(3, 3, 8, 3, 6),
  PathwayGenes = c(26, 30, 99, 43, 103),
  FoldEnrichment = c(18.2, 15.8, 12.8, 11, 9.2)
)

pathways$NegLog10FDR <- -log10(pathways$EnrichmentFDR)

# plot top pathways
dev.new(width = 16, height = 16); ggplot(pathways, aes(x = Pathway, y = nGenes, size = NegLog10FDR, color = NegLog10FDR)) +
  geom_point(alpha = 0.7) +  # Adjust alpha for transparency
  scale_size(range = c(3, 15), name = "-log10(FDR)") +  # Size range for bubbles
  scale_color_gradient(low = "lightblue", high = "blue") +  # Color gradient
  labs(title = "Top 5 Pathways by Number of Genes",
       x = "Pathways",
       y = "Number of Genes") +
  theme_minimal() +  # Clean theme
  theme(axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x labels
        plot.title = element_text(hjust = 0.5))  # Center title

