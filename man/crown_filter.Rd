% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fa_crownfilter.R
\name{crown_filter}
\alias{crown_filter}
\title{basic filtering of crown polygons using altitude, area and other optional thresholds}
\usage{
crown_filter(crownFn, minTreeAlt = 10, minCrownArea = 5,
  maxCrownArea = 100, minTreeAltParam = "chmQ50", crownSTDW = NULL,
  opt = NULL, TAopt = NULL,
  proj4string = "+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs")
}
\arguments{
\item{crownFn}{filname of OGR comliant vector file}

\item{minTreeAlt}{minimum height in meter that will be regarded as tree}

\item{minCrownArea}{minimum area of crowns that is accepted}

\item{maxCrownArea}{maximum area of crowns that is accepted}

\item{minTreeAltParam}{parameter that is used for filtering mintreealt default ist Median "chmQ50"}

\item{crownSTDW}{parameter that optionally filters for the STDV of the crown altitudes default is NULL}

\item{opt}{threshold value for optional filter default is NULL}

\item{TAopt}{optional parameter that my be used for filtering default is NULL}

\item{proj4string}{proj4 string}
}
\description{
applies basic filtering of crown polygons using altitude, area and other optional thresholds. return crown_filterbasically returns SPDF  with the crown polygons and all calculated parameters
}
\author{
Chris Reudenbach
}
