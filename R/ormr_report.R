#' Create a `ormr` report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' ormr_report(ormr_folder_name = tempfile())
#' @author Richèl J.C. Bilderbeek
#' @export
ormr_report <- function(
  ormr_folder_name
) {
  message("OS: ", rappdirs::app_dir()$os)
  message("ormr_folder_name: ", ormr_folder_name)
  if (ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)) {
    message("Conda environment exists: yes")
  } else {
    message("Conda environment exists: no")
  }
  if (ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)) {
    message("Installed Python packages: ")
    message(
      paste0(
        knitr::kable(
          get_installed_python_packages(
            ormr_folder_name = ormr_folder_name
          )
        ),
        collapse = " \n"
      )
    )
  } else {
    message("Installed Python packages: N/A (need Conda environment to exist)")
  }
  message(paste0(devtools::session_info(), collapse = "\n"))
}
