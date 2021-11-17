#' List the Python packages and their versions
#' @inheritParams default_params_doc
#' @param python_bin path to the Python binary
#' @return a \link[tibble]{tibble} with two rows:
#'  * `package`: the package name
#'  * `version`: the package version
#' @seealso consider using the superior
#' `reticulate:::conda_list_packages(envname = ormr_folder_name)`
#' @author Richèl J.C. Bilderbeek
#' @export
list_python_packages_from_python_bin <- function(
  python_bin,
  verbose = FALSE
) {


  testthat::expect_true(file.exists(python_bin))

  text <- character(0)
  suppressWarnings(
    text <- system2(
      command = normalizePath(python_bin),
      args = c("-m", "pip", "list"),
      stdout = TRUE,
      stderr = TRUE
    )
  )

  # Convert text to matrix
  text_matrix <- stringr::str_split(text, pattern = " +", simplify = TRUE)
  t_packages <- tibble::as_tibble(
    text_matrix[c(-1, -2), ],
    .name_repair = "minimal"
  )
  names(t_packages) <- tolower(text_matrix[1, ])
  t_packages
}
