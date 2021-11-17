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
  invisible(ormr_folder_name)
}
