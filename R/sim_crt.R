#' Simulate a basic cluster randomised trial
#'
#' This function simulates CRTs for a range of cluster and participants
#'
#'
#' @param points simple feature points locations of data
#' @param poly simple feature polygons of cluster boundaries
#' @param distance distance of buffer for cluster in metres
#' @param trt names of the intervention of treatment variable
#' @param trt_value value of the treatment to to buffer for
#' @param id name of id variable
#' @return spatial points file with new ids and treatment variables
#' @export
