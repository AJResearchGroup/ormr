#' Creates and activates the Conda environment
#'
#' Creates and activates the Conda environment.
#' If the Conda environment already exists, nothing new will happen
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' if (!plinkr::is_on_ci()) {
#'   create_and_activate_conda_env()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_and_activate_conda_env <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  if (verbose) {
    message("Create the environment, will check if it already exists")
  }
  tryCatch(
    ormr::create_conda_env(
      ormr_folder_name = ormr_folder_name,
      python_version = python_version,
      verbose = verbose
    ),
    error = function(e) {
      if (verbose) {
        message(
          "'create_conda_env' failed, which may be harmless, ",
          "e.g. when creating a Conda env in a read-only environment"
        )
      }
    }
  )

  if (verbose) {
    message(
      "Activating the Conda environment with 'condaenv' ",
      ormr_folder_name
    )
  }
  reticulate::use_condaenv(condaenv = ormr_folder_name)

  if (verbose) {
    message(
      "Obtaining the Python binary path in folder ",
      ormr_folder_name
    )
  }

  python_path <- ormr::get_python_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  if (verbose) {
    message("Activating Python with'python_path' ", python_path)
  }
  reticulate::use_python(python = python_path, required = TRUE)


  invisible(ormr_folder_name)
}
