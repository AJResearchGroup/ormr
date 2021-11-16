test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  ormr_folder_name <- tempfile()
  expect_false(is_miniconda_installed(ormr_folder_name = ormr_folder_name))
  gcaer_report(ormr_folder_name = ormr_folder_name)

  install_miniconda(ormr_folder_name = ormr_folder_name)

  expect_true(is_miniconda_installed(ormr_folder_name = ormr_folder_name))
  gcaer_report(ormr_folder_name = ormr_folder_name)

  unlink(ormr_folder_name, recursive = TRUE)
})
