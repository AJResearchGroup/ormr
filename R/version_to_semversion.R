#' Convert a version number to a \link[semver]{semver} version number
#' @inheritParams default_params_doc
#' @return a version number that is compatible with \link[semver]{semver}
#' @examples
#' version_to_semversion("1.2.3") # "1.2.3"
#' version_to_semversion("1.2") # "1.2.0"
#' version_to_semversion("1") # "1.0.0"
#' @author Richèl J.C. Bilderbeek
#' @export
version_to_semversion <- function(package_version) {
  this_package_version <- package_version
  for (i in seq_len(3)) {
    semversion <- character(0)
    try({
      semver::parse_version(this_package_version)
      semversion <- this_package_version
    },
    silent = TRUE
    )
    if (length(semversion) == 1) return(semversion)
    this_package_version <- paste0(this_package_version, ".0")
  }
  stop(
    "Cannot convert 'package_version' to a valid 'semver' string. \n",
    "package_version: ", package_version
  )
}
