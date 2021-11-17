test_that("use", {
  expect_error(
    check_conda_env_exists(ormr_folder_name = tempfile())
  )
})
