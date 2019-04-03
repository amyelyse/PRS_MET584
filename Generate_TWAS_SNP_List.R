## Generating TWAS SNP list


# This creates a linker text file with variables SNP and ID (gene)

# Change directory to new working directory and clear the workspace
setwd("~/Google Drive/Postgrad/4 Case Study MET584/TWAS")
rm(list = ls())

# Read in the linker text file

linker <- read_table2("Fusion_SNP_gene_linker.txt", col_names = FALSE) %>%
  as_tibble()


# Add column names SNP ID
colnames(linker) <- c("SNP","ID")
head(linker)

# Read in TWAS results file
scz.twas <- read.delim("~/Google Drive/Postgrad/4 Case Study MET584/TWAS/merged_sig_P.tsv") %>% as_tibble()


# In the TWAS results, retain only gene name (ID), TWAS Z-score (TWAS.Z) and TWAS P-value (TWAS.P)
names(scz.twas)
scz.twas <- scz.twas[,c(1,17,18)]


# Merge the dataframes using ID as an index 
merge_scz.twas <- merge(linker, scz.twas ,by = "ID", all = TRUE)
head(merge_scz.twas) ## Checking it's merged properly


# Order by SNP then TWAS.P so that the most significant TWAS P-value is listed first

merge_scz.twas <- na.omit(merge_scz.twas)
merge_scz.twas <- merge_scz.twas[with(merge_scz.twas, order(merge_scz.twas$SNP, merge_scz.twas$TWAS.P)), ]



# Reduce to one entry per SNP 
# This retains the most significant P-value association in instances where a SNP maps to more than one gene
uniq_scz.twas <- merge_scz.twas[match(unique(merge_scz.twas$SNP), merge_scz.twas$SNP),]


# Write to file
write.table(uniq_scz.twas,file = "SNP_TWAS_SCZ_unique.txt",col.names = TRUE,row.names = FALSE, quote = FALSE, sep = " ")
