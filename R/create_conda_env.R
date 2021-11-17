#' Create a Conda environment
#' @inheritParams default_params_doc
#' @param python_version the Python version,
#' which is 3.6 by default
#' (thanks to \url{https://stackoverflow.com/a/69978354}),
#' as `ormr` is a sub-package
#' for `gcaer`, where the latter needs to install the Python
#' `tensorflow` package. For more recent Python versions, this
#' install fails.
#'
#' @return Nothing
#' @note the output of this function cannot be silenced, thanks
#' to \link[reticulate]{install_miniconda}
#' @examples
#' # Install to a temporary folder
#' ormr_folder_name <- tempfile()
#' create_conda_env(ormr_folder_name = ormr_folder_name)
#'
#' # Clean up
#' unlink(ormr_folder_name, recursive = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
create_conda_env <- function(
  ormr_folder_name,
  python_version = "3.6" # From https://stackoverflow.com/a/69978354
) {
  if (ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)) {
    stop("Conda environment is already created at ", ormr_folder_name)
  }

  reticulate::conda_create(
    envname = ormr_folder_name,
    python_version = python_version
  )
  invisible(ormr_folder_name)
}
