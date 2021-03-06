% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/undirected_factor_model.R
\name{undirected_factor_model}
\alias{undirected_factor_model}
\title{Create an undirected factor model graph}
\usage{
undirected_factor_model(
  X,
  S,
  ...,
  expected_degree = NULL,
  expected_density = NULL
)
}
\arguments{
\item{X}{A \code{\link[=matrix]{matrix()}} or \link[=matrix]{Matrix()} representing real-valued
latent node positions. Entries must be positive.}

\item{S}{A \code{\link[=matrix]{matrix()}} or \link[=matrix]{Matrix()} mixing matrix. \code{S} is
symmetrized if it is not already, as this is the undirected
case. Entries must be positive.}

\item{...}{Ignored. Must be empty.}

\item{expected_degree}{If specified, the desired expected degree
of the graph. Specifying \code{expected_degree} simply rescales \code{S}
to achieve this. Defaults to \code{NULL}. Do not specify both
\code{expected_degree} and \code{expected_density} at the same time.}

\item{expected_density}{If specified, the desired expected density
of the graph. Specifying \code{expected_density} simply rescales \code{S}
to achieve this. Defaults to \code{NULL}. Do not specify both
\code{expected_degree} and \code{expected_density} at the same time.}
}
\value{
An \code{undirected_factor_model} S3 class based on a list
with the following elements:
\itemize{
\item \code{X}: The latent positions as a \code{\link[=Matrix]{Matrix()}} object.
\item \code{S}: The mixing matrix as a \code{\link[=Matrix]{Matrix()}} object.
\item \code{n}: The number of nodes in the network.
\item \code{k}: The rank of expectation matrix. Equivalently,
the dimension of the latent node position vectors.
}
}
\description{
An undirected factor model graph is an undirected
generalized Poisson random dot product graph. The edges
in this graph are assumed to be independent and Poisson
distributed. The graph is parameterized by its expected
adjacency matrix, which is \verb{E[A|X] = X S X'}. We do not recommend
that casual users use this function, see instead \code{\link[=dcsbm]{dcsbm()}}
and related functions, which will formulate common variants
of the stochastic blockmodels as undirected factor models
\emph{with lots of helpful input validation}.
}
\examples{

n <- 10000
k <- 5

X <- matrix(rpois(n = n * k, 1), nrow = n)
S <- matrix(runif(n = k * k, 0, .1), nrow = k)

ufm <- undirected_factor_model(X, S)
ufm

sane_ufm <- undirected_factor_model(X, S, expected_degree = 50)
sane_ufm

}
