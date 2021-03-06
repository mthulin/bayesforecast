% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stan_models.R
\name{stan_naive}
\alias{stan_naive}
\title{Naive and Random Walk models.}
\usage{
stan_naive(
  ts,
  seasonal = FALSE,
  m = 0,
  chains = 4,
  iter = 2000,
  warmup = floor(iter/2),
  adapt.delta = 0.9,
  tree.depth = 10,
  stepwise = TRUE,
  prior_mu0 = NULL,
  prior_sigma0 = NULL,
  series.name = NULL,
  ...
)
}
\arguments{
\item{ts}{a numeric or ts object with the univariate time series.}

\item{seasonal}{a Boolean value for select a seasonal random walk instead.}

\item{m}{an optional integer value for the seasonal period.}

\item{chains}{An integer of the number of Markov Chains chains to be run,
by default 4 chains are run.}

\item{iter}{An integer of total iterations per chain including the warm-up,
by default  the number of iterations are 2000.}

\item{warmup}{A positive integer specifying number of warm-up (aka burn-in)
iterations. This also specifies the number of iterations used for step-size
adaptation, so warm-up samples should not be used for inference. The number
of warmup should not be larger than \code{iter} and the default is
\code{iter/2}.}

\item{adapt.delta}{An optional real value between 0 and 1, the thin of the jumps
in a HMC method. By default is 0.9.}

\item{tree.depth}{An integer of the maximum  depth of the trees  evaluated
during each iteration. By default is 10.}

\item{stepwise}{If TRUE, will do stepwise selection (faster). Otherwise, it searches
over all models. Non-stepwise selection can be very slow, especially for seasonal models.}

\item{prior_mu0}{The prior distribution for the location parameter in an ARIMA model. By default
the value is set \code{NULL}, then the default student(7,0,1) prior is used.}

\item{prior_sigma0}{The prior distribution for the scale parameter in an ARIMA model. By default
the value is set \code{NULL}, then the default student(7,0,1) prior is used.}

\item{series.name}{an optional string vector with the series names.}

\item{...}{Further arguments passed to  \code{varstan} function.}
}
\value{
A \code{varstan} object with the fitted naive Random Walk model.
}
\description{
naive is the model constructor for a random walk  model applied to \code{y}.
This is equivalent to an ARIMA(0,1,0) model. \code{naive()} is simply a wrapper
to  maintain forecast package similitude. \code{seasonal} returns the model constructor
for a seasonal random walk equivalent to an ARIMA(0,0,0)(0,1,0)m model where m is the
seasonal period.
}
\details{
The random walk with drift model is
\deqn{Y_t = mu_0 + Y_{t-1} + epsilon_t}{Y[t]= mu_0 +Y[t-1] + epsilon[t]}
where  \eqn{epsilon_t}{epsilon[t]} is a normal iid error.

The seasonal naive model is
\deqn{Y_t = mu_0 + Y_{t-m} + epsilon_t}{Y[t]= mu_0 +Y[t-m] + epsilon[t]}
where  \eqn{epsilon_t}{epsilon[t]} is a normal iid error.
}
\examples{
\donttest{
 library(astsa)
 # A seasonal Random-walk model.
 sf1 = stan_naive(birth,seasonal = TRUE)
}

}
\references{
Hyndman, R. & Khandakar, Y. (2008). Automatic time series forecasting: the
forecast package for \code{R}. \emph{Journal of Statistical Software}. 26(3),
1-22.\code{doi:	10.18637/jss.v027.i03}.

Box, G. E. P. and Jenkins, G.M. (1978). Time series analysis: Forecasting and
control. San Francisco: Holden-Day. \emph{Biometrika}, 60(2), 297-303.
\code{doi:10.1093/biomet/65.2.297}.

Kennedy, P. (1992). Forecasting with dynamic regression models: Alan Pankratz, 1991.
\emph{International Journal of Forecasting}. 8(4), 647-648.
\code{url: https://EconPapers.repec.org/RePEc:eee:intfor:v:8:y:1992:i:4:p:647-648}.
}
\seealso{
\code{\link{Sarima}}
}
\author{
Asael Alonzo Matamoros
}
