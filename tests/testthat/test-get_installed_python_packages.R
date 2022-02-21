test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  # No expect_silent, as may produce messages
  get_installed_python_packages(
    ormr_folder_name = create_default_conda_env()
  )
})

test_that("eager", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  # Creates a Conda env if needed
  get_installed_python_packages(ormr_folder_name = tempfile())
})
