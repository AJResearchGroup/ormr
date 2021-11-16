#' Get the path where Miniconda and all Pyton packages will be installed
#' @inheritParams default_params_doc
#' @return the `miniconda_path`, as used by \link[reticulate]{reticulate}
#' @examples
#' get_miniconda_path(ormr_folder_name = tempfile())
#' @author Richèl J.C. Bilderbeek
#' @export
get_miniconda_path <- function(
  ormr_folder_name
) {
  file.path(
    ormr_folder_name,
    basename(reticulate::miniconda_path())
  )
}
