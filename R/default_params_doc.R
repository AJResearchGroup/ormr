#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param args arguments to a script, for example `--help`
#' @param ormr_folder_name name of the folder where `ormr`
#' installs all Python environments and packages
#' @param python_script_path path to a Python script
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link[plinkr]{check_verbose} to detect if this argument is valid.
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  args,
  ormr_folder_name,
  python_script_path,
  verbose
) {
  # Nothing
}
