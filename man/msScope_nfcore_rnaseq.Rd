% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/msScope_nfcore_rnaseq.R
\name{msScope_nfcore_rnaseq}
\alias{msScope_nfcore_rnaseq}
\title{Function implementing the scope parameter of the \link{mapStats} function
Credit: Charles Plessy
Note: had to remove .checkLibsDataFrame, as it couldn't be imported from CAGEr}
\usage{
msScope_nfcore_rnaseq(libs)
}
\arguments{
\item{libs}{A data frame containing metadata describing samples in sequence libraries}
}
\value{
Returns a list with three elements: \code{libs} contains a modified
version of the input data frame where columns have been reorganised as needed,
\code{colums} contains the names of the columns to use for plotting and
provides the order of the stacked bars of the \code{plotAnnot} function,
\code{total} indicates the total counts used for normalising the data.
}
\description{
Function implementing the scope parameter of the \link{mapStats} function
Credit: Charles Plessy
Note: had to remove .checkLibsDataFrame, as it couldn't be imported from CAGEr
}