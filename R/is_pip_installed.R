#' Determine if `pip` is installed
#' @inheritParams default_params_doc
#' @return TRUE if `pip` is installed
#' @examples
#' is_pip_installed(ormr_folder_name = tempfile())
#' @author Richèl J.C. Bilderbeek
#' @export
is_pip_installed <- function(
  ormr_folder_name,
  verbose = FALSE
) {
  result <- FALSE
  tryCatch({
      ormr::check_pip_is_installed(ormr_folder_name = ormr_folder_name)
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
