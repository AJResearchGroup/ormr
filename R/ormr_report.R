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
  message("RETICULATE_PYTHON: ", Sys.getenv("RETICULATE_PYTHON"))
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

  conda_envs <- reticulate::conda_list()
  message(
    "List of Conda environments: \n",
    " \n",
    paste0(knitr::kable(conda_envs), collapse = "\n")
  )

  message("General session info: \n")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
