#' Check if the Conda environment exists
#'
#' Check if the Conda environment exists
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_conda_env_exists <- function(
  ormr_folder_name = get_default_ormr_folder_name()
) {
  reticulate::use_condaenv(condaenv = ormr_folder_name)
  # 'get_python_binary_path' will throw if there is no Conda
  ormr::get_python_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  invisible(ormr_folder_name)
}
