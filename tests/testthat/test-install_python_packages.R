test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  ormr_folder_name <- tempfile()
  install_miniconda(
    ormr_folder_name = ormr_folder_name
  )
  install_python_packages(ormr_folder_name = ormr_folder_name, )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
