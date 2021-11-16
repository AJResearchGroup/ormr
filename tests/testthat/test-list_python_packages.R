test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  ormr_folder_name <- tempfile()
  expect_error(
    list_python_packages(ormr_folder_name = ormr_folder_name),
    "Tip: run 'install_miniconda'"
  )
  install_miniconda(
    ormr_folder_name = ormr_folder_name
  )
  python_packages <- list_python_packages(ormr_folder_name = ormr_folder_name)
  python_packages
})
