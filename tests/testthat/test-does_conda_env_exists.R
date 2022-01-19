test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()

  expect_false(does_conda_env_exists(ormr_folder_name = ormr_folder_name))

  create_conda_env(ormr_folder_name = ormr_folder_name)

  expect_true(does_conda_env_exists(ormr_folder_name = ormr_folder_name))

  unlink(ormr_folder_name, recursive = TRUE)
})

test_that("verbose", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()
  expect_message(
    does_conda_env_exists(
      ormr_folder_name = ormr_folder_name,
      verbose = TRUE
    ),
    "failed to discover Python binary associated with path|Unable to locate conda environment" # nolint indeed a long line
  )

  create_conda_env(ormr_folder_name = ormr_folder_name)

  expect_silent(
    does_conda_env_exists(
      ormr_folder_name = ormr_folder_name,
      verbose = TRUE
    )
  )

  unlink(ormr_folder_name, recursive = TRUE)
})
