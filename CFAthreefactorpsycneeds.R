install.packages("lavaan")
library(lavaan)
if (exists("cfa")) {
  print("cfa function is available")
} else {
  print("cfa function is NOT available")
}
#################################### Fitting SDT factora
model <- '
  Autonomy =~ bpnsfs1 + bpnsfs7 + bpnsfs13 + bpnsfs19 + bpnsfs2 + bpnsfs8 + bpnsfs14 + bpnsfs20
  Relatednes =~ bpnsfs3 + bpnsfs9 + bpnsfs15 + bpnsfs21 + bpnsfs4 + bpnsfs10 + bpnsfs16 + bpnsfs22
  Comp =~ bpnsfs5 + bpnsfs11 + bpnsfs17 + bpnsfs23 + bpnsfs6 + bpnsfs12 + bpnsfs18 + bpnsfs24
'
#Fitting the model using listwise deletion of missing data

fit.sdt <- cfa(model, data=df_test, missing="listwise")

# Summarize the fit

summary(fit.sdt, fit.measures=TRUE)
