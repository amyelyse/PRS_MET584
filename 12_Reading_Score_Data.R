## IMPORTANT: THIS SCRIPT IS WRITTEN TO PROCESS THE S1.PROFILE FILES.
## To process the S2 files, change all of the 'S1' in this script to 'S2'
## In R, this can be achieved by clicking on 'edit' -> 'replace and find'


## Set working directory
setwd("path/to/files")

## Load tidyverse package
library(tidyverse)

## Store the pattern of filepath names in a vector called 'filenames'
filenames <- list.files(path = "/path/to/files/", pattern = "CLOZUK_GWAS_BGE_chr+.*profile")

## Get names without ".profile" and store in "names". 1 - 66 assumes there are 66 files in the directory.
names <- substr(filenames, 1, 66)

## Read in all data frames using a 'for' loop and assign names
for (i in names) {
  filepath <- file.path(paste(i , sep = ""))
  assign(i, read.csv(filepath, sep = ""))
}


## Assign a simpler name to each file for .S1 profile file for the full datset
## Select columns FID, IID, chr1.full.SCORE, and chr.1.full.CNT and change the column names accordingly
## Convert this dataframe into a tibble for easier navigation with the tidyverse package
## Repeat for all 22 chromosome full dataset files in the directory

full_1 <- CLOZUK_GWAS_BGE_chr1_full.S1.profile
full_1_cols <- select(full_1, FID, IID, SCORE, CNT)
names(full_1_cols) <- c("FID", "IID", "chr1.full.SCORE", "chr1.full.CNT")
full_1_cols <- as_tibble(full_1_cols)


full_2 <- CLOZUK_GWAS_BGE_chr2_full.S1.profile
full_2_cols <- select(full_2, FID, IID, SCORE, CNT)
names(full_2_cols) <- c("FID", "IID", "chr2.full.SCORE", "chr2.full.CNT")
full_2_cols <- as_tibble(full_2_cols)

full_3 <- CLOZUK_GWAS_BGE_chr1_full.S1.profile
full_3_cols <- select(full_1, FID, IID, SCORE, CNT)
names(full_3_cols) <- c("FID", "IID", "chr3.full.SCORE", "chr3.full.CNT")
full_3_cols <- as_tibble(full_3_cols)

full_4 <- CLOZUK_GWAS_BGE_chr4_full.S1.profile
full_4_cols <- select(full_4, FID, IID, SCORE, CNT)
names(full_4_cols) <- c("FID", "IID", "chr4.full.SCORE", "chr4.full.CNT")
full_4_cols <- as_tibble(full_4_cols)

full_5 <- CLOZUK_GWAS_BGE_chr5_full.S1.profile
full_5_cols <- select(full_5, FID, IID, SCORE, CNT)
names(full_5_cols) <- c("FID", "IID", "chr5.full.SCORE", "chr5.full.CNT")
full_5_cols <- as_tibble(full_5_cols)

full_6 <- CLOZUK_GWAS_BGE_chr6_full.S1.profile
full_6_cols <- select(full_6, FID, IID, SCORE, CNT)
names(full_6_cols) <- c("FID", "IID", "chr6.full.SCORE", "chr6.full.CNT")
full_6_cols <- as_tibble(full_6_cols)

full_7 <- CLOZUK_GWAS_BGE_chr7_full.S1.profile
full_7_cols <- select(full_7, FID, IID, SCORE, CNT)
names(full_7_cols) <- c("FID", "IID", "chr7.full.SCORE", "chr7.full.CNT")
full_7_cols <- as_tibble(full_7_cols)

full_8 <- CLOZUK_GWAS_BGE_chr8_full.S1.profile
full_8_cols <- select(full_8, FID, IID, SCORE, CNT)
names(full_8_cols) <- c("FID", "IID", "chr8.full.SCORE", "chr8.full.CNT")
full_8_cols <- as_tibble(full_8_cols)

full_9 <- CLOZUK_GWAS_BGE_chr9_full.S1.profile
full_9_cols <- select(full_9, FID, IID, SCORE, CNT)
names(full_9_cols) <- c("FID", "IID", "chr9.full.SCORE", "chr9.full.CNT")
full_9_cols <- as_tibble(full_9_cols)

full_10 <- CLOZUK_GWAS_BGE_chr10_full.S1.profile
full_10_cols <- select(full_10, FID, IID, SCORE, CNT)
names(full_10_cols) <- c("FID", "IID", "chr10.full.SCORE", "chr10.full.CNT")
full_10_cols <- as_tibble(full_10_cols)

full_11 <- CLOZUK_GWAS_BGE_chr11_full.S1.profile
full_11_cols <- select(full_11, FID, IID, SCORE, CNT)
names(full_11_cols) <- c("FID", "IID", "chr11.full.SCORE", "chr11.full.CNT")
full_11_cols <- as_tibble(full_11_cols)

full_12 <- CLOZUK_GWAS_BGE_chr12_full.S1.profile
full_12_cols <- select(full_12, FID, IID, SCORE, CNT)
names(full_12_cols) <- c("FID", "IID", "chr12.full.SCORE", "chr12.full.CNT")
full_12_cols <- as_tibble(full_12_cols)

full_13 <- CLOZUK_GWAS_BGE_chr13_full.S1.profile
full_13_cols <- select(full_13, FID, IID, SCORE, CNT)
names(full_13_cols) <- c("FID", "IID", "chr13.full.SCORE", "chr13.full.CNT")
full_13_cols <- as_tibble(full_13_cols)

full_14 <- CLOZUK_GWAS_BGE_chr14_full.S1.profile
full_14_cols <- select(full_14, FID, IID, SCORE, CNT)
names(full_14_cols) <- c("FID", "IID", "chr14.full.SCORE", "chr14.full.CNT")
full_14_cols <- as_tibble(full_14_cols)

full_15 <- CLOZUK_GWAS_BGE_chr5_full.S1.profile
full_15_cols <- select(full_15, FID, IID, SCORE, CNT)
names(full_15_cols) <- c("FID", "IID", "chr15.full.SCORE", "chr15.full.CNT")
full_15_cols <- as_tibble(full_15_cols)

full_16 <- CLOZUK_GWAS_BGE_chr16_full.S1.profile
full_16_cols <- select(full_16, FID, IID, SCORE, CNT)
names(full_16_cols) <- c("FID", "IID", "chr16.full.SCORE", "chr16.full.CNT")
full_16_cols <- as_tibble(full_16_cols)

full_17 <- CLOZUK_GWAS_BGE_chr17_full.S1.profile
full_17_cols <- select(full_17, FID, IID, SCORE, CNT)
names(full_17_cols) <- c("FID", "IID", "chr17.full.SCORE", "chr17.full.CNT")
full_17_cols <- as_tibble(full_17_cols)

full_18 <- CLOZUK_GWAS_BGE_chr18_full.S1.profile
full_18_cols <- select(full_18, FID, IID, SCORE, CNT)
names(full_18_cols) <- c("FID", "IID", "chr18.full.SCORE", "chr18.full.CNT")
full_18_cols <- as_tibble(full_18_cols)

full_19 <- CLOZUK_GWAS_BGE_chr19_full.S1.profile
full_19_cols <- select(full_19, FID, IID, SCORE, CNT)
names(full_19_cols) <- c("FID", "IID", "chr19.full.SCORE", "chr19.full.CNT")
full_19_cols <- as_tibble(full_19_cols)

full_20 <- CLOZUK_GWAS_BGE_chr20_full.S1.profile
full_20_cols <- select(full_20, FID, IID, SCORE, CNT)
names(full_20_cols) <- c("FID", "IID", "chr20.full.SCORE", "chr20.full.CNT")
full_20_cols <- as_tibble(full_20_cols)
full_20_cols

full_21 <- CLOZUK_GWAS_BGE_chr21_full.S1.profile
full_21_cols <- select(full_21, FID, IID, SCORE, CNT)
names(full_21_cols) <- c("FID", "IID", "chr21.full.SCORE", "chr21.full.CNT")
full_21_cols <- as_tibble(full_21_cols)

full_22 <- CLOZUK_GWAS_BGE_chr22_full.S1.profile
full_22_cols <- select(full_22, FID, IID, SCORE, CNT)
names(full_22_cols) <- c("FID", "IID", "chr22.full.SCORE", "chr22.full.CNT")
full_22_cols <- as_tibble(full_22_cols)

## Import phenotype dataset
phenotype <- read_table2("/path/to/file/CLOZUK_phenotype_covariates.txt") %>%
  as_tibble()

## Merge 22 chromosomes into 12 data frame by FID and IID. Expected result: 46 columns for each out of full, blood, an brain datasets (FID, IID, 22 score columns, 22 CNT columns)
merged_full <- list(full_1_cols, full_2_cols, full_3_cols, full_4_cols, full_5_cols, full_6_cols, full_7_cols, full_8_cols, full_9_cols, full_10_cols, full_11_cols, full_12_cols, full_13_cols, full_14_cols, full_15_cols, full_16_cols, full_17_cols, full_18_cols, full_19_cols, full_20_cols, full_21_cols, full_22_cols) %>% reduce(left_join, by = c('FID','IID'))


## Alongside your scores, put the individuals' phenotype and some covariates (principal components to account for ancestry and sex) by including Phenotype (SCZ), covariates (PC and sex) and scores from the phenotype file which was just read in
merged_full <- left_join(merged_full, phenotype, by = c('FID', 'IID'))
View(merged_full)


## Create 2 new columns in each dataset which are: total.SCORE (22 chromosomes summed), and total.CNT (22 CNT columns summed).

## REMEMBER TO SUM ACROSS ROWS, NOT COLUMNS ----

# Getting the summed data across rows to create new column -- TOTAL SCORES
score_sums <- merged_full[,3]+ merged_full[,5]+ merged_full[,7]+ merged_full[,9]+merged_full[,11]+merged_full[,13]+merged_full[,15]+merged_full[,17]+merged_full[,19]+merged_full[,21]+merged_full[,23]+merged_full[,25]+merged_full[,27]+merged_full[,29]+merged_full[,31]+merged_full[,33]+merged_full[,35]+merged_full[,37]+merged_full[,39]+merged_full[,41]+merged_full[,43]+merged_full[,45]


## Getting the summed data across rows to create new column -- TOTAL CNT
cnt_sums <- merged_full[,4]+ merged_full[,6]+ merged_full[,8]+ merged_full[,10]+merged_full[,12]+merged_full[,14]+merged_full[,16]+merged_full[,18]+merged_full[,20]+merged_full[,22]+merged_full[,24]+merged_full[,26]+merged_full[,28]+merged_full[,30]+merged_full[,32]+merged_full[,34]+merged_full[,36]+merged_full[,38]+merged_full[,40]+merged_full[,42]+merged_full[,44]+merged_full[,46]

## Binding datasets together to create two new columns called total.SCORE and total.CNT
merged_full_mutate <- cbind(merged_full, score_sums, cnt_sums)


## Changing names for total.SCORE and total.CNT (numbers 64 and 65)
colnames(merged_full_mutate)[64] <- "total.SCORE"
colnames(merged_full_mutate)[65] <- "total.CNT"


## Create a new column which is your standardized PRS using mutate to add a new column. This applies the equation:
##  total score - mean(total score)/sd(total score) and generates z scores
merged_full_mutate_standardise <- mutate(merged_full_mutate, "full.ZSCORE" = (merged_full_mutate$total.SCORE - mean(merged_full_mutate$total.SCORE, na.rm = TRUE))/sd(merged_full_mutate$total.SCORE, na.rm = TRUE))


## Retain only the FID, IID, zSCORE, total.CNT columns using 'select'
full_ready <- select(merged_full_mutate_standardise,matches("FID"), matches("IID"), matches("full.ZSCORE"), matches("total.CNT")) %>% as_tibble()
View(full_ready)


## full_ready is, um, ready to go!


## Repeat this process for blood and brain

## BLOOD ----


## Assign blood datasets to simpler names
## Select dataset by columns FID, IID, SCORE, CNT
## Change column names to reflect this selection
## Convert to tibble for easier management in the tidyverse:

blood_1 <- CLOZUK_GWAS_BGE_chr1_blood.S1.profile
blood_1_cols <- select(blood_1, FID, IID, SCORE, CNT)
names(blood_1_cols) <- c("FID", "IID", "chr1.blood.SCORE", "chr1.blood.CNT")
blood_1_cols <- as_tibble(blood_1_cols)


blood_2 <- CLOZUK_GWAS_BGE_chr2_blood.S1.profile
blood_2_cols <- select(blood_2, FID, IID, SCORE, CNT)
names(blood_2_cols) <- c("FID", "IID", "chr2.blood.SCORE", "chr2.blood.CNT")
blood_2_cols <- as_tibble(blood_2_cols)

blood_3 <- CLOZUK_GWAS_BGE_chr1_blood.S1.profile
blood_3_cols <- select(blood_1, FID, IID, SCORE, CNT)
names(blood_3_cols) <- c("FID", "IID", "chr3.blood.SCORE", "chr3.blood.CNT")
blood_3_cols <- as_tibble(blood_3_cols)

blood_4 <- CLOZUK_GWAS_BGE_chr4_blood.S1.profile
blood_4_cols <- select(blood_4, FID, IID, SCORE, CNT)
names(blood_4_cols) <- c("FID", "IID", "chr4.blood.SCORE", "chr4.blood.CNT")
blood_4_cols <- as_tibble(blood_4_cols)

blood_5 <- CLOZUK_GWAS_BGE_chr5_blood.S1.profile
blood_5_cols <- select(blood_5, FID, IID, SCORE, CNT)
names(blood_5_cols) <- c("FID", "IID", "chr5.blood.SCORE", "chr5.blood.CNT")
blood_5_cols <- as_tibble(blood_5_cols)

blood_6 <- CLOZUK_GWAS_BGE_chr6_blood.S1.profile
blood_6_cols <- select(blood_6, FID, IID, SCORE, CNT)
names(blood_6_cols) <- c("FID", "IID", "chr6.blood.SCORE", "chr6.blood.CNT")
blood_6_cols <- as_tibble(blood_6_cols)

blood_7 <- CLOZUK_GWAS_BGE_chr7_blood.S1.profile
blood_7_cols <- select(blood_7, FID, IID, SCORE, CNT)
names(blood_7_cols) <- c("FID", "IID", "chr7.blood.SCORE", "chr7.blood.CNT")
blood_7_cols <- as_tibble(blood_7_cols)

blood_8 <- CLOZUK_GWAS_BGE_chr8_blood.S1.profile
blood_8_cols <- select(blood_8, FID, IID, SCORE, CNT)
names(blood_8_cols) <- c("FID", "IID", "chr8.blood.SCORE", "chr8.blood.CNT")
blood_8_cols <- as_tibble(blood_8_cols)

blood_9 <- CLOZUK_GWAS_BGE_chr9_blood.S1.profile
blood_9_cols <- select(blood_9, FID, IID, SCORE, CNT)
names(blood_9_cols) <- c("FID", "IID", "chr9.blood.SCORE", "chr9.blood.CNT")
blood_9_cols <- as_tibble(blood_9_cols)

blood_10 <- CLOZUK_GWAS_BGE_chr10_blood.S1.profile
blood_10_cols <- select(blood_10, FID, IID, SCORE, CNT)
names(blood_10_cols) <- c("FID", "IID", "chr10.blood.SCORE", "chr10.blood.CNT")
blood_10_cols <- as_tibble(blood_10_cols)

blood_11 <- CLOZUK_GWAS_BGE_chr11_blood.S1.profile
blood_11_cols <- select(blood_11, FID, IID, SCORE, CNT)
names(blood_11_cols) <- c("FID", "IID", "chr11.blood.SCORE", "chr11.blood.CNT")
blood_11_cols <- as_tibble(blood_11_cols)

blood_12 <- CLOZUK_GWAS_BGE_chr12_blood.S1.profile
blood_12_cols <- select(blood_12, FID, IID, SCORE, CNT)
names(blood_12_cols) <- c("FID", "IID", "chr12.blood.SCORE", "chr12.blood.CNT")
blood_12_cols <- as_tibble(blood_12_cols)

blood_13 <- CLOZUK_GWAS_BGE_chr13_blood.S1.profile
blood_13_cols <- select(blood_13, FID, IID, SCORE, CNT)
names(blood_13_cols) <- c("FID", "IID", "chr13.blood.SCORE", "chr13.blood.CNT")
blood_13_cols <- as_tibble(blood_13_cols)

blood_14 <- CLOZUK_GWAS_BGE_chr14_blood.S1.profile
blood_14_cols <- select(blood_14, FID, IID, SCORE, CNT)
names(blood_14_cols) <- c("FID", "IID", "chr14.blood.SCORE", "chr14.blood.CNT")
blood_14_cols <- as_tibble(blood_14_cols)

blood_15 <- CLOZUK_GWAS_BGE_chr5_blood.S1.profile
blood_15_cols <- select(blood_15, FID, IID, SCORE, CNT)
names(blood_15_cols) <- c("FID", "IID", "chr15.blood.SCORE", "chr15.blood.CNT")
blood_15_cols <- as_tibble(blood_15_cols)

blood_16 <- CLOZUK_GWAS_BGE_chr16_blood.S1.profile
blood_16_cols <- select(blood_16, FID, IID, SCORE, CNT)
names(blood_16_cols) <- c("FID", "IID", "chr16.blood.SCORE", "chr16.blood.CNT")
blood_16_cols <- as_tibble(blood_16_cols)

blood_17 <- CLOZUK_GWAS_BGE_chr17_blood.S1.profile
blood_17_cols <- select(blood_17, FID, IID, SCORE, CNT)
names(blood_17_cols) <- c("FID", "IID", "chr17.blood.SCORE", "chr17.blood.CNT")
blood_17_cols <- as_tibble(blood_17_cols)

blood_18 <- CLOZUK_GWAS_BGE_chr18_blood.S1.profile
blood_18_cols <- select(blood_18, FID, IID, SCORE, CNT)
names(blood_18_cols) <- c("FID", "IID", "chr18.blood.SCORE", "chr18.blood.CNT")
blood_18_cols <- as_tibble(blood_18_cols)

blood_19 <- CLOZUK_GWAS_BGE_chr19_blood.S1.profile
blood_19_cols <- select(blood_19, FID, IID, SCORE, CNT)
names(blood_19_cols) <- c("FID", "IID", "chr19.blood.SCORE", "chr19.blood.CNT")
blood_19_cols <- as_tibble(blood_19_cols)

blood_20 <- CLOZUK_GWAS_BGE_chr20_blood.S1.profile
blood_20_cols <- select(blood_20, FID, IID, SCORE, CNT)
names(blood_20_cols) <- c("FID", "IID", "chr20.blood.SCORE", "chr20.blood.CNT")
blood_20_cols <- as_tibble(blood_20_cols)
blood_20_cols

blood_21 <- CLOZUK_GWAS_BGE_chr21_blood.S1.profile
blood_21_cols <- select(blood_21, FID, IID, SCORE, CNT)
names(blood_21_cols) <- c("FID", "IID", "chr21.blood.SCORE", "chr21.blood.CNT")
blood_21_cols <- as_tibble(blood_21_cols)

blood_22 <- CLOZUK_GWAS_BGE_chr22_blood.S1.profile
blood_22_cols <- select(blood_22, FID, IID, SCORE, CNT)
names(blood_22_cols) <- c("FID", "IID", "chr22.blood.SCORE", "chr22.blood.CNT")
blood_22_cols <- as_tibble(blood_22_cols)

merged_blood <- list(blood_1_cols, blood_2_cols, blood_3_cols, blood_4_cols, blood_5_cols, blood_6_cols, blood_7_cols, blood_8_cols, blood_9_cols, blood_10_cols, blood_11_cols, blood_12_cols, blood_13_cols, blood_14_cols, blood_15_cols, blood_16_cols, blood_17_cols, blood_18_cols, blood_19_cols, blood_20_cols, blood_21_cols, blood_22_cols) %>% reduce(left_join, by = c('FID','IID'))

## Create 2 new columns in each dataset which are: total.SCORE (22 chromosomes summed), and total.CNT (22 CNT columns summed)

## REMEMBER TO SUM ACROSS ROWS, NOT COLUMNS

# Getting the summed data across rows to mutate -- TOTAL SCORES
score_sums_blood <- merged_blood[,3]+ merged_blood[,5]+ merged_blood[,7]+ merged_blood[,9]+merged_blood[,11]+merged_blood[,13]+merged_blood[,15]+merged_blood[,17]+merged_blood[,19]+merged_blood[,21]+merged_blood[,23]+merged_blood[,25]+merged_blood[,27]+merged_blood[,29]+merged_blood[,31]+merged_blood[,33]+merged_blood[,35]+merged_blood[,37]+merged_blood[,39]+merged_blood[,41]+merged_blood[,43]+merged_blood[,45]

## Getting the summed data across rows to mutate -- TOTAL CNT
cnt_sums_blood <- merged_blood[,4]+ merged_blood[,6]+ merged_blood[,8]+ merged_blood[,10]+merged_blood[,12]+merged_blood[,14]+merged_blood[,16]+merged_blood[,18]+merged_blood[,20]+merged_blood[,22]+merged_blood[,24]+merged_blood[,26]+merged_blood[,28]+merged_blood[,30]+merged_blood[,32]+merged_blood[,34]+merged_blood[,36]+merged_blood[,38]+merged_blood[,40]+merged_blood[,42]+merged_blood[,44]+merged_blood[,46]

## Binding datasets together to create two new columns called total.SCORE and total.CNT
merged_blood_mutate <- cbind(merged_blood, score_sums_blood, cnt_sums_blood)
dim(merged_blood_mutate)
names(merged_blood_mutate)
colnames(merged_blood_mutate)[47] <- "total.SCORE"
colnames(merged_blood_mutate)[48] <- "total.CNT"

## Create a new column which is your standardized PRS:
## e.g. blood$blood.zSCORE<-(blood$blood.total.SCORE-mean(blood$blood.total.SCORE,na.rm=TRUE))/sd(blood$blood.total.SCORE,na.rm=TRUE)

merged_blood_mutate_standardise <- mutate(merged_blood_mutate, "blood.ZSCORE" = (merged_blood_mutate$total.SCORE - mean(merged_blood_mutate$total.SCORE, na.rm = TRUE))/sd(merged_blood_mutate$total.SCORE, na.rm = TRUE))

View(merged_blood_mutate_standardise)
## Retain only the FID, IID, zSCORE, total.CNT columns

blood_ready <- select(merged_blood_mutate_standardise,matches("FID"), matches("IID"), matches("blood.ZSCORE"), matches("total.CNT")) %>% as_tibble()

## BRAIN ----
## Exactly how we wrangled the full and blood datasets
## Assign blood datasets to simpler names
## Select dataset by columns FID, IID, SCORE, CNT
## Change column names to reflect this selection
## Convert to tibble for easier management in the tidyverse:

brain_1 <- CLOZUK_GWAS_BGE_chr1_brain.S1.profile
brain_1_cols <- select(brain_1, FID, IID, SCORE, CNT)
names(brain_1_cols) <- c("FID", "IID", "chr1.brain.SCORE", "chr1.brain.CNT")
brain_1_cols <- as_tibble(brain_1_cols)


brain_2 <- CLOZUK_GWAS_BGE_chr2_brain.S1.profile
brain_2_cols <- select(brain_2, FID, IID, SCORE, CNT)
names(brain_2_cols) <- c("FID", "IID", "chr2.brain.SCORE", "chr2.brain.CNT")
brain_2_cols <- as_tibble(brain_2_cols)

brain_3 <- CLOZUK_GWAS_BGE_chr1_brain.S1.profile
brain_3_cols <- select(brain_1, FID, IID, SCORE, CNT)
names(brain_3_cols) <- c("FID", "IID", "chr3.brain.SCORE", "chr3.brain.CNT")
brain_3_cols <- as_tibble(brain_3_cols)

brain_4 <- CLOZUK_GWAS_BGE_chr4_brain.S1.profile
brain_4_cols <- select(brain_4, FID, IID, SCORE, CNT)
names(brain_4_cols) <- c("FID", "IID", "chr4.brain.SCORE", "chr4.brain.CNT")
brain_4_cols <- as_tibble(brain_4_cols)

brain_5 <- CLOZUK_GWAS_BGE_chr5_brain.S1.profile
brain_5_cols <- select(brain_5, FID, IID, SCORE, CNT)
names(brain_5_cols) <- c("FID", "IID", "chr5.brain.SCORE", "chr5.brain.CNT")
brain_5_cols <- as_tibble(brain_5_cols)

brain_6 <- CLOZUK_GWAS_BGE_chr6_brain.S1.profile
brain_6_cols <- select(brain_6, FID, IID, SCORE, CNT)
names(brain_6_cols) <- c("FID", "IID", "chr6.brain.SCORE", "chr6.brain.CNT")
brain_6_cols <- as_tibble(brain_6_cols)

brain_7 <- CLOZUK_GWAS_BGE_chr7_brain.S1.profile
brain_7_cols <- select(brain_7, FID, IID, SCORE, CNT)
names(brain_7_cols) <- c("FID", "IID", "chr7.brain.SCORE", "chr7.brain.CNT")
brain_7_cols <- as_tibble(brain_7_cols)

brain_8 <- CLOZUK_GWAS_BGE_chr8_brain.S1.profile
brain_8_cols <- select(brain_8, FID, IID, SCORE, CNT)
names(brain_8_cols) <- c("FID", "IID", "chr8.brain.SCORE", "chr8.brain.CNT")
brain_8_cols <- as_tibble(brain_8_cols)

brain_9 <- CLOZUK_GWAS_BGE_chr9_brain.S1.profile
brain_9_cols <- select(brain_9, FID, IID, SCORE, CNT)
names(brain_9_cols) <- c("FID", "IID", "chr9.brain.SCORE", "chr9.brain.CNT")
brain_9_cols <- as_tibble(brain_9_cols)

brain_10 <- CLOZUK_GWAS_BGE_chr10_brain.S1.profile
brain_10_cols <- select(brain_10, FID, IID, SCORE, CNT)
names(brain_10_cols) <- c("FID", "IID", "chr10.brain.SCORE", "chr10.brain.CNT")
brain_10_cols <- as_tibble(brain_10_cols)

brain_11 <- CLOZUK_GWAS_BGE_chr11_brain.S1.profile
brain_11_cols <- select(brain_11, FID, IID, SCORE, CNT)
names(brain_11_cols) <- c("FID", "IID", "chr11.brain.SCORE", "chr11.brain.CNT")
brain_11_cols <- as_tibble(brain_11_cols)

brain_12 <- CLOZUK_GWAS_BGE_chr12_brain.S1.profile
brain_12_cols <- select(brain_12, FID, IID, SCORE, CNT)
names(brain_12_cols) <- c("FID", "IID", "chr12.brain.SCORE", "chr12.brain.CNT")
brain_12_cols <- as_tibble(brain_12_cols)

brain_13 <- CLOZUK_GWAS_BGE_chr13_brain.S1.profile
brain_13_cols <- select(brain_13, FID, IID, SCORE, CNT)
names(brain_13_cols) <- c("FID", "IID", "chr13.brain.SCORE", "chr13.brain.CNT")
brain_13_cols <- as_tibble(brain_13_cols)

brain_14 <- CLOZUK_GWAS_BGE_chr14_brain.S1.profile
brain_14_cols <- select(brain_14, FID, IID, SCORE, CNT)
names(brain_14_cols) <- c("FID", "IID", "chr14.brain.SCORE", "chr14.brain.CNT")
brain_14_cols <- as_tibble(brain_14_cols)

brain_15 <- CLOZUK_GWAS_BGE_chr5_brain.S1.profile
brain_15_cols <- select(brain_15, FID, IID, SCORE, CNT)
names(brain_15_cols) <- c("FID", "IID", "chr15.brain.SCORE", "chr15.brain.CNT")
brain_15_cols <- as_tibble(brain_15_cols)

brain_16 <- CLOZUK_GWAS_BGE_chr16_brain.S1.profile
brain_16_cols <- select(brain_16, FID, IID, SCORE, CNT)
names(brain_16_cols) <- c("FID", "IID", "chr16.brain.SCORE", "chr16.brain.CNT")
brain_16_cols <- as_tibble(brain_16_cols)

brain_17 <- CLOZUK_GWAS_BGE_chr17_brain.S1.profile
brain_17_cols <- select(brain_17, FID, IID, SCORE, CNT)
names(brain_17_cols) <- c("FID", "IID", "chr17.brain.SCORE", "chr17.brain.CNT")
brain_17_cols <- as_tibble(brain_17_cols)

brain_18 <- CLOZUK_GWAS_BGE_chr18_brain.S1.profile
brain_18_cols <- select(brain_18, FID, IID, SCORE, CNT)
names(brain_18_cols) <- c("FID", "IID", "chr18.brain.SCORE", "chr18.brain.CNT")
brain_18_cols <- as_tibble(brain_18_cols)

brain_19 <- CLOZUK_GWAS_BGE_chr19_brain.S1.profile
brain_19_cols <- select(brain_19, FID, IID, SCORE, CNT)
names(brain_19_cols) <- c("FID", "IID", "chr19.brain.SCORE", "chr19.brain.CNT")
brain_19_cols <- as_tibble(brain_19_cols)

brain_20 <- CLOZUK_GWAS_BGE_chr20_brain.S1.profile
brain_20_cols <- select(brain_20, FID, IID, SCORE, CNT)
names(brain_20_cols) <- c("FID", "IID", "chr20.brain.SCORE", "chr20.brain.CNT")
brain_20_cols <- as_tibble(brain_20_cols)
brain_20_cols

brain_21 <- CLOZUK_GWAS_BGE_chr21_brain.S1.profile
brain_21_cols <- select(brain_21, FID, IID, SCORE, CNT)
names(brain_21_cols) <- c("FID", "IID", "chr21.brain.SCORE", "chr21.brain.CNT")
brain_21_cols <- as_tibble(brain_21_cols)

brain_22 <- CLOZUK_GWAS_BGE_chr22_brain.S1.profile
brain_22_cols <- select(brain_22, FID, IID, SCORE, CNT)
names(brain_22_cols) <- c("FID", "IID", "chr22.brain.SCORE", "chr22.brain.CNT")
brain_22_cols <- as_tibble(brain_22_cols)

merged_brain <- list(brain_1_cols, brain_2_cols, brain_3_cols, brain_4_cols, brain_5_cols, brain_6_cols, brain_7_cols, brain_8_cols, brain_9_cols, brain_10_cols, brain_11_cols, brain_12_cols, brain_13_cols, brain_14_cols, brain_15_cols, brain_16_cols, brain_17_cols, brain_18_cols, brain_19_cols, brain_20_cols, brain_21_cols, brain_22_cols) %>% reduce(left_join, by = c('FID','IID'))


## Create 2 new columns in each dataset which are: total.SCORE (22 chromosomes summed), and total.CNT (22 CNT columns summed)

## REMEMBER TO SUM ACROSS ROWS, NOT COLUMNS

# Getting the summed data across rows to mutate -- TOTAL SCORES
score_sums_brain <- merged_brain[,3]+ merged_brain[,5]+ merged_brain[,7]+ merged_brain[,9]+merged_brain[,11]+merged_brain[,13]+merged_brain[,15]+merged_brain[,17]+merged_brain[,19]+merged_brain[,21]+merged_brain[,23]+merged_brain[,25]+merged_brain[,27]+merged_brain[,29]+merged_brain[,31]+merged_brain[,33]+merged_brain[,35]+merged_brain[,37]+merged_brain[,39]+merged_brain[,41]+merged_brain[,43]+merged_brain[,45]

## Getting the summed data across rows to mutate -- TOTAL CNT
cnt_sums_brain <- merged_brain[,4]+ merged_brain[,6]+ merged_brain[,8]+ merged_brain[,10]+merged_brain[,12]+merged_brain[,14]+merged_brain[,16]+merged_brain[,18]+merged_brain[,20]+merged_brain[,22]+merged_brain[,24]+merged_brain[,26]+merged_brain[,28]+merged_brain[,30]+merged_brain[,32]+merged_brain[,34]+merged_brain[,36]+merged_brain[,38]+merged_brain[,40]+merged_brain[,42]+merged_brain[,44]+merged_brain[,46]


## Binding datasets together to create two new columns called total.SCORE and total.CNT
merged_brain_mutate <- cbind(merged_brain, score_sums_brain, cnt_sums_brain)
dim(merged_brain_mutate)

## Changing names for total.SCORE and total.CNT
colnames(merged_brain_mutate)[47] <- "total.SCORE"
colnames(merged_brain_mutate)[48] <- "total.CNT"
View(merged_brain_mutate)

## Create a new column which is your standardized PRS:
## e.g. brain$brain.zSCORE<-(brain$brain.total.SCORE-mean(brain$brain.total.SCORE,na.rm=TRUE))/sd(brain$brain.total.SCORE,na.rm=TRUE)
merged_brain_mutate_standardise <- mutate(merged_brain_mutate, "brain.ZSCORE" = (merged_brain_mutate$total.SCORE - mean(merged_brain_mutate$total.SCORE, na.rm = TRUE))/sd(merged_brain_mutate$total.SCORE, na.rm = TRUE))

## Retain only the FID, IID, zSCORE, total.CNT columns

brain_ready <- select(merged_brain_mutate_standardise,matches("FID"), matches("IID"), matches("brain.ZSCORE"), matches("total.CNT")) %>% as_tibble()


## Merge all results into one dataframe and save it so you have all your scores in one place
## Check you have only the FID, IID, zSCORE, total.CNT columns

## Temporarily change the column names of full_ready, blood_ready, and brain_ready to make merging easier
names(full_ready) <- c("FID", "IID", "full.ZSCORE", "full.total.CNT")


names(blood_ready) <- c("xFID", "yIID", "blood.ZSCORE", "blood.total.CNT")


names(brain_ready) <- c("zFID", "aIID", "brain.ZSCORE", "brain.total.CNT")

## Datasets are ready to bind. Attach this to make the final merge easier
datasets_ready <- cbind(full_ready, blood_ready, brain_ready)
attach(datasets_ready)

## Use select to only select columns of interest, i.e. NOT the ones with the dummy names of xFID, yIID, zFID, aIID.
## Do a full join to join the three datasets and the phenotype data. R will automatically join by FID and IID. 
regression_ready <- select(datasets_ready, -xFID, -yIID, -zFID, -aIID)
regression_ready <- full_join(regression_ready, phenotype)


## Set new working directory for regression analysis
setwd("new/path/name")
## Write a table OUT to your directory
write.table(regression_ready, "PGS.csv", sep = ",", row.names = FALSE) 

## Use PGS.csv to perform regression analysis according to the regression script
