test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (does_conda_env_exists()) check_conda_env_exists()
})

test_that("use, absent ormr_folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  expect_error(
    check_conda_env_exists(ormr_folder_name = tempfile())
  )
})
