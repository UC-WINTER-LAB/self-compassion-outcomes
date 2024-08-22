
df_merged <- df_test %>%
  select(id, time, age, gender) %>%
  left_join(
    bind_cols(
      df_test %>%
        select(id, time, contains("bpns")) %>%
        na.omit() %>%
        select(id, time),
      predict(fit.sdt.three)
    ),
    by=c("id", "time")
  ) %>%
  left_join(
    bind_cols(
      df_test %>%
        select(id, time, contains("scs")) %>%
        na.omit() %>%
        select(id, time),
      predict(fit.scs)
    ),
    by=c("id", "time")
  ) %>%
  left_join(
    bind_cols(
      df_test %>%
        select(id, time, contains("mhcsf")) %>%
        na.omit() %>%
        select(id, time),
      predict(fit.mhcsf)
    ),
    by=c("id", "time")
    )
  
#### copy from left join : contains ("Wellbeing shiz)

