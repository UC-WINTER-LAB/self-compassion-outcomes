library(lavaan)
#################################### Fitting SDT factora

########### Six factors
model <- '
  Autonomysat =~ bpnsfs1 + bpnsfs7 + bpnsfs13 + bpnsfs19
  Autonomyfrus =~ bpnsfs2 + bpnsfs8 + bpnsfs14 + bpnsfs20
  Relatednessat =~ bpnsfs3 + bpnsfs9 + bpnsfs15 + bpnsfs21
  Relatednessfrus =~ bpnsfs4 + bpnsfs10 + bpnsfs16 + bpnsfs22
  Compsat =~ bpnsfs5 + bpnsfs11 + bpnsfs17 + bpnsfs23
  Compfrus =~ bpnsfs6 + bpnsfs12 + bpnsfs18 + bpnsfs24
'
  

#Fitting the model using listwise deletion of missing data

fit.sdt.six <- cfa(model, data=df_test, cluster="time")

# Summarize the fit

summary(fit.sdt.six, fit.measures=TRUE)

########### Three factors
model <- '
  Autonomy =~ bpnsfs1 + bpnsfs7 + bpnsfs13 + bpnsfs19 + bpnsfs2 + bpnsfs8 + bpnsfs14 + bpnsfs20
  Relatednes =~ bpnsfs3 + bpnsfs9 + bpnsfs15 + bpnsfs21 + bpnsfs4 + bpnsfs10 + bpnsfs16 + bpnsfs22
  Comp =~ bpnsfs5 + bpnsfs11 + bpnsfs17 + bpnsfs23 + bpnsfs6 + bpnsfs12 + bpnsfs18 + bpnsfs24
  
  sdt =~ Autonomy + Relatednes + Comp
'
#Fitting the model using listwise deletion of missing data

fit.sdt.three <- cfa(model, data=df_test, cluster="time")

# Summarize the fit

summary(fit.sdt.three, fit.measures=TRUE)

#################################### Fitting SCS

############## Fitting SCS Factors
model <- '
SelfKindness =~  scs5 + scs12 + scs19 + scs23 + scs26
SelfJudgment =~ scs1 + scs8 + scs11 + scs16 + scs21
CommonHumanity =~ scs3 + scs7 + scs10 + scs15
Isolation =~ scs4 + scs13 + scs18 + scs25
Mindfullness =~ scs9 + scs14 + scs17 + scs22
Overidentified =~ scs2 + scs6 + scs20 + scs24

scs =~ 1*SelfKindness + 1*SelfJudgment + 1*CommonHumanity + 1*Isolation + 1*Mindfullness + 1*Overidentified 
'
#Fitting the model using listwise deletion of missing data

fit.scs <- cfa(model, data=df_test, cluster="time", estimator="MLR")

summary(fit.scs, fit=TRUE)
