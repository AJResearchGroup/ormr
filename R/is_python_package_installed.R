#' Determine if a Python package is installed
#' @inheritParams default_params_doc
#' @param package_name the Python package's name
#' @return nothing
#' @examples
#' if (!plinkr::is_on_ci()) {
#'   ormr_folder_name <- tempfile()
#'   package_name <-
#'   create_conda_env(ormr_folder_name = ormr_folder_name)
#'
#'   # setuptools version 47.1.1 is not installed with the Conda environment
#'   is_python_package_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "setuptools==47.1.1"
#'   )
#'
#'   # setuptools is installed with the Conda environment
#'   is_python_package_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "setuptools"
#'   )
#'
#'   # scipy is not installed with the Conda environment
#'   # Use 'ormr::install_python_packages' to install scipy
#'   is_python_package_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "scipy"
#'   )
#'
#' }
#' is_python_package_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_python_package_installed <- function(
  ormr_folder_name,
  package_name
) {
  package_name %in% ormr::get_installed_python_packages(
    ormr_folder_name = ormr_folder_name
  )$package
}
