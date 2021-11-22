#' Run a Python script
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
run_python_script <- function(
  ormr_folder_name,
  python_script_path
) {
  reticulate::use_condaenv(condaenv = ormr_folder_name)
  python_path <- ormr::get_python_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  reticulate::use_python(python = python_path, required = TRUE)
  reticulate::py_run_file(
    file = python_script_path
  )
  invisible(ormr_folder_name)
}
