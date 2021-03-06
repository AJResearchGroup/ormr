#' Run a Python script with command-line arguments
#' @inheritParams default_params_doc
#' @return The output of the Python script
#' @seealso use \link{run_python_script} to run a Python
#' script without command-line arguments
#' @examples
#' if (plinkr::is_on_ci()) {
#'
#'   if (is_conda_installed()) {
#'     ormr_folder_name <- create_default_conda_env()
#'   } else {
#'     # Use local python
#'     ormr_folder_name <- "python3"
#'   }
#'
#'   python_script_path <- system.file(
#'     "extdata", "show_args.py", package = "ormr"
#'   )
#'   run_python_script_with_args(
#'     ormr_folder_name = ormr_folder_name,
#'     python_script_path = python_script_path,
#'     args = c("Hello", "world")
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_python_script_with_args <- function(
  python_script_path,
  args = c(),
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  if (ormr_folder_name == "python3") {
    run_args <- c(
      "python3",
      python_script_path,
      args
    )
  } else {
    ormr::create_and_activate_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version
    )
    python_path <- ormr::get_python_binary_path(
      ormr_folder_name = ormr_folder_name
    )
    run_args <- c(
      normalizePath(python_path),
      python_script_path,
      args
    )
  }
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
