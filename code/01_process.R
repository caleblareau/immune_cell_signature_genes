library(data.table)
library(reshape2)
library(dplyr)

mdf <- fread("../data/signature_genes.txt", fill = TRUE) %>%
  data.frame() %>% reshape2::melt(measure.vars = 1:34) %>%
  filter(value != "") %>% mutate(short = gsub("Hay_Bone_Marrow_", "", variable))

write.table( mdf[,c(3,2)] %>% setnames(c("celltype", "marker_gene")), 
             file = "../ICA_marker_genes.tsv", sep = "\t", quote = FALSE, row.names = FALSE, col.names = TRUE)
