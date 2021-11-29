test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  skip("No checking now")
  expect_error(
    check_conda_env_exists(ormr_folder_name = tempfile())
  )
})
