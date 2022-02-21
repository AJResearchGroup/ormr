#' Install one Python package
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{install_python_packages} to install one
#' or more Python packages
#' @examples
#' install_python_package(
#'   package_name = "scipy"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_package <- function(
  package_name,
  channel = character(),
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  ormr::check_python_package_name(package_name = package_name)
  if (ormr_folder_name == "python3") {
    system2(
      command = "python3",
      args = c("-m", "pip", "install", package_name)
    )
  } else {
    ormr::create_and_activate_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version,
      verbose = verbose
    )
    ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
    reticulate::conda_install(
      packages = package_name,
      envname = ormr_folder_name,
      channel = channel
    )
  }
  invisible(NULL)
}
