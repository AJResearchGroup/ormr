#' Install Miniconda
#' @inheritParams default_params_doc
#' @return Nothing
#' @note the output of this function cannot be silenced, thanks
#' to \link[reticulate]{install_miniconda}
#' @examples
#' # Install to a temporary folder
#' gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
#' miniconda_path <- get_miniconda_path(gcae_options)
#' install_miniconda(miniconda_path = miniconda_path)
#'
#' # Clean up
#' unlink(gcae_options$gcae_folder, recursive = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
install_miniconda <- function(
  ormr_folder_name
) {
  miniconda_path <- get_miniconda_path(ormr_folder_name)
  if (ormr::is_miniconda_installed(ormr_folder_name = ormr_folder_name)) {
    stop("Miniconda is already installed at ", ormr_folder_name)
  }
  dir.create(path = miniconda_path, recursive = TRUE, showWarnings = FALSE)
  tryCatch(
    reticulate::install_miniconda(path = normalizePath(miniconda_path)),
    error = function(e) {
      miniconda_exists <- reticulate:::miniconda_exists(path = miniconda_path)
      message("Miniconda exists: ", miniconda_exists)
      miniconda_passes_test <- reticulate:::miniconda_test(
        path = miniconda_path
      )
      message("Miniconda passes test: ", miniconda_passes_test)
      python_binary_path <- reticulate:::python_binary_path(
        dir = miniconda_path
      )
      message("Miniconda python_binary_path: ", python_binary_path)
      stop("Failed to install Miniconda at ", miniconda_path)
    }
  )
  invisible(ormr_folder_name)
}
