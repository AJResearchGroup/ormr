#' Install Python packages
#' @inheritParams default_params_doc
#' @param package_names names of one or more Python packages
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  ormr_folder_name,
  package_names,
  verbose = FALSE
) {
  reticulate::conda_install(
    packages = package_names,
    envname = ormr_folder_name
  )
  invisible(ormr_folder_name)
}
