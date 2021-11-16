test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  # See test-is_miniconda_installed for more thorough tests
  ormr_folder_name <- tempfile()

  # Cannot do expect_silent :-(
  install_miniconda(ormr_folder_name = ormr_folder_name)

  unlink(ormr_folder_name, recursive = TRUE)
})
