test_that("produces output", {
  # expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- get_default_ormr_folder_name()
  try(create_conda_env(ormr_folder_name = ormr_folder_name), silent = TRUE)

  python_script_path <- system.file(
    "extdata", "hello_world.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  output <- run_python_script(
    ormr_folder_name = ormr_folder_name,
    python_script_path = python_script_path
  )
  expect_equal(
    output,
    "Hello world\n\n"
  )
})

test_that("calling scrip without args produces output", {
  # expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- get_default_ormr_folder_name()
  try(create_conda_env(ormr_folder_name = ormr_folder_name), silent = TRUE)

  python_script_path <- system.file(
    "extdata", "show_args.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  output <- run_python_script(
    ormr_folder_name = ormr_folder_name,
    python_script_path = python_script_path
  )
  expect_true(
    stringr::str_detect(
      output,
      "Number of arguments: 1\nArguments:"
    )
  )
})

test_that("calling scrip with args produces output", {
  skip("Cannot call Python script with args yet")
  # expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- get_default_ormr_folder_name()
  try(create_conda_env(ormr_folder_name = ormr_folder_name), silent = TRUE)

  python_script_path <- system.file(
    "extdata", "show_args.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  output <- run_python_script(
    ormr_folder_name = ormr_folder_name,
    python_script_path = python_script_path,
    args = c("Hello", "world")
  )
  expect_true(
    stringr::str_detect(
      output,
      "Hello"
    )
  )
})





#
# Tests that use reticulate only
#
test_that("same as 'produces output' below, using reticulate only", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test

  # This test is here for demo purposes only
  if (1 == 2) return()

  # Create and activate a Conda environment
  env_folder <- file.path(tempfile(), "reprex_env")
  python_path <- reticulate::conda_create(
    envname = env_folder
  )
  reticulate::use_condaenv(condaenv = env_folder)
  reticulate::use_python(python = python_path, required = TRUE)

  # Create a Hello World Python script
  python_script_path <- tempfile(fileext = ".py")
  writeLines(text = "print('Hello world')", con = python_script_path)

  # Run the script
  output <- reticulate::py_capture_output(
    reticulate::py_run_file(
      file = python_script_path
    )
  )
  # Confirm the output is as expected
  expect_equal(
    output,
    "Hello world\n\n"
  )
})

test_that(
  paste0(
    "same as 'calling scrip with args produces output' below, ",
    "using reticulate only"
  ), {
    expect_equal(1 + 1, 2) # Prevents testthat warning for empty test

    # This test is here for demo purposes only
    if (1 == 2) return()

    # Create and activate a Conda environment
    env_folder <- file.path(tempfile(), "reprex_env")
    python_path <- reticulate::conda_create(
      envname = env_folder
    )
    reticulate::use_condaenv(condaenv = env_folder)
    reticulate::use_python(python = python_path, required = TRUE)

    # Create a Hello World Python script
    python_script_path <- tempfile(fileext = ".py")
    writeLines(text = "print('Number of arguments:', len(sys.argv))", con = python_script_path)

    # Run the script without arguments goes fine
    output <- reticulate::py_capture_output(
      reticulate::py_run_file(
        file = python_script_path
      )
    )
    expect_equal(output, "Number of arguments: 1\n\n")

    # Run the script
    output <- reticulate::py_capture_output(
      reticulate::py_run_file(
        file = python_script_path,
        args = c("Hello", "world") # This does not work yet
      )
    )
    expect_equal(output, "Number of arguments: 3\n\n")
  })
