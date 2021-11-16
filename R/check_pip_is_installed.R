#' Check if `pip` is installed
#'
#' Check if `pip` is installed.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' if (is_pip_installed()) {
#'   check_pip_is_installed
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_pip_is_installed <- function(
  ormr_folder_name
) {
  conda_binary_path <- ormr::get_conda_binary_path(ormr_folder_name = ormr_folder_name)
  if (!file.exists(conda_binary_path)) {
    stop(
      "'conda_binary_path' not found at ", conda_binary_path, " \n",
      "Tip: use 'ormr::install_miniconda()'"
    )

  }
  t_packages <- tibble::tibble()
  tryCatch(
    suppressMessages(
      suppressWarnings(
        t_packages <- ormr::list_python_packages(ormr_folder_name = ormr_folder_name)
      )
    ),
    warning = function(e) {
      stop(
        "'ormr::list_python_packages(ormr_folder_name)' failed with a warning. \n",
        "'ormr_folder_name': ", ormr_folder_name, " \n",
        "'conda_binary_path': ", conda_binary_path, " \n",
        "Warning ('e$message'): ", e$message, " \n",
        "Warning ('e$warning'): ", e$warning, " \n",
        " \n",
        "Tip: run 'ormr::install_pip()'"
      )
    },
    error = function(e) {
      stop(
        "'ormr::list_python_packages(ormr_folder_name)' failed with an error. \n",
        "'ormr_folder_name': ", ormr_folder_name, " \n",
        "Warning ('e$message'): ", e$message, " \n",
        "Error message: ", e$message, " \n",
        " \n",
        "Tip: run 'ormr::install_pip()'"
      )
    }
  )

  if (!"pip" %in% t_packages$package) {
    stop(
      "Package 'pip' not found in the list ",
      "returned by 'ormr::list_python_packages(ormr_folder_name)'. \n",
      "'ormr_folder_name': ", ormr_folder_name, " \n",
      "packages: ", paste0(t_packages$package, collapse = ", ")," \n",
      " \n",
      "Tip: run 'ormr::install_pip()'"
    )
  }
}
