test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- create_default_conda_env()

  expect_false(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "tensorflow"
    )
  )
})
