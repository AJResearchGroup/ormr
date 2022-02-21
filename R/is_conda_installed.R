#' Determine if Conda is installed
#' @return TRUE if Conda is installed, FALSE otherwise
#' @examples
#' is_conda_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_conda_installed <- function() {
  result <- FALSE
  tryCatch({
    reticulate::conda_binary()
    result <- TRUE
  }, error = function(e) {} # nolint no worries
  )
  result
}
