% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/default_params_doc.R
\name{default_params_doc}
\alias{default_params_doc}
\title{This function does nothing. It is intended to inherit is parameters'
documentation.}
\usage{
default_params_doc(
  args,
  channel,
  ormr_folder_name,
  package_name,
  package_names,
  package_version,
  python_script_path,
  python_version,
  verbose
)
}
\arguments{
\item{args}{arguments to a script, for example \code{--help}}

\item{channel}{the channel to install Python packages from,
e.g. \code{bioconda}}

\item{ormr_folder_name}{can be either \code{python3}
or the name of the folder where \code{ormr}
installs all Python environments and packages.}

\item{package_name}{the name of one Python package}

\item{package_names}{the names of one or more Python packages}

\item{package_version}{a Python package's version, e.g.
\verb{==3.1}, or \verb{<=2.7.1} or \verb{>=42}}

\item{python_script_path}{path to a Python script}

\item{python_version}{the version of Python used.
Use \link{get_default_python_version} to get
the default Python version.}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link[plinkr]{check_verbose} to detect if this argument is valid.}
}
\description{
This function does nothing. It is intended to inherit is parameters'
documentation.
}
\note{
This is an internal function, so it should be marked with
\code{@noRd}. This is not done, as this will disallow all
functions to find the documentation parameters
}
\author{
Richèl J.C. Bilderbeek
}
