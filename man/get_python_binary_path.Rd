% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_python_binary_path.R
\name{get_python_binary_path}
\alias{get_python_binary_path}
\title{Get the path to the \code{python} binary}
\usage{
get_python_binary_path(
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
the path to the actve \code{python} binary
}
\description{
Get the path to the \code{python} binary
}
\examples{
# local Python version
# just returns 'python3'
get_python_binary_path(ormr_folder_name = "python3")

# Conda Python version
if (is_conda_installed()) {
  get_python_binary_path()
}
}
\author{
Richèl J.C. Bilderbeek
}
