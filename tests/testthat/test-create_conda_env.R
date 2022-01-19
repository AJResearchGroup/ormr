test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  reticulate::use_condaenv(
    condaenv = get_default_ormr_folder_name()
  )
})

test_that("creating env twice is harmless", {
  expect_message(
    create_conda_env(
      ormr_folder_name = create_default_conda_env(),
      verbose = TRUE
    ),
    "Conda environment is already created"
  )
})

test_that("installing to /root", {
  expect_error(
    create_conda_env(
      ormr_folder_name = "/root",
      verbose = TRUE
    ),
    "Error creating conda environment ./root"
  )
})

test_that("reticulate-only reprex for #1089", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test

  # This is a reprex, not a test
  if (1 + 1 == 2) return()

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
