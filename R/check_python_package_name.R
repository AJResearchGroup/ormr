#' Check if the Python package name is valid
#'
#' Check if the Python package name is valid
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' check_python_package_name("scipy")
#' @author Richèl J.C. Bilderbeek
#' @export
check_python_package_name <- function(package_name) {
  if (length(package_name) != 1) {
    stop(
      "'package_name' must be exactly one Python package name. \n",
      "'length(package_name)': ", length(package_name)
    )
  }
  if (!is.character(package_name)) {
    stop(
      "'package_name' must be a character vector. \n",
      "'class(package_name)': ", class(package_name)
    )
  }
  if (!stringr::str_detect(
      string = package_name,
      pattern = "^[a-z0-9_-]+$"
    )
  ) {
    stop(
      "'package_name' is not in the format of a Python package name. \n",
      "'package_name': ", package_name
    )
  }
  invisible(package_name)
}
