install.packages("lavaan")
library(lavaan)

############## Fitting SCS Factors
model <- '
SelfKindness =~  scs5 + scs12 + scs19 + scs23 + scs26
SelfJudgment =~ scs1 + scs8 + scs11 + scs16 + scs21
CommonHumanity =~ scs3 + scs7 + scs10 + scs15
Isolation =~ scs4 + scs13 + scs18 + scs25
Mindfullness =~ scs9 + scs14 + scs17 + scs22
Overidentified =~ scs2 + scs6 + scs20 + scs24

scs =~ SelfKindness + SelfJudgment + CommonHumanity + Isolation + Mindfullness + Overidentified 
'
#Fitting the model using listwise deletion of missing data

fit.scs <- cfa(model, data=df_test)

summary(fit.scs, fit=TRUE)
