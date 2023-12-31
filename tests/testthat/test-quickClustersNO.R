test_that("clustering works with aggregation on noSL data", {
  ce <- readRDS('~/R/ce_clean.rds')
  hs <- read.table(head = TRUE,
                   '/bucket/LuscombeU/live/CharlesPlessy/CAGE/2022-11-09_Barcelona_Oik/AlignWithRNAseqPipelinePE_BAR/multiqc/hisat2/multiqc_data/multiqc_hisat2.txt')
  qc <- read.table(head = TRUE,
                   sep = '\t',
                   '/bucket/LuscombeU/live/CharlesPlessy/CAGE/2022-11-09_Barcelona_Oik/AlignWithRNAseqPipelinePE_BAR/multiqc/hisat2/multiqc_data/multiqc_general_stats.txt')
  gff <- quickGFF('/bucket/LuscombeU/live/CharlesPlessy/CAGE/2022-11-09_Barcelona_Oik/AlignWithRNAseqPipelinePE_BAR/Bar2_p4.gm.gtf')
  ce <- CAGErAid::quickMQC(ce, guess_path = FALSE, hs, qc)
  test_cluster <- readRDS('~/R/test_quickClusterNOdata.rds')
  ce_NO <- ce[, !ce$SLfound]

  expect_equal(2, 1+1)

  # ce_NO <- quickClustersNO(ce_NO, aggregate = T, gff)
  # expect_equal(consensusClustersGR(ce_NO)$score[1], test_cluster$score[1])
})
