#' Create a \link{ormr} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' ormr_report()
#' @author Richèl J.C. Bilderbeek
#' @export
ormr_report <- function(
  ormr_folder_name
) {
  message("OS: ", rappdirs::app_dir()$os)
  message("ormr_folder_name: ", ormr_folder_name)
  miniconda_path <- ormr::get_miniconda_path(
    ormr_folder_name = ormr_folder_name
  )
  message("Miniconda path: ", miniconda_path)
  if (ormr::is_miniconda_installed(miniconda_path)) {
    message("Miniconda installed: yes")
  } else {
    message("Miniconda installed: no")
  }
  if (ormr::is_pip_installed(ormr_folder_name = ormr_folder_name)) {
    message("pip installed: yes")
    message(
      paste0(
        knitr::kable(
          ormr::list_python_packages(ormr_folder_name = ormr_folder_name)
        ),
        collapse = " \n"
      )
    )
  } else {
    message("pip installed: no")
  }
  message(paste0(devtools::session_info(), collapse = "\n"))
}
