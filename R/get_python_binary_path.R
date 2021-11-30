#' Get the path to the `python` binary
#' @inheritParams default_params_doc
#' @return the path to the actve `python` binary
#' @examples
#' get_python_binary_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_python_binary_path <- function(
  ormr_folder_name = get_default_ormr_folder_name()
) {
  reticulate:::python_binary_path(dir = ormr_folder_name) # nolint create an Issue to suggest to export this function, see https://github.com/rstudio/reticulate/issues/1086
}
