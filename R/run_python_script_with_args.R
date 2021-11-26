#' Run a Python script with command-line arguments
#' @inheritParams default_params_doc
#' @return The output of the Python script
#' @seealso use \link{run_python_script} to run a Python
#' script without command-line arguments
#' @examples
#' ormr_folder_name <- create_default_conda_env()
#'
#' python_script_path <- system.file(
#'   "extdata", "show_args.py", package = "ormr"
#' )
#' run_python_script_with_args(
#'   ormr_folder_name = ormr_folder_name,
#'   python_script_path = python_script_path,
#'   args = c("Hello", "world")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
run_python_script_with_args <- function(
  ormr_folder_name,
  python_script_path,
  args = c(),
  verbose = FALSE
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
  if (verbose) {
    message(
      "Running: '", paste(run_args, collapse = " "), "'. \n",
      "Tip: you should be able to copy-paste this :-)"
    )
  }
  output <- system2(
    command = run_args[1],
    args = run_args[-1],
    stdout = TRUE,
    stderr = TRUE
  )
  output
}
