
# Visualization, Interpretation, and Down-Stream Functional Enrichment Analysis of Genes Expression in Glioblastoma Dataset
Authors (@slack): Malak Abdelfattah Soula (@Malak), Esraa El-zoghby (@EsZo), Zeyad Ashraf (@Zashraf03), Alatise Monsurah (@AlatiseMB), 
Ahmed Abdel-Maqsoud (@Abdel-Maqsoud), Samuel Aladegbaiye (@Samuel...)

[code link](https://github.com/MalakSoula/Glioblastoma-/blob/main/HackBio.R)

In our analysis, we provided heatmaps for both diverging and sequential color palettes to facilitate visualization of gene expression across samples effectively.
The diverging palette is good for showing deviation from a midpoint-such as zero when one is using Z-scores. This allows for the easy identification of over- and under-expressed genes. 
On the other hand, the sequential palette shows gradual differences between low and high levels of expression, thus allowing one to recognize the trend in the intensity of gene expression.

 ![Picture1](https://github.com/user-attachments/assets/984df331-2a4c-42e7-b6ad-a7cc54758463)

![Picture2](https://github.com/user-attachments/assets/f6683fc9-26f7-4a38-9cc3-bce38bf46a06)

The first heatmaps showed an overview of the gene expression, where there was a lot of variation among the samples.
Specific patterns and trends were hard to recognize since the data had not been clustered yet.
That showed some genes were highly expressed across many samples, as depicted in dark blue color, and others in light green color were downregulated. 

![Picture3](https://github.com/user-attachments/assets/088d33fd-48ea-47b5-9fdd-cbee072d82de)

![Picture4](https://github.com/user-attachments/assets/94b41495-46c6-4a6d-af43-d8157f057243)


We then did cluster of samples based on expression similarity and found some groupings. Similar expression profiles placed the samples closer together, 
thus defining subgroups of shared gene expression patterns. This clustering underlined biological relationships by suggesting that these sample groups are 
probably influenced by similar underlying biological processes.

![Picture5](https://github.com/user-attachments/assets/636a8eb7-c797-4db0-bf5a-d7d1bfd88cda)

![Picture6](https://github.com/user-attachments/assets/7ae13e89-0ded-4a05-96b3-685cf9e2b96d)

                        
We also carried out unsupervised clustering of genes by co-expression across the samples, where genes that were similarly behaving are clustered.
Indeed, patterns of coregulated genes emerge where groups of genes show consistent expression in a subset of various samples (dark blue regions). 
This can help with gene clusters likely to be involved in the same pathways or biological functions

The most powerful visualization came from clustering both samples and genes, reflecting very coherent patterns of co-expressed genes shared between specific sample groups. 
It enriches the relationship of sample profiles with gene behaviors and offers so much more insightful views into the biological significance of subtypes
which may be distinct at molecular levels or active pathways.

## Enrichment analysis:
The provided table lists the top 10 enriched pathways based on their significance, the number of genes, the total number of genes, and the fold enrichment.

![Picture7](https://github.com/user-attachments/assets/1abb91dc-1ab5-43d0-8644-990cff499673)

![Picture8](https://github.com/user-attachments/assets/2058a621-cccc-4dbc-bfd7-92efc26781c9)

### Top 3 pathways:
Among the important pathways, we listed the top three ranked by significance according to their Enrichment FDR.

1-	Alpha-Linolenic Acid Metabolism: This pathway suggests a significant role in fatty acid metabolism.

2-	Linoleic Acid Metabolism: Like alpha-linolenic acid, linoleic acid is another essential fatty acid.

3-	Viral Protein Interaction with Cytokine and Cytokine Receptor: This pathway suggests a significant interaction between viral proteins and host immune signaling mechanisms. 

