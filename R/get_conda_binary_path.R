#' Get the path to the `conda` binary
#' @inheritParams default_params_doc
#' @return the path to the `conda` binary
#' @examples
#' get_conda_binary_path()
#' @author Richèl J.C. Bilderbeek
#' @export
 get_conda_binary_path <- function(
   ormr_folder_name
) {
  file.path(
    ormr::get_miniconda_path(ormr_folder_name = ormr_folder_name),
    "bin",
    "conda"
  )
}
