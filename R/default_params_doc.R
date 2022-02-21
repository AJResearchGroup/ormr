#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param args arguments to a script, for example `--help`
#' @param channel the channel to install Python packages from,
#' e.g. `bioconda`
#' @param ormr_folder_name can be either `python3`
#' or the name of the folder where `ormr`
#' installs all Python environments and packages.
#' @param package_name the name of one Python package
#' @param package_names the names of one or more Python packages
#' @param package_version a Python package's version, e.g.
#' `==3.1`, or `<=2.7.1` or `>=42`
#' @param python_script_path path to a Python script
#' @param python_version the version of Python used.
#' Use \link{get_default_python_version} to get
#' the default Python version.
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link[plinkr]{check_verbose} to detect if this argument is valid.
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  args,
  channel,
  ormr_folder_name,
  package_name,
  package_names,
  package_version,
  python_script_path,
  python_version,
  verbose
) {
  # Nothing
}
