## Set working directory
setwd("~/Google Drive/Postgrad/4 Case Study MET584/TWAS/SCZ")
## Load tidyverse package
library(tidyverse)

## Store the pattern of filepath names in a vector called 'filenames'
filenames <- list.files(path = "~/Google Drive/Postgrad/4 Case Study MET584/TWAS/SCZ", pattern = "SCZ_noMHC_chr+.*txt")
## Get names without ".profile" and store in "names"
names <- substr(filenames, 1, 22)
## Read in all data frames using a 'for' loop 
for (i in names) {
  filepath <- file.path(paste(i , sep = "\t"))
  assign(i, read.delim(filepath, sep = "\t"))
}

## Convert all data files into tibbles
SCZ_1 <- SCZ_noMHC_chr1.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_2 <- SCZ_noMHC_chr2.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_3 <- SCZ_noMHC_chr3.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_4 <- SCZ_noMHC_chr4.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_5 <- SCZ_noMHC_chr5.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_6 <- SCZ_noMHC_chr6.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_7 <- SCZ_noMHC_chr7.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_8 <- SCZ_noMHC_chr8.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_9 <- SCZ_noMHC_chr9.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_10 <- SCZ_noMHC_chr10.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_11 <- SCZ_noMHC_chr11.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_12 <- SCZ_noMHC_chr12.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_13 <- SCZ_noMHC_chr13.txt %>% as_tibble() %>% select(-PANEL, -FILE) 
SCZ_14 <- SCZ_noMHC_chr14.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_15 <- SCZ_noMHC_chr15.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_16 <- SCZ_noMHC_chr16.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_17 <- SCZ_noMHC_chr17.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_18 <- SCZ_noMHC_chr18.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_19 <- SCZ_noMHC_chr19.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_20 <- SCZ_noMHC_chr20.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_21 <- SCZ_noMHC_chr21.txt %>% as_tibble() %>% select(-PANEL, -FILE)
SCZ_22 <- SCZ_noMHC_chr22.txt %>% as_tibble() %>% select(-PANEL, -FILE)

head(SCZ_1)
## Merge all datasets together
library(plyr)
merged <- join_all(list(SCZ_1, SCZ_2, SCZ_3, SCZ_4, SCZ_5, SCZ_6, SCZ_7, SCZ_8, SCZ_9, SCZ_10, SCZ_11, SCZ_12, SCZ_13, SCZ_14, SCZ_15, SCZ_16, SCZ_17, SCZ_18, SCZ_19, SCZ_20, SCZ_21, SCZ_22))



View(merged)

## Check how many genes received a TWAS Z.Score
levels(as.factor(merged$TWAS.Z))
merged$TWAS.Z[which(merged$TWAS.Z == "NA")]
is.na(merged$TWAS.Z)
merged$TWAS.Z <- recode(merged$TWAS.Z, "      NA" = "NA")
levels(merged$TWAS.Z)
merged$TWAS.Z <- recode(merged$TWAS.Z, "      NA" = "NA")
merged$TWAS.Z <- recode(merged$TWAS.Z, "       NA" = "NA")
merged$TWAS.Z <- recode(merged$TWAS.Z, "     NA" = "NA")
merged$TWAS.Z <- recode(merged$TWAS.Z, "    NA" = "NA")

number.NA <- merged$TWAS.Z[which(merged$TWAS.Z == "NA")]
length(number.NA)
length(merged$TWAS.Z)
number.ZSCORE <- length(merged$TWAS.Z) - length(number.NA)
number.ZSCORE

adjusted.p.value <- 0.05/number.ZSCORE
adjusted.p.value

merged$TWAS.P <- as.numeric(merged$TWAS.P)
merged_sig_P <- filter(merged, merged$TWAS.P <= 9.514748e-06)
str(merged_sig_P)


View(merged_sig_P)
write.table(merged_sig_P, "merged_sig_P.tsv", sep = "\t", row.names = FALSE)
