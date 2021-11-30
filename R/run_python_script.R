#' Run a Python script
#' @inheritParams default_params_doc
#' @return The output of the Python script
#' @seealso use \link{run_python_script_with_args} to run a Python
#' script with command-line arguments
#' @examples
#' ormr_folder_name <- create_default_conda_env()
#' python_script_path <- system.file(
#'   "extdata", "hello_world.py", package = "ormr"
#' )
#' run_python_script(
#'   ormr_folder_name = ormr_folder_name,
#'   python_script_path = python_script_path
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
run_python_script <- function(
  python_script_path,
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  ormr::create_and_activate_conda_env(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )
  output <- reticulate::py_capture_output(
    reticulate::py_run_file(
      file = python_script_path
    )
  )
  output
}
