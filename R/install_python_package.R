#' Install one Python package
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{install_python_packages} to install one
#' or more Python packages
#' @examples
#' ormr_folder_name <- create_default_conda_env()
#'
#' # Note that this package may already be installed,
#' # but it works the same for any other package
#' install_python_package(
#'   ormr_folder_name = ormr_folder_name,
#'   package_name = "scipy"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_package <- function(
  ormr_folder_name,
  package_name,
  python_version = "3.6", # From https://stackoverflow.com/a/69978354
  verbose = FALSE
) {
  ormr::check_python_package_name(package_name = package_name)
  ormr::create_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )
  ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
  reticulate::conda_install(
    packages = package_name,
    envname = ormr_folder_name
  )
  invisible(ormr_folder_name)
}
