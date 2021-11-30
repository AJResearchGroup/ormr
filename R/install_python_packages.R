#' Install one or more Python packages
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{install_python_package} to install one
#' Python package
#' @examples
#' ormr_folder_name <- create_default_conda_env()
#'
#' # Note that these packages may already be installed
#' install_python_packages(
#'   ormr_folder_name = ormr_folder_name,
#'   package_names = c("scipy", "readline")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  ormr_folder_name,
  package_names,
  python_version = "3.6", # From https://stackoverflow.com/a/69978354
  verbose = FALSE
) {
  ormr::create_and_activate_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version
  )
  ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
  reticulate::conda_install(
    packages = package_names,
    envname = ormr_folder_name
  )
  invisible(ormr_folder_name)
}
