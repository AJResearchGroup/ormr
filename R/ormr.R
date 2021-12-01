#' `ormr`: work with Python packages and scripts from R.
#'
#' `ormr` allows a user to install Python packages,
#' create a Conda environment and run Python scripts
#' with only one point of contact.
#'
#' `ormr` was written to write simpler Singularity
#' (\url{https://singularity.hpcng.org/}) (a type of containerization
#' software, similar to Docker) scripts.
#'
#' `reticulate` is great when using its default folders on a local computer.
#' However, for a Singularity container, it is recommended to install
#' libraries in a systems folder. In that setting, `reticulate` is
#' harder to work with.
#'
#' `ormr` allows to install install Python packages,
#' create a Conda environment and run Python scripts
#' in any folder easily, for example,
#' in a system folder (`/opt/ormr`) of a Singularity container.
#'
#' @examples
#' # Install a package
#' if (plinkr::is_on_ci()) {
#'   install_python_package(
#'     package_name = "scipy"
#'   )
#' }
#'
#' # Run a Python scripts
#' if (plinkr::is_on_ci()) {
#'   python_script_path <- system.file(
#'   "extdata", "hello_world.py", package = "ormr"
#'   )
#'   run_python_script(
#'     python_script_path = python_script_path
#'   )
#' }
#'
#' # Run a Python script with arguments
#' if (plinkr::is_on_ci()) {
#'   python_script_path <- system.file(
#'     "extdata", "show_args.py", package = "ormr"
#'   )
#'   run_python_script_with_args(
#'     python_script_path = python_script_path,
#'     args = c("Hello", "world")
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name ormr
NULL
