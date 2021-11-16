#' Determine if Conda is installed in the `ormr_folder_name`
#' @inheritParams default_params_doc
#' @export
is_miniconda_installed <- function(ormr_folder_name) {
  # These are the same tests as in reticulate::install_miniconda.
  # These functions, however, are not exported.
  # As reticulate currently has 400 open
  # Issues (see https://github.com/rstudio/reticulate/issues),
  # I will not add an Issue to request to export those functions
  normalized_path <- normalizePath(ormr_folder_name, mustWork = FALSE)
  reticulate:::miniconda_exists(path = normalized_path) &&
    reticulate:::miniconda_test(path = normalized_path)
}
