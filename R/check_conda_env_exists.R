#' Check if the Conda environment exists
#'
#' Check if the Conda environment exists
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' if (!plinkr::is_on_ci()) {
#'   if (does_conda_env_exists()) {
#'     check_conda_env_exists()
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_conda_env_exists <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  verbose = FALSE
) {
  if (verbose) {
    message(
      "Start of 'check_conda_env_exists', ",
      "ormr_folder_name: ", ormr_folder_name
    )
  }

  reticulate::use_condaenv(condaenv = ormr_folder_name)
  if (verbose) {
    message(
      "Before getting the python binary path ",
      "(to make Conda throw if it is absent)"
    )
  }
  # 'get_python_binary_path' will throw if there is no Conda
  ormr::get_python_binary_path(
    ormr_folder_name = ormr_folder_name,
    verbose = verbose
  )
  invisible(ormr_folder_name)
}
