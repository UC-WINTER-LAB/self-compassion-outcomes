library(tidyverse)
library(rdrop2)

raw_df <- drop_read_csv("/Winter Data/Longitudinal Colleges Data - Otago/Belonging_Dataset_Deidentified.csv") %>%
  as_tibble() %>%
  rename_all(tolower)

