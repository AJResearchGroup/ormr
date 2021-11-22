test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  # See test-does_conda_env_exists for more thorough tests
  ormr_folder_name <- tempfile()

  # Cannot do expect_silent :-(
  create_conda_env(ormr_folder_name = ormr_folder_name)

  unlink(ormr_folder_name, recursive = TRUE)
})

test_that("cannot create env twice", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()

  # Cannot do expect_silent :-(
  create_conda_env(ormr_folder_name = ormr_folder_name)

  expect_error(
    create_conda_env(ormr_folder_name = ormr_folder_name),
    "Conda environment is already created"

  )

  unlink(ormr_folder_name, recursive = TRUE)
})
