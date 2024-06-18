library(lavaan)
install.packages("lavaan")

##### fitting wellbeing
model <- '
emotional =~ mhcsf1 + mhcsf2 + mhcsf3
social =~ mhcsf4 + mhcsf5 + mhcsf6 + mhcsf7 + mhcsf8
psychological =~ mhcsf9 + mhcsf10 + mhcsf11 + mhcsf12 + mhcsf13 + mhcsf14
'


###fitting the model

fit.mhscf <- cfa(model, data=df_test, cluster="time")

##sumarize the fit
summary(fit.mhscf, fit=TRUE)
