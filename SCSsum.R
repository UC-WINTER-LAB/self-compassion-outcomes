install.packages("tidyverse")
install.packages("rdrop2")
install.packages("dplyr")
install.packages("data.table")
library(dplyr)
library(tidyverse)
library(rdrop2)
library(data.table)

####
df_scs <- df_test %>% 
  select(contains("scs"))

### print
print(df_scs)


summary(df_scs)

summary("scs1")


summary(df_scs[1:3,"scs1"])

summary(df_scs[,"scs1"])

str(df_scs)

names(df_scs)

dput(names(df_scs))

df_scs$scs1


selfcompassion <- c("scs1", "scs2", "scs3", "scs4", "scs5", "scs6", "scs7", "scs8", 
                  "scs9", "scs10", "scs11", "scs12", "scs13", "scs14", "scs15", 
                  "scs16", "scs17", "scs18", "scs19", "scs20", "scs21", "scs22", 
                  "scs23", "scs24", "scs25", "scs26")
selfcompassion

summary(selfcompassion)

summary(df_scs)

summary(df_scs$scs1)

summary(df_scs[,selfcompassion])

df_scs$total<- apply(df_scs[, selfcompassion], MARGIN = 1, sum)

df_scs

summary(df_scs$total)

head(df_scs)

df_scs$total
