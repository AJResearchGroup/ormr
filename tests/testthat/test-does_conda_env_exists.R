test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  ormr_folder_name <- tempfile()
  expect_false(does_conda_env_exists(ormr_folder_name = ormr_folder_name))

  create_conda_env(ormr_folder_name = ormr_folder_name)

  ormr_report(ormr_folder_name = ormr_folder_name)

  unlink(ormr_folder_name, recursive = TRUE)
})
