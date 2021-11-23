#' Run a Python script with arguments
#' @inheritParams default_params_doc
#' @return The output of the Python script
#' @author Richèl J.C. Bilderbeek
#' @export
run_python_script_with_args <- function(
  ormr_folder_name,
  python_script_path,
  args = c()
) {
  reticulate::use_condaenv(condaenv = ormr_folder_name)
  python_path <- ormr::get_python_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  reticulate::use_python(python = python_path, required = TRUE)
  run_args <- c(
    normalizePath(python_path),
    python_script_path,
    args
  )
  output <- system2(
    command = run_args[1],
    args = run_args[-1],
    stdout = TRUE,
    stderr = TRUE
  )
  output
}
