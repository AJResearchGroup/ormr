% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/install_python_package_with_version.R
\name{install_python_package_with_version}
\alias{install_python_package_with_version}
\title{Install a Python package with a certain version}
\usage{
install_python_package_with_version(
  package_name,
  package_version,
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
)
}
\arguments{
\item{package_name}{the name of one Python package}

\item{package_version}{a Python package's version, e.g.
\verb{==3.1}, or \verb{<=2.7.1} or \verb{>=42}}

\item{ormr_folder_name}{can be either \code{python3}
or the name of the folder where \code{ormr}
installs all Python environments and packages.}

\item{python_version}{the version of Python used.
Use \link{get_default_python_version} to get
the default Python version.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link[plinkr]{check_verbose} to detect if this argument is valid.}
}
\value{
nothing
}
\description{
Install a Python package with a certain version
}
\examples{
if (plinkr::is_on_ci()) {

  # Use local python
  install_python_package_with_version(
    package_name = "scipy",
    package_version = "1.5.3",
    ormr_folder_name = "python3"
  )

  # Use conda
  if (is_conda_installed()) {
    install_python_package_with_version(
      package_name = "scipy",
      package_version = "1.5.3"
    )
  }
}
}
\author{
Richèl J.C. Bilderbeek
}
