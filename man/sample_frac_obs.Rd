% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxmap--docs.R
\name{sample_frac_obs}
\alias{sample_frac_obs}
\title{Sample a proportion of observations from \code{\link[=taxmap]{taxmap()}}}
\arguments{
\item{obj}{(\code{\link[=taxmap]{taxmap()}}) The object to sample from.}

\item{data}{Dataset names, indexes, or a logical vector that indicates which datasets in
\code{obj$data} to sample. If multiple datasets are sample at once, then they must be the same
length.}

\item{size}{(\code{numeric} of length 1) The proportion of observations to
sample.}

\item{replace}{(\code{logical} of length 1) If \code{TRUE}, sample with
replacement.}

\item{taxon_weight}{(\code{numeric}) Non-negative sampling weights of each
taxon. If \code{use_supertaxa} is \code{TRUE}, the weights for each taxon
in an observation's classification are supplied to \code{collapse_func} to
get the observation weight. If \code{obs_weight} is also specified, the two
weights are multiplied (after \code{taxon_weight} for each observation is
calculated).}

\item{obs_weight}{(\code{numeric}) Sampling weights of each observation.  If
\code{taxon_weight} is also specified, the two weights are multiplied
(after \code{taxon_weight} for each observation is calculated).}

\item{use_supertaxa}{(\code{logical} or \code{numeric} of length 1) Affects how the
\code{taxon_weight} is used. If \code{TRUE}, the weights for each taxon in
an observation's classification are multiplied to get the observation
weight. If \code{FALSE} just the taxonomic level the observation is assign to it
considered. Positive numbers indicate the number of ranks above the
each taxon to use. \code{0} is equivalent to \code{FALSE}. Negative numbers
are equivalent to \code{TRUE}.}

\item{collapse_func}{(\code{function} of length 1) If \code{taxon_weight}
option is used and \code{supertaxa} is \code{TRUE}, the weights for each
taxon in an observation's classification are supplied to
\code{collapse_func} to get the observation weight. This function should
take  numeric vector and return a single number.}

\item{...}{Additional options are passed to \code{\link[=filter_obs]{filter_obs()}}.}

\item{target}{DEPRECIATED. use "data" instead.}
}
\value{
An object of type \code{\link[=taxmap]{taxmap()}}
}
\description{
Randomly sample some proportion of observations from a \code{\link[=taxmap]{taxmap()}}
object. Weights can be specified for observations or their taxa. See
\code{\link[dplyr:sample_n]{dplyr::sample_frac()}} for the inspiration for this function. Calling the
function using the \code{obj$sample_frac_obs(...)} style edits "obj" in place, unlike
most R functions. However, calling the function using the \code{sample_frac_obs(obj, ...)} imitates R's traditional copy-on-modify semantics, so "obj" would not
be changed; instead a changed version would be returned, like most R
functions.
\preformatted{
obj$sample_frac_obs(data, size, replace = FALSE,
  taxon_weight = NULL, obs_weight = NULL,
  use_supertaxa = TRUE, collapse_func = mean, ...)
sample_frac_obs(obj, data, size, replace = FALSE,
  taxon_weight = NULL, obs_weight = NULL,
  use_supertaxa = TRUE, collapse_func = mean, ...)}
}
\examples{
# Sample half of the rows fram a table
sample_frac_obs(ex_taxmap, "info", 0.5)

# Sample multiple datasets at once
sample_frac_obs(ex_taxmap, c("info", "phylopic_ids", "foods"), 0.5)

}
\seealso{
Other taxmap manipulation functions: 
\code{\link{arrange_obs}()},
\code{\link{arrange_taxa}()},
\code{\link{filter_obs}()},
\code{\link{filter_taxa}()},
\code{\link{mutate_obs}()},
\code{\link{sample_frac_taxa}()},
\code{\link{sample_n_obs}()},
\code{\link{sample_n_taxa}()},
\code{\link{select_obs}()},
\code{\link{transmute_obs}()}
}
\concept{taxmap manipulation functions}
