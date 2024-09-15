
# Visualization, Interpretation, and Down-Stream Functional Enrichment Analysis of Genes Expression in Glioblastoma Dataset
Authors (@slack): Malak Abdelfattah Soula (@Malak), Esraa El-zoghby (@EsZo), Zeyad Ashraf (@Zashraf03), Alatise Monsurah (@AlatiseMB), 
Ahmed Abdel-Maqsoud (@Abdel-Maqsoud), Samuel Aladegbaiye (@Samuel...)

[code link](https://github.com/MalakSoula/Glioblastoma-/blob/main/HackBio.R)

In our analysis, we provided heatmaps for both diverging and sequential color palettes to facilitate the effective visualization of gene expression across samples.
The diverging palette is good for showing deviation from a midpoint, such as zero when using Z-scores. This allows for the easy identification of over- and under-expressed genes. 
On the other hand, the sequential palette shows gradual differences between low and high levels of expression, thus allowing one to recognize the trend in the intensity of gene expression. The Z-score values were calculated by using the scale function in R. This function utilizes the following formula z= (x−μ)/σ, Where x is the individual value, μ is the mean of the values in that column, and σ is the standard deviation of the values in that column.

 

![Picture1](https://github.com/user-attachments/assets/984df331-2a4c-42e7-b6ad-a7cc54758463)

![Picture2](https://github.com/user-attachments/assets/f6683fc9-26f7-4a38-9cc3-bce38bf46a06)

The first heatmaps showed an overview of gene expression, which varied widely among the samples.
Specific patterns and trends were complex since the data had yet to be clustered.

![Picture3](https://github.com/user-attachments/assets/088d33fd-48ea-47b5-9fdd-cbee072d82de)

![Picture4](https://github.com/user-attachments/assets/94b41495-46c6-4a6d-af43-d8157f057243)


We then clustered samples based on expression similarity and found some groupings. Similar expression profiles placed the samples closer together, 
thus defining subgroups of shared gene expression patterns. So, by following the pattern expressed in the heatmaps, we separated the samples into two groups, which helped us generate the p values and calculate the fold changes.

![Picture5](https://github.com/user-attachments/assets/636a8eb7-c797-4db0-bf5a-d7d1bfd88cda)

![Picture6](https://github.com/user-attachments/assets/7ae13e89-0ded-4a05-96b3-685cf9e2b96d)

The most powerful visualization came from clustering both samples and genes, reflecting very coherent patterns of co-expressed genes shared between specific sample groups. 
It enriches the relationship of sample profiles with gene behaviors. It offers much more insight into the biological significance of subtypes, which may be distinct at molecular levels or active pathways.
## P Values and Fold Change Calculation:
P values were calculated using a t-test on the two groups of samples in R, and fold changes were calculated by estimating the means of each row of the first and second groups and subtracting their log2. (Fold change = log2(group2_mean)—log2(group1_mean).) We then used these fold changes to determine if the genes were up or downregulated and used the p values to estimate their significance.Where the threshold 
for the p values where anything less than 0.05 for p values and threshold for fold change was anything higher than 1.5 was considered up-regulated, and any lower than -1.5 is downregulated

## Enrichment analysis:
The provided table lists the top 10 enriched pathways based on their significance, the number of genes, the total number of genes, and the fold enrichment.

![Picture7](https://github.com/user-attachments/assets/1abb91dc-1ab5-43d0-8644-990cff499673)

![Picture8](https://github.com/user-attachments/assets/2058a621-cccc-4dbc-bfd7-92efc26781c9)

### Top 3 pathways:
Among the important pathways, we listed the top three ranked by significance according to their Enrichment FDR.

1-	Alpha-Linolenic Acid Metabolism: This pathway suggests a significant role in fatty acid metabolism [1].

2-	Linoleic Acid Metabolism: Like alpha-linolenic acid, linoleic acid is another essential fatty acid [2].

3-	Viral Protein Interaction with Cytokine and Cytokine Receptor: This pathway suggests a significant interaction between viral proteins and host immune signaling mechanisms [3]. 

# References:

1- Reactome.org. (2024). alpha-linolenic acid (ALA) metabolism. [online] Available at: https://reactome.org/content/detail/R-HSA-2046106#:~:text=Alpha%2Dlinolenic%20acid%20(ALA%2C [Accessed 15 Sep. 2024].

2- Gunstone, F.D. (2003). FATTY ACIDS | Gamma-linolenic Acid. [online] ScienceDirect. Available at: https://www.sciencedirect.com/science/article/abs/pii/B012227055X00448X.

3- Genome.jp. (2024). KEGG PATHWAY: Viral protein interaction with cytokine and cytokine receptor - Homo sapiens (human). [online] Available at: 
   https://www.genome.jp/pathway/hsa04061#:~:text=Homo%20sapiens%20(human)- [Accessed 15 Sep. 2024].

