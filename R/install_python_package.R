#' Install one Python package
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_package <- function(
  ormr_folder_name,
  package_name,
  verbose = FALSE
) {
  ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
  ormr::check_python_package_name(package_name = package_name)
  reticulate::conda_install(
    packages = package_name,
    envname = ormr_folder_name
  )
  invisible(ormr_folder_name)
}
