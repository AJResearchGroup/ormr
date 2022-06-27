#' Determine if a Python package with the right version is installed
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' if (plinkr::is_on_ci()) {
#'
#'   if (is_conda_installed()) {
#'     # Use Conda
#'     ormr_folder_name <- create_default_conda_env()
#'   } else {
#'     # Use local python
#'     ormr_folder_name <- "python3"
#'   }
#'
#'   # Check for an exact version
#'   is_python_package_with_version_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "pip",
#'     package_version = "21.3.1"
#'   )
#'   is_python_package_with_version_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "pip",
#'     package_version = "==21.3.1"
#'   )
#'
#'   # Check for a range
#'   is_python_package_with_version_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "pip",
#'     package_version = "<=21.3.1"
#'   )
#'   is_python_package_with_version_installed(
#'     ormr_folder_name = ormr_folder_name,
#'     package_name = "pip",
#'     package_version = ">=21.3.1"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_python_package_with_version_installed <- function( # nolint indeed a long function name
  package_name,
  package_version,
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
   if(!requireNamespace("semver")){
    stop("'semver' must be installed to use this function: install.packages('semver')")
  }
  # 'get_installed_python_packages' will use 'python3'
  # or call create_and_activate_conda_env'
  t <- ormr::get_installed_python_packages(
    ormr_folder_name = ormr_folder_name,
    python_version = python_version,
    verbose = verbose
  )
  row_index <- which(package_name == t$package)
  if (length(row_index) == 0) return(FALSE)
  testthat::expect_equal(length(row_index), 1)
  installed_version <- t$version[row_index]


  desired_version_str <- stringr::str_match(
    string = package_version,
    pattern = "([=<>]=)?(.*)"
  )
  desired_version_operator <- desired_version_str[1, 2]
  desired_version_no_operator <- desired_version_str[1, 3]
  installed_semver <- semver::parse_version(
    version_to_semversion(installed_version)
  )
  desired_semver <- semver::parse_version(
    version_to_semversion(
      desired_version_no_operator
    )
  )

  if (is.na(desired_version_operator) || desired_version_operator == "==") {
    return(installed_semver == desired_semver)
  }
  if (desired_version_operator == "<=") {
    return(installed_semver <= desired_semver)
  }
  testthat::expect_equal(desired_version_operator, ">=")
  return(installed_semver >= desired_semver)
}
