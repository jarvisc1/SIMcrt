# SIMcrt
Simulating cluster randomised trials

To install the latest version of the package use.
```{r}
remotes::install_github('jarvisc1/Simcrt')

# Simulate a crt
sim_crt()

## Simulate a crt with:
# 40 -  clusters
# 100 - Average participants per cluster
# 30 - Average outcome in control group
# 2 - Treatment effect
# 0.05 - standard deviation between clusters
# 0.95 - standard deviation within clusters


sim_crt(n_clusters = 40,
        n_cluster_individuals = 100, 
        intercept = 30, 
        trt_effect = 2,
        s2b = 0.05,
        s2w = 0.95)



```
