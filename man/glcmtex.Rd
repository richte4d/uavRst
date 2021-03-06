% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rs_textures.R
\name{glcmtex}
\alias{glcmtex}
\title{Calls the glcm package with useful settings}
\usage{
glcmtex(x, nrasters = 1:nlayers(x), kernelSize = c(3), stats = c("mean",
  "variance", "homogeneity", "contrast", "dissimilarity", "entropy",
  "second_moment", "correlation"), shift = list(c(0, 1), c(1, 1), c(1, 0),
  c(1, -1)), parallel = TRUE, n_grey = 8, min_x = NULL, max_x = NULL)
}
\arguments{
\item{x}{rasterLayer or a rasterStack containing different channels}

\item{nrasters}{vector of channels to use from x. Default =nlayers(x)}

\item{kernelSize}{vector of numbers indicating the environment sizes for which the textures are calculated}

\item{stats}{string vector of parameters to be calculated.see \code{\link{glcm}}}

\item{shift}{=list(c(0,1), c(1,1), c(1,0),c(1,-1))}

\item{parallel}{logical value indicating whether parameters are calculated parallel or not}

\item{n_grey}{number of grey values. see \code{\link{glcm}}}

\item{min_x}{for each channel the minimum value which can occur. If NULL then the minimum value from the rasterLayer is used.}

\item{max_x}{for each channel the maximum value which can occur. If NULL then the maximum value from the rasterLayer is used.
This functions calls the glcm function from \link{glcm} with standard settings
and returns list of RasterStacks containing the texture parameters for each combination of channel and kernelSize}
}
\description{
Calls the glcm package with useful settings
}
\note{
for the use of glcmtex a glcm wrapper function
      a raster* object is required

More information at:
\href{https://prism.ucalgary.ca/handle/1880/51900}{texture tutorial}
Keep in mind that:\cr
Homogeneity is correlated with Contrast,  r = -0.80\cr
Homogeneity is correlated with Dissimilarity, r = -0.95\cr
GLCM Variance is correlated with Contrast,  r= 0.89\cr
GLCM Variance is correlated with Dissimilarity,  r= 0.91\cr
GLCM Variance is correlated with Homogeneity,  r= -0.83\cr
Entropy is correlated with ASM,  r= -0.87\cr
GLCM Mean and Correlation are more independent. For the same image, GLCM Mean shows  r< 0.1 with any of the other texture measures demonstrated in this tutorial. GLCM Correlation shows  r<0.5 with any other measure.
for a review of a lot of feature extraction algorithms look at: \href{http://homepages.dcc.ufmg.br/~william/papers/paper_2012_JEI.pdf}{Williams et al, 2012}\cr
glcm <-> haralick "mean" <-> "advanced 1", "variance" <-> "advanced 2", "homogeneity" <-> "simple 4", "contrast"<-> "simple 5", "dissimilarity" <-> "advanced 2", "entropy" <-> "simple 2", "second_moment"<-> "simple 4", "correlation" <-> "simple 3"
Furthermore using stats will cover mean and variance while dissimilarity is highly correlated to homogeneity data.
}
\examples{
\dontrun{
## example on how to calculate texture from a list of channels

url<-"http://www.ldbv.bayern.de/file/zip/5619/DOP\%2040_CIR.zip"
res <- curl::curl_download(url, "testdata.zip")
unzip(res,junkpaths = TRUE,overwrite = TRUE)
r<- raster::stack(paste0(getwd(),"4490600_5321400.tif"))

# call glcm wrapper
result <- glcmtex(r,nrasters=1:3,
stats=c("mean", "variance", "homogeneity"))

#plot the results from VIS0.6 channel:
raster::plot(unlist(unlist(glcm$size_3$X4490600_5321400.1)))
}
}
\seealso{
\code{\link{glcm}}
}
\author{
Hanna Meyer
}
