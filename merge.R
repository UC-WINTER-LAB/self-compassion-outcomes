
df_merged <- bind_cols(
  df_test %>%
    select(id, time, contains("bpns")) %>%
    na.omit() %>%
    select(id, time),
  predict(fit.sdt.three)
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
  )
  


