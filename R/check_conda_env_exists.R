#' Check if the Conda environment exists
#'
#' Check if the Conda environment exists
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_conda_env_exists <- function(
  ormr_folder_name
) {
  conda_envs <- reticulate::conda_list()
  if (!basename(ormr_folder_name) %in% conda_envs$name) {
    stop(
      "Conda environment does not exist. \n",
      "ormr_folder_name: ", ormr_folder_name, " \n",
      "list of Conda environments: \n",
      paste0(knitr::kable(conda_envs), collapse = " \n")
    )
  }

  # Below is old stuff
  if (1 == 2) {
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
  }
  invisible(ormr_folder_name)
}
