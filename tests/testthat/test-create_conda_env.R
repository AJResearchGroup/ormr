test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  # See test-does_conda_env_exists for more thorough tests
  ormr_folder_name <- tempfile()

  # Cannot do expect_silent :-(
  expect_silent(
    create_conda_env(ormr_folder_name = ormr_folder_name)
  )

  reticulate::use_condaenv()

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

test_that("reticulate-only reprex for #1089", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test

  # This is a reprex, not a test
  if (1 == 2) return()

  # Posted this at https://github.com/rstudio/reticulate/issues/1089
  envname <- tempfile()

  # Produces output, how to suppress this?
  reticulate::conda_create(
    envname = envname
  )

  # Fails

  # Using 'reticulate::py_capture_output'
  reticulate::py_capture_output(
    reticulate::conda_create(
      envname = envname
    )
  )
  # Using suppressMessages
  suppressMessages(
    reticulate::conda_create(
      envname = envname
    )
  )
  # Using sink
  envname <- tempfile()
  sinkfile <- tempfile()
  sink(sinkfile)
  reticulate::conda_create(
    envname = envname
  )
  sink(NULL)

  unlink(envname, recursive = TRUE)
})
