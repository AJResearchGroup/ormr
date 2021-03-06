% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/does_conda_env_exists.R
\name{does_conda_env_exists}
\alias{does_conda_env_exists}
\title{Determine if a Conda environment exists}
\usage{
does_conda_env_exists(
  ormr_folder_name = get_default_ormr_folder_name(),
  verbose = FALSE
)
}
\arguments{
\item{ormr_folder_name}{can be either \code{python3}
or the name of the folder where \code{ormr}
installs all Python environments and packages.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link[plinkr]{check_verbose} to detect if this argument is valid.}
}
\value{
TRUE if a Conda environment exists
}
\description{
Determine if a Conda environment exists
}
\examples{
does_conda_env_exists()
does_conda_env_exists(ormr_folder_name = tempfile())
}
\author{
Richèl J.C. Bilderbeek
}
