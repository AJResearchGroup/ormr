#' Create and/or get the default `ormr` Conda enviroment
#' @inheritParams default_params_doc
#' @return the default `ormr` folder name
#' @examples
#' create_default_conda_env()
#' @author Richèl J.C. Bilderbeek
#' @export
create_default_conda_env <- function(verbose = FALSE) {
  ormr_folder_name <- ormr::get_default_ormr_folder_name()
  tryCatch(
    create_conda_env(ormr_folder_name = ormr_folder_name),
    error = function(e) {
      if (verbose) {
        message(e$message)
      }
    }
  )
  ormr_folder_name
}
