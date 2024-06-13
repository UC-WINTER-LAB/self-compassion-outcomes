install.packages("lavaan")
library(lavaan)
#################################### Fitting SDT factora
model <- '
  Autonomysat =~ bpnsfs1 + bpnsfs7 + bpnsfs13 + bpnsfs19
  Autonomyfrus =~ bpnsfs2 + bpnsfs8 + bpnsfs14 + bpnsfs20
  Relatednessat =~ bpnsfs3 + bpnsfs9 + bpnsfs15 + bpnsfs21
  Relatednessfrus =~ bpnsfs4 + bpnsfs10 + bpnsfs16 + bpnsfs22
  Compsat =~ bpnsfs5 + bpnsfs11 + bpnsfs17 + bpnsfs23
  Compfrus =~ bpnsfs6 + bpnsfs12 + bpnsfs18 + bpnsfs24
'
  

#Fitting the model using listwise deletion of missing data

fit.sdt <- cfa(model, data=df_test, missing="listwise")

# Summarize the fit

summary(fit.sdt, fit.measures=TRUE)

#################################### Fitting SCS

model <- paste("scs =~", paste0("scs", 1:26, collapse = " + "))

fit.scs <- cfa(model, data=df_test, missing="listwise")

summary(fit.scs, fit = TRUE)
