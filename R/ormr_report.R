#' Create a `ormr` report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' ormr_report(ormr_folder_name = tempfile())
#' @author Richèl J.C. Bilderbeek
#' @export
ormr_report <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  ormr::create_and_activate_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )
  message("OS: ", rappdirs::app_dir()$os)
  message("ormr_folder_name: ", ormr_folder_name)
  if (ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)) {
    message("Conda environment exists: yes")
  } else {
    message("Conda environment exists: no")
  }
  if (ormr::does_conda_env_exists(ormr_folder_name = ormr_folder_name)) {
    tryCatch(
      message(
        paste0(
          "Installed Python packages: \n",
          knitr::kable(
            ormr::get_installed_python_packages(
              ormr_folder_name = ormr_folder_name
            )
          ),
          collapse = " \n"
        )
      ),
      error = function(e) {
        message(
          "Installed Python packages: N/A (",
          e$message,
          ")"
        )
      }
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
