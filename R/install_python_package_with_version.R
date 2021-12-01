#' Install a Python package with a certain version
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' if (!plinkr::is_on_ci()) {
#'   install_python_package_with_version(
#'     package_name = "scipy",
#'     package_version = "1.5.3"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_package_with_version <- function( # nolint indeed a long function name
  package_name,
  package_version,
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  ormr::check_python_package_name(package_name = package_name)
  ormr::create_and_activate_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )

  conda_package_name <- paste0(
    package_name, "==", package_version
  )
  reticulate::conda_install(
    packages = conda_package_name,
    envname = ormr_folder_name,
  )
  invisible(ormr_folder_name)
}
