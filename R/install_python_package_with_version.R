#' Install a Python package with a certain version
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' install_python_package_with_version(
#'   package_name = "scipy",
#'   package_version = "1.5.3"
#' )
#' install_python_package_with_version(
#'   package_name = "scipy",
#'   package_version = "1.5.2"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_package_with_version <- function( # nolint indeed a long function name
  package_name,
  package_version,
  ormr_folder_name = get_default_ormr_folder_name()
) {
  ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
  ormr::check_python_package_name(package_name = package_name)

  conda_package_name <- paste0(
    package_name, "==", package_version
  )
  reticulate::conda_install(
    packages = conda_package_name,
    envname = ormr_folder_name,

  )
  invisible(ormr_folder_name)
}
