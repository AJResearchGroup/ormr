#' Create and/or get the default `ormr` Conda enviroment
#' @inheritParams default_params_doc
#' @return the default `ormr` folder name
#' @examples
#' create_default_conda_env()
#' @author Richèl J.C. Bilderbeek
#' @export
create_default_conda_env <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  tryCatch(
    ormr::create_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version,
      verbose = verbose
    ),
    error = function(e) {
      if (verbose) {
        message(e$message)
      }
    }
  )
  ormr_folder_name
}
