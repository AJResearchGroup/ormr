#' Check if Miniconda is installed
#'
#' Check if Miniconda is installed.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_miniconda_is_installed <- function(
  ormr_folder_name
) {
  miniconda_path <- ormr::get_miniconda_path(
    ormr_folder_name = ormr_folder_name
  )
  if (!file.exists(miniconda_path)) {
    stop(
      "Miniconda is not installed: 'miniconda_path' does not exist. \n",
      "ormr_folder_name: ", ormr_folder_name, " \n",
      "miniconda_path: ", miniconda_path
    )
  }
  # These are the same tests as in reticulate::install_miniconda.
  # These functions, however, are not exported.
  # As reticulate currently has 400 open
  # Issues (see https://github.com/rstudio/reticulate/issues),
  # I will not add an Issue to request to export those functions
  normalized_path <- normalizePath(miniconda_path, mustWork = FALSE)
  if (!reticulate:::miniconda_exists(path = normalized_path)) {
    stop(
      "Miniconda is not installed: 'reticulate:::miniconda_exists' is FALSE\n",
      "ormr_folder_name: ", ormr_folder_name, " \n",
      "miniconda_path: ", miniconda_path, " \n",
      "normalized_path: ", normalized_path
    )
  }
  if (!reticulate:::miniconda_test(path = normalized_path)) {
    stop(
      "Miniconda is not installed: 'reticulate:::miniconda_test' is FALSE\n",
      "ormr_folder_name: ", ormr_folder_name, " \n",
      "miniconda_path: ", miniconda_path, " \n",
      "normalized_path: ", normalized_path
    )
  }
  ormr_folder_name
}
