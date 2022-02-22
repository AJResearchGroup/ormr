#' Get the path to the `python` binary
#' @inheritParams default_params_doc
#' @return the path to the actve `python` binary
#' @examples
#' # local Python version
#' # just returns 'python3'
#' get_python_binary_path(ormr_folder_name = "python3")
#'
#' # Conda Python version
#' if (is_conda_installed()) {
#'   get_python_binary_path()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_python_binary_path <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  verbose = FALSE
) {
  if (verbose) {
    message(
      "Start of 'get_python_binary_path', ",
      "ormr_folder_name: ", ormr_folder_name
    )
  }
  if (ormr_folder_name == "python3") {
    python_binary_path <- "python3"
  } else {
    python_binary_path <- reticulate:::python_binary_path(dir = ormr_folder_name) # nolint created an Issue to suggest to export this function, see https://github.com/rstudio/reticulate/issues/1086
  }
  python_binary_path
}
