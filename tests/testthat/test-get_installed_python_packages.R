test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()
  create_conda_env(ormr_folder_name = ormr_folder_name)

  expect_silent(
    get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  )

  unlink(ormr_folder_name, recursive = TRUE)
})

test_that("no env", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()

  expect_error(
    get_installed_python_packages(ormr_folder_name = ormr_folder_name),
    "Tip: run 'ormr::create_conda_env"
  )

  unlink(ormr_folder_name, recursive = TRUE)
})
