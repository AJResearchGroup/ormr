#' Install one or more Python packages
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{install_python_package} to install one
#' Python package
#' @examples
#' if (plinkr::is_on_ci()) {
#'
#'   # Use local python
#'  install_python_packages(
#'    package_names = c("scipy", "readline"),
#'    ormr_folder_name = "python3"
#'  )
#'
#'   # Use Conda
#'   if (is_conda_installed()) {
#'     install_python_packages(
#'       package_names = c("scipy", "readline")
#'     )
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  package_names,
  channel = character(),
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  if (ormr_folder_name == "python3") {
    system2(
      command = "python3",
      args = c("-m", "pip", "install", package_names)
    )
  } else {
    ormr::create_and_activate_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version
    )
    ormr::check_conda_env_exists(ormr_folder_name = ormr_folder_name)
    reticulate::conda_install(
      packages = package_names,
      envname = ormr_folder_name,
      channel = channel
    )
  }
  invisible(NULL)
}
