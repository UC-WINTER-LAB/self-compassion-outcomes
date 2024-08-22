library(brms)
## Test analysis with the SCS data

# Does sdt and scs predict wellbeing ?
base_model <- brm(
  "mhcsf ~ sdt + scs + gender + (1|id)",
  family = gaussian(),
  prior = prior(normal(0, 2), class = b),
  cores = 4,
  chains = 4,
  data = df_merged
  )

summary(base_model)

# Check if SCS predicts any of the three SDT thingos
sdt_mediation <- brm(
  bf("mhcsf ~ scs + Autonomy + Relatednes + Comp + gender + (1|id)") +
    bf("Autonomy ~ scs + gender + (1|id)") +
    bf("Relatednes ~ scs + gender + (1|id)") +
    bf("Comp ~ scs + gender + (1|id)") +
    set_rescor(FALSE),
  family = gaussian(),
  prior = prior(normal(0, 2), class = b),
  cores = 4,
  chains = 4,
  data = df_merged
)

# Calculating the mediation effect
as_draws_df(sdt_mediation) %>%
  select(-contains("Intercept")) %>%
  mutate(
    med_auto = b_mhcsf_Autonomy * b_Autonomy_scs,
    med_relat = b_mhcsf_Relatednes * b_Relatednes_scs,
    med_comp = b_mhcsf_Comp * b_Comp_scs
    ) %>%
  summarise(
    # This is the mean effect
    mean(med_auto),
    mean(med_relat),
    mean(med_comp),
    # This is the probability of a mediation
    mean(med_auto > 0),
    mean(med_relat > 0),
    mean(med_comp > 0)
    ) %>%
  t()

# Plot showing the three mediation effects
as_draws_df(sdt_mediation) %>%
  select(-contains("Intercept")) %>%
  mutate(
    med_auto = b_mhcsf_Autonomy * b_Autonomy_scs,
    med_relat = b_mhcsf_Relatednes * b_Relatednes_scs,
    med_comp = b_mhcsf_Comp * b_Comp_scs
  ) %>%
  select(starts_with("med")) %>%
  pivot_longer(cols = everything(), names_to = "factor", values_to = "value") %>%
  ggplot(aes(x=value, group=factor, color=factor)) +
  geom_density() +
  theme_classic()

# This is broken, im trying to calculate proportion of effect mediated
as_draws_df(sdt_mediation) %>%
  select(-contains("Intercept")) %>%
  mutate(
    med_auto = b_mhcsf_Autonomy * b_Autonomy_scs,
    med_relat = b_mhcsf_Relatednes * b_Relatednes_scs,
    med_comp = b_mhcsf_Comp * b_Comp_scs,
    total_effect = med_auto + med_relat + med_comp + b_mhcsf_scs,
    .keep = "none"
  ) %>%
  mutate(
    med_effect = (med_auto + med_relat + med_comp) / total_effect
  ) %>%
  summarise(mean(med_effect))
  
