test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  ormr_folder_name <- tempfile()

  expect_false(is_pip_installed(ormr_folder_name))
  install_miniconda(ormr_folder_name = ormr_folder_name)

  # May already be here
  expect_true(is_pip_installed(ormr_folder_name = ormr_folder_name))

  install_pip(ormr_folder_name = ormr_folder_name)
  expect_true(is_pip_installed(ormr_folder_name = ormr_folder_name))
})
