#' Determine if a Python package is installed
#' @inheritParams default_params_doc
#' @param package_name the Python package's name
#' @return nothing
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
