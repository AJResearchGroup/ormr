#' Create a `ormr` report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' # Use local python
#' ormr_report(ormr_folder_name = "python3")
#'
#' # 'ormr' is eager and will install Conda if needed
#' if (plinkr::is_on_ci() && is_conda_installed()) {
#'   ormr_report()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
ormr_report <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  message("OS: ", rappdirs::app_dir()$os)
  message("ormr_folder_name: ", ormr_folder_name)
  if (ormr_folder_name == "python3") {
    message("Conda environment exists: no")
  } else {
    ormr::create_and_activate_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version,
      verbose = verbose
    )

    # Eager loading :-)
    testthat::expect_true(
      ormr::does_conda_env_exists(
        ormr_folder_name = ormr_folder_name,
        verbose = verbose
      )
    )
    message("Conda environment exists: yes")
  }
  message(
    paste0(
      "Installed Python packages: \n",
      knitr::kable(
        ormr::get_installed_python_packages(
          ormr_folder_name = ormr_folder_name,
          python_version = python_version,
          verbose = verbose
        )
      ),
      collapse = " \n"
    )
  )
  message("General session info: \n")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
