## Generating TWAS SNP list
library(tidyverse)

# This creates a linker text file with variables SNP and ID (gene)

# Change directory to new working directory and clear the workspace
setwd("~/Google Drive/Postgrad/4 Case Study MET584/TWAS/COG")
rm(list = ls())

# Read in the linker text file

linker <- read_table2("Fusion_SNP_gene_linker.txt", col_names = FALSE) %>%
  as_tibble()


# Add column names SNP ID
colnames(linker) <- c("SNP","ID")


# Read in TWAS results file
cog.twas <- read_delim("merged_sig_P_COG.tsv", "\t", escape_double = FALSE, na = "NA", trim_ws = TRUE) %>% as_tibble()

names(cog.twas)

# In the TWAS results, retain only gene name (ID), TWAS Z-score (TWAS.Z) and TWAS P-value (TWAS.P)
names(cog.twas)
cog.twas <- cog.twas[,c(1,17,18)]
cog.twas <- select(cog.twas, ID, TWAS.Z, TWAS.P)
head(cog.twas)


# Merge the dataframes using ID as an index 
merge_cog.twas <- merge(cog.twas, linker, by = "ID", all.x = TRUE) %>% as_tibble()
head(merge_cog.twas) ## Checking it's merged properly

sum(is.na(merge_cog.twas))
merge_cog.twas <- na.omit(merge_cog.twas)

# Order by SNP then TWAS.P so that the most significant TWAS P-value is listed first

merge_cog.twas <- merge_cog.twas[with(merge_cog.twas, order(merge_cog.twas$SNP, merge_cog.twas$TWAS.P)), ]

head(merge_cog.twas)


# Reduce to one entry per SNP 
# This retains the most significant P-value association in instances where a SNP maps to more than one gene
uniq_cog.twas <- merge_cog.twas[match(unique(merge_cog.twas$SNP), merge_cog.twas$SNP),]

head(uniq_cog.twas)
dim(uniq_cog.twas)

# Write to file
write.table(uniq_cog.twas,file = "SNP_TWAS_cog_unique.txt",col.names = TRUE,row.names = FALSE, quote = FALSE, sep = " ")
View(uniq_cog.twas)

