% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quickMQC.R
\name{quickMQC}
\alias{quickMQC}
\title{Imports QC data}
\usage{
quickMQC(ce)
}
\arguments{
\item{ce}{CAGEexp object}
}
\value{
CAGEexp object
}
\description{
Imports Hisat2 QC (multiqc_hisat2.txt) and general QC data (multiqc_general_stats.txt) and writes it into the CAGEexp object
}
\examples{
\dontrun{
quickMQC(ce)
}

}
