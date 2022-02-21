test_that("conda, minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  # No expect_silent, as may produce messages
  get_installed_python_packages(
    ormr_folder_name = create_default_conda_env()
  )
})

test_that("conda, eager", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  # Creates a Conda env if needed
  t <- get_installed_python_packages(ormr_folder_name = tempfile())
  expect_equal(4, ncol(t))
  expect_equal(names(t), c("package", "version", "requirement", "channel"))

})

test_that("no conda, minimal use", {
  t <- get_installed_python_packages(
    ormr_folder_name = "python3"
  )
  expect_equal(2, ncol(t))
  expect_equal(names(t), c("package", "version"))
})
