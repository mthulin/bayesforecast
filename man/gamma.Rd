% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prior.R
\name{gamma}
\alias{gamma}
\title{Define a gamma prior distribution}
\usage{
gamma(shape = 2, rate = 1)
}
\arguments{
\item{shape}{the form parameter alpha in gamma distribution}

\item{rate}{the rate parameter beta in gamma distribution}
}
\value{
a numerical vector interpreted as a prior in Stan
}
\description{
gamma(shape,rate)
}
\details{
Define a gamma prior distribution using the hyper parameters
shape and rate, by default an gamma(2,1) distribution is
return.
}
