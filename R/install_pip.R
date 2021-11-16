#' Install `pip`
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' is_pip_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
install_pip <- function(
  ormr_folder_name = create_ormr_folder_name(),
  verbose = FALSE
) {
  if (ormr::is_pip_installed(ormr_folder_name = ormr_folder_name)) {
    stop(
      "Cannot install 'pip', as it is already installed \n",
      "'ormr_folder_name$gcae_folder': ", ormr_folder_name$gcae_folder, " \n",
      "'ormr_folder_name$gcae_version': ", ormr_folder_name$gcae_version, " \n",
      " \n",
      "Tip: run 'ormr::install_pip()'"
    )
  }
  conda_binary_path <- ormr::get_conda_binary_path(ormr_folder_name = ormr_folder_name)
  if (!file.exists(conda_binary_path)) {
    stop(
      "'conda_binary_path' not found at ", conda_binary_path, " \n",
      "Tip: use 'install_miniconda'"
    )

  }
  testthat::expect_true(file.exists(conda_binary_path))
  if (verbose) {
    message("Installing pip for 'conda_binary_path': ", conda_binary_path)
  }
  reticulate::py_install(packages = "pip", conda = conda_binary_path)
  ormr::check_pip_is_installed(ormr_folder_name = ormr_folder_name)
  invisible(ormr_folder_name)
}
