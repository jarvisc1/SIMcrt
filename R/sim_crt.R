#' Simulate a basic cluster randomised trial
#'
#' This function simulates CRTs for a range of cluster and participants
#'
#'
#' @param n_clusters Number of cluster in the trial
#' @param n_cluster_individuals average number of individuals per cluster
#' @param intercept the value of the outcome in the control group
#' @param trt_effect the treatment effect in the trial
#' @param s2b The between cluster standard devation
#' @param s2w The within cluster standard devation
#' @return Data.frame with cluster_id, ind_id, trt, outcome.
#' @export

sim_crt <- function(n_clusters = 10,
                    n_cluster_individuals = 100,
                    intercept = 0.2,
                    trt_effect = 2,
                    s2b = 0.05,
                    s2w = 0.95
                    ) {
  # Cluster values
  cluster_id <- 1:n_clusters

  cluster_trt <- (cluster_id >= (n_clusters/2))*1

  cluster_effect <- stats::rnorm(n_clusters, mean = 0, sd = sqrt(s2b))

  cluster_n_ind <- stats::rpois(n_clusters, lambda = n_cluster_individuals)

  # Individual level values
  ind_cluster_id <- rep(cluster_id, times = cluster_n_ind)

  ind_id_temp <- unlist(sapply(cluster_n_ind, function(x) seq(1,x)))

  ind_id <- paste0(ind_cluster_id, "_", ind_id_temp)

  ind_trt <- rep(cluster_trt, times = cluster_n_ind)
  ind_trt_effect <- ind_trt*trt_effect

  ind_cluster_effect <- rep(cluster_effect, times = cluster_n_ind)

  # Error term individual variation
  n_ind <- length(ind_cluster_id)
  ind_error <- stats::rnorm(n_ind, mean = 0 , sd = sqrt(s2w))

  y <- intercept +
    ind_trt_effect +
    ind_cluster_effect +
    ind_error

  df <- data.frame(cluster_id = ind_cluster_id,
                   ind_id = ind_id,
                   trt = ind_trt,
                   outcome = round(y, 2)
                   )

  df
}
