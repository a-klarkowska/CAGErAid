#' Clusters CTSSs for samples with splice leader
#' @description Quickly clusters CTSSs in splice leader-containing sample data with established parameters.
#' For clustering CTSSs in samples without splice leader found, use [quickClustersNO()].
#'
#' The method for clustering CTSSs is paraclu, and by default the algorithm uses 4 cores.
#'
#' Optional aggregating tags is possible with aggregate = TRUE, at which the user needs to provide a GFF file.
#' For easy processing of gff files use [quickGFF()].
#'
#' @param ce CAGEexp object
#' @param aggregate whether to return consensus clusters
#' @param gff GFF file
#'
#' @return CAGEexp object
#' @importFrom CAGEr normalizeTagCount
#' @importFrom CAGEr clusterCTSS
#' @importFrom CAGEr cumulativeCTSSdistribution
#' @importFrom CAGEr quantilePositions
#' @importFrom CAGEr aggregateTagClusters
#' @importFrom CAGEr annotateConsensusClusters
#' @examples
#' \dontrun{
#' quickClustersSL(ce, aggregate = TRUE, gff)
#' }
#' @export
quickClustersSL <- function(ce, aggregate = FALSE, gff = NULL) {
  if (aggregate == TRUE & is.null(gff)) stop('Missing GFF, skipping aggregating CAGE tags. Supply GFF.')
  else if (aggregate == FALSE) {
    ce <- ce |>
      CAGEr::normalizeTagCount(method = 'simpleTpm') |>
      CAGEr::clusterCTSS(
        method = "paraclu",
        nrPassThreshold = 1, # Default.  We do not have replicates for all time points
        threshold = 1,   # See above.  Note that it allows low-score CTSS supported in other samples.
        removeSingletons = TRUE,
        keepSingletonsAbove = 1,
        maxLength = 10L, # Keep them sharp
        useMulticore = TRUE, # Deigo
        nrCores = 4) |>
      CAGEr::cumulativeCTSSdistribution() |>
      CAGEr::quantilePositions()
  }
  else if (aggregate == TRUE) {
    ce <- ce |>
      # the next 2 lines below are added bc idek anymore
      # seems to work at the very least
      # clusterCTSS not with paraclu bc it's copied from Okinawa Rmd, should be with paraclu
      CAGEr::normalizeTagCount(method = 'simpleTpm') |>
      CAGEr::clusterCTSS() |>
      CAGEr::aggregateTagClusters(
        maxDist = 10L,
        tpmThreshold = 10,
        excludeSignalBelowThreshold = FALSE
      ) |>  # See also the score distribution
      CAGEr::cumulativeCTSSdistribution(clusters = "consensusClusters") |>
      CAGEr::quantilePositions(clusters = "consensusClusters") |>
      CAGEr::annotateConsensusClusters(gff, up = 100, down = 0)
  }

  ce #ok something is clearly not going in aggregate true but idk why
  # seems to work if i pass minimal parameters to clusterCTSS?
}
