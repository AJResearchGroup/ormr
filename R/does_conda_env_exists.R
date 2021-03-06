#' Determine if a Conda environment exists
#' @inheritParams default_params_doc
#' @return TRUE if a Conda environment exists
#' @examples
#' does_conda_env_exists()
#' does_conda_env_exists(ormr_folder_name = tempfile())
#' @author Richèl J.C. Bilderbeek
#' @export
does_conda_env_exists <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  verbose = FALSE
  ) {
  if (verbose) {
    message(
      "Start of 'does_conda_env_exists', ",
      "ormr_folder_name: ", ormr_folder_name
    )
  }
  result <- FALSE
  tryCatch({
    ormr::check_conda_env_exists(
      ormr_folder_name = ormr_folder_name,
      verbose = verbose
    )
    result <- TRUE
  },
  error = function(e) {
    if (verbose) {
      message(e$message)
    }
  }
  )
  result
}
