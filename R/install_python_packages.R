#' Install the GCAE requirements
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' install_python_packages()
#' @author Richèl J.C. Bilderbeek
#' @export
install_python_packages <- function(
  ormr_folder_name,
  package_names,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  ormr::check_miniconda_is_installed(ormr_folder_name = ormr_folder_name)

  # Install packages
  conda_binary_path <- ormr::get_conda_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  if (verbose) {
    message("conda_binary_path: ", conda_binary_path)
  }
  testthat::expect_true(file.exists(conda_binary_path))
  if (verbose) {
    message("Installing packages: ", paste(package_names, collapse = ", "))
  }
  envname <- dirname(dirname(conda_binary_path))

  reticulate::py_install(
    packages = package_names,
    envname = envname,
    conda = conda_binary_path
  )
  list_python_packages(ormr_folder_name = ormr_folder_name)
  invisible(ormr_folder_name)
}
