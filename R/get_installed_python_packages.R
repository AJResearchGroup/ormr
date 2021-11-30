#' Get the installed  Python packages and their versions
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with two rows:
#'  * `package`: the package name
#'  * `version`: the package version
#'  * `requirement`: the packages requirements
#'  * `channel`: the package's channel
#' @author Richèl J.C. Bilderbeek
#' @export
get_installed_python_packages <- function(
  ormr_folder_name,
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  ormr::create_and_activate_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )
  tibble::tibble(
    reticulate:::conda_list_packages(envname = ormr_folder_name) # nolint creates Issue to encourage reticulate to export this function, https://github.com/rstudio/reticulate/issues/1056
  )
}
