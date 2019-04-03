 ## R Script to read the schizophrenia TWAS polygenic risk scores
 ## You will also need a file of covariates from Pardinas et al. 2018
 # covariate file name: CLOZUK_phenotype_covariates.txt
 # With this script, you should adapt it to match the score files you want to read in
 # For this example, this is CLOZUK_GWAS_BGE_chr*_SCZ.S2.profile as the input files and PGS_SCZ_S2.csv as the output table.
 # This corresponds to the schizophrenia (SCZ) TWAS with the p-value threshold of 1 (S2).
 # Other combinations include: SCZ.S1.profile and PGS_SCZ_S1.csv; COG.S1.profile and PGS_COG_S1.csv; COG.S2.profile and PGS_COG_S2.csv.
 
 ## Set working directory
setwd("/path/to/files/")
## Load tidyverse package
library(tidyverse)

## Store the pattern of filepath names in a vector called 'filenames'
filenames <- list.files(path = "path/to/files/", pattern = ".profile")
## Get names without ".profile" and store in "names"
names <- substr(filenames, 1, 158)
## Read in all data frames using a 'for' loop 
for (i in names) {
  filepath <- file.path(paste(i , sep = ""))
  assign(i, read.csv(filepath, sep = ""))
}

## Store SCZ dataset files from directory with read.csv and put into a list
## Retain columns FID, IID, SCORE and CNT in each chromosome for the SCZ dataset of polygenic risk scores 

SCZ_1 <- CLOZUK_GWAS_BGE_chr1_SCZ.S2.profile
SCZ_1_cols <- select(SCZ_1, FID, IID, SCORE, CNT)
names(SCZ_1_cols) <- c("FID", "IID", "chr1.SCZ.SCORE", "chr1.SCZ.CNT")
SCZ_1_cols <- as_tibble(SCZ_1_cols)

SCZ_2 <- CLOZUK_GWAS_BGE_chr2_SCZ.S2.profile
SCZ_2_cols <- select(SCZ_2, FID, IID, SCORE, CNT)
names(SCZ_2_cols) <- c("FID", "IID", "chr2.SCZ.SCORE", "chr2.SCZ.CNT")
SCZ_2_cols <- as_tibble(SCZ_2_cols)

SCZ_3 <- CLOZUK_GWAS_BGE_chr3_SCZ.S2.profile
SCZ_3_cols <- select(SCZ_3, FID, IID, SCORE, CNT)
names(SCZ_3_cols) <- c("FID", "IID", "chr3.SCZ.SCORE", "chr3.SCZ.CNT")
SCZ_3_cols <- as_tibble(SCZ_3_cols)

SCZ_4 <- CLOZUK_GWAS_BGE_chr4_SCZ.S2.profile
SCZ_4_cols <- select(SCZ_4, FID, IID, SCORE, CNT)
names(SCZ_4_cols) <- c("FID", "IID", "chr4.SCZ.SCORE", "chr4.SCZ.CNT")
SCZ_4_cols <- as_tibble(SCZ_4_cols)

SCZ_5 <- CLOZUK_GWAS_BGE_chr5_SCZ.S2.profile
SCZ_5_cols <- select(SCZ_5, FID, IID, SCORE, CNT)
names(SCZ_5_cols) <- c("FID", "IID", "chr5.SCZ.SCORE", "chr5.SCZ.CNT")
SCZ_5_cols <- as_tibble(SCZ_5_cols)

SCZ_9 <- CLOZUK_GWAS_BGE_chr9_SCZ.S2.profile
SCZ_9_cols <- select(SCZ_9, FID, IID, SCORE, CNT)
names(SCZ_9_cols) <- c("FID", "IID", "chr9.SCZ.SCORE", "chr9.SCZ.CNT")
SCZ_9_cols <- as_tibble(SCZ_9_cols)

SCZ_10 <- CLOZUK_GWAS_BGE_chr10_SCZ.S2.profile
SCZ_10_cols <- select(SCZ_10, FID, IID, SCORE, CNT)
names(SCZ_10_cols) <- c("FID", "IID", "chr10.SCZ.SCORE", "chr10.SCZ.CNT")
SCZ_10_cols <- as_tibble(SCZ_10_cols)

SCZ_12 <- CLOZUK_GWAS_BGE_chr12_SCZ.S2.profile
SCZ_12_cols <- select(SCZ_12, FID, IID, SCORE, CNT)
names(SCZ_12_cols) <- c("FID", "IID", "chr12.SCZ.SCORE", "chr12.SCZ.CNT")
SCZ_12_cols <- as_tibble(SCZ_12_cols)

SCZ_15 <- CLOZUK_GWAS_BGE_chr15_SCZ.S2.profile
SCZ_15_cols <- select(SCZ_15, FID, IID, SCORE, CNT)
names(SCZ_15_cols) <- c("FID", "IID", "chr15.SCZ.SCORE", "chr15.SCZ.CNT")
SCZ_15_cols <- as_tibble(SCZ_15_cols)

SCZ_16 <- CLOZUK_GWAS_BGE_chr16_SCZ.S2.profile
SCZ_16_cols <- select(SCZ_16, FID, IID, SCORE, CNT)
names(SCZ_16_cols) <- c("FID", "IID", "chr16.SCZ.SCORE", "chr16.SCZ.CNT")
SCZ_16_cols <- as_tibble(SCZ_16_cols)

SCZ_17 <- CLOZUK_GWAS_BGE_chr17_SCZ.S2.profile
SCZ_17_cols <- select(SCZ_17, FID, IID, SCORE, CNT)
names(SCZ_17_cols) <- c("FID", "IID", "chr17.SCZ.SCORE", "chr17.SCZ.CNT")
SCZ_17_cols <- as_tibble(SCZ_17_cols)

SCZ_19 <- CLOZUK_GWAS_BGE_chr19_SCZ.S2.profile
SCZ_19_cols <- select(SCZ_19, FID, IID, SCORE, CNT)
names(SCZ_19_cols) <- c("FID", "IID", "chr19.SCZ.SCORE", "chr19.SCZ.CNT")
SCZ_19_cols <- as_tibble(SCZ_19_cols)

SCZ_22 <- CLOZUK_GWAS_BGE_chr22_SCZ.S2.profile
SCZ_22_cols <- select(SCZ_22, FID, IID, SCORE, CNT)
names(SCZ_22_cols) <- c("FID", "IID", "chr22.SCZ.SCORE", "chr22.SCZ.CNT")
SCZ_22_cols <- as_tibble(SCZ_22_cols)


## Merge 22 chromosomes into 12 data frame by FID and IID. Expected result: 46 columns for each out of SCZ, blood, an brain datasets (FID, IID, 22 score columns, 22 CNT columns)
phenotype <- read_table2("~/path/to/file/CLOZUK_phenotype_covariates.txt") %>%
  as_tibble()

merged_SCZ <- list(SCZ_1_cols, SCZ_2_cols, SCZ_3_cols, SCZ_4_cols, SCZ_5_cols, SCZ_9_cols, SCZ_10_cols, SCZ_12_cols, SCZ_15_cols, SCZ_16_cols, SCZ_17_cols,  SCZ_19_cols, SCZ_22_cols) %>% reduce(left_join)



## Also, I have realised that alongside your scores, you will also want the individuals' phenotype and some covariates (principal components to account for ancestry and sex). 
## Include Phenotype (SCZ), covariates (PC and sex) and score from 
## CLOZUK_phenotype_covariates.txt 
merged_SCZ <- left_join(merged_SCZ, phenotype, by = c('FID', 'IID'))



# Getting the summed data across rows to mutate -- TOTAL SCORES
score_sums <- merged_SCZ[,3]+ merged_SCZ[,5]+ merged_SCZ[,7]+ merged_SCZ[,9]+merged_SCZ[,11]+merged_SCZ[,13]+merged_SCZ[,15]+merged_SCZ[,17]+merged_SCZ[,19]+merged_SCZ[,21]+merged_SCZ[,23]+merged_SCZ[,25]+merged_SCZ[,27]


## Getting the summed data across rows to mutate -- TOTAL CNT
CNT_sums <- merged_SCZ[,4]+ merged_SCZ[,6]+ merged_SCZ[,8]+ merged_SCZ[,10]+merged_SCZ[,12]+merged_SCZ[,14]+merged_SCZ[,16]+merged_SCZ[,18]+merged_SCZ[,20]+merged_SCZ[,22]+merged_SCZ[,24]+merged_SCZ[,26]+merged_SCZ[,28]



## Binding datasets together to create two new columns called total.SCORE and total.CNT
merged_SCZ_mutate <- cbind(merged_SCZ, score_sums, CNT_sums)


names(merged_SCZ_mutate)
## Changing names for total.SCORE and total.CNT
colnames(merged_SCZ_mutate)[46] <- "total.SCORE"
colnames(merged_SCZ_mutate)[47] <- "total.CNT"


## Create a new column which is your standardized PRS:
## e.g. blood$blood.zSCORE<-(blood$blood.total.SCORE-mean(blood$blood.total.SCORE,na.rm=TRUE))/sd(blood$blood.total.SCORE,na.rm=TRUE)

sum(is.na(merged_SCZ_mutate))
merged_SCZ_mutate <- na.omit(merged_SCZ_mutate)

merged_SCZ_mutate_standardise <- mutate(merged_SCZ_mutate, "SCZ.ZSCORE" = (merged_SCZ_mutate$total.SCORE - mean(merged_SCZ_mutate$total.SCORE, na.rm = TRUE))/sd(merged_SCZ_mutate$total.SCORE, na.rm = TRUE))

sum(is.na(merged_SCZ_mutate_standardise))
merged_SCZ_mutate_standardise <- na.omit(merged_SCZ_mutate_standardise)


## Retain only the FID, IID, zSCORE, total.CNT columns

SCZ_ready <- select(merged_SCZ_mutate_standardise,matches("FID"), matches("IID"), matches("SCZ.ZSCORE"), matches("total.CNT")) %>% as_tibble()


# Write the table out and name it 'PGS_SCZ_S2.csv'
regression_ready <- full_join(SCZ_ready, phenotype)
setwd("~/path/to/files/")
write.table(regression_ready, "PGS_SCZ_S2.csv", sep = ",", row.names = FALSE) ## written to 'SCORES'

# Check the max CNT (maximum number of SNPs going into scores) is sensible
summary(regression_ready)
