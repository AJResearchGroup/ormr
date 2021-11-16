#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param ormr_folder_name name of the folder where `ormr`
#' installs all Python environments and packages
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link[plinkr]{check_verbose} to detect if this argument is valid.
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  ormr_folder_name,
  verbose
) {
  # Nothing
}
