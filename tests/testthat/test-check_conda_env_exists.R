test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  check_conda_env_exists(ormr_folder_name = get_default_ormr_folder_name())
})

test_that("use, absent ormr_folder", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  expect_error(
    check_conda_env_exists(ormr_folder_name = tempfile())
  )
})
