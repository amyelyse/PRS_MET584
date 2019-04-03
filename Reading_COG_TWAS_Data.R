## Set working directory
setwd("~/Google Drive/Postgrad/4 Case Study MET584/TWAS/COG")
## Load tidyverse package
library(tidyverse)

## Read in all data as objects, making sure NA values are treated as such

COG_1 <- read_delim("COG_noMHC_chr1.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_2 <- read_delim("COG_noMHC_chr2.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_3 <- read_delim("COG_noMHC_chr3.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_4 <- read_delim("COG_noMHC_chr4.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_5 <- read_delim("COG_noMHC_chr5.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_6 <- read_delim("COG_noMHC_chr6.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_7 <- read_delim("COG_noMHC_chr7.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_8 <- read_delim("COG_noMHC_chr8.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_9 <- read_delim("COG_noMHC_chr9.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_10 <- read_delim("COG_noMHC_chr10.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_11 <- read_delim("COG_noMHC_chr11.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_12 <- read_delim("COG_noMHC_chr12.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_13 <- read_delim("COG_noMHC_chr13.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_14 <- read_delim("COG_noMHC_chr14.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_15 <- read_delim("COG_noMHC_chr15.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_16 <- read_delim("COG_noMHC_chr16.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_17 <- read_delim("COG_noMHC_chr17.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_18 <- read_delim("COG_noMHC_chr18.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_19 <- read_delim("COG_noMHC_chr19.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_20 <- read_delim("COG_noMHC_chr20.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_21 <- read_delim("COG_noMHC_chr21.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()

COG_22 <- read_delim("COG_noMHC_chr22.txt", "\t", escape_double = FALSE, col_types = cols(CHR = col_integer(), FILE = col_skip(), PANEL = col_skip()), na = "NA", trim_ws = TRUE) %>% as_tibble()



## Merge datasets together using plyr
library(plyr)

merged <- join_all(list(COG_1, COG_2, COG_3, COG_4, COG_5, COG_6, COG_7, COG_8, COG_9, COG_10, COG_11, COG_12, COG_13, COG_14, COG_15, COG_16, COG_17, COG_18, COG_19, COG_20, COG_21, COG_22), by = 'CHR', type = 'full')


## How many NAs are there in the TWAS.Z column?
names(merged) ## Just checking the TWAS.Z column exists!
merged$CHR <- as.factor(merged$CHR) ## Checking all chromosomes have been read in properly!
number.NA <- sum(is.na(merged$TWAS.Z)) ## 127 NAs in the TWAS.Z column
number.NA
length(merged$TWAS.Z) ## Total number of Z scores
number.ZSCORE <- length(merged$TWAS.Z) - number.NA
number.ZSCORE ## Number of genes with a Z score = 5255

## Calculating adjusted p-value because multiple testing is important
adjusted.p.value <- 0.05/number.ZSCORE
adjusted.p.value ## 9.514748e-06

## Filtering genes by whether they have a significant p-value
str(merged$TWAS.P) ## Checking the column is numeric
merged_sig_P <- filter(merged, merged$TWAS.P <= 9.514748e-06) ## Filtering by specified significance value

## Checking the table looks okay before exporting
View(merged_sig_P)
## Exporting the results out
write.table(merged_sig_P, "merged_sig_P_COG.tsv", sep = "\t", row.names = FALSE)
