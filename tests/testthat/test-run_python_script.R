test_that("reprex for reiculate issue", {
  skip("reprex")
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

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
    output <- reticulate::py_run_file(
      file = python_script_path
    )
  )
  # Confirm the output is as expected
  expect_equal(
    output,
    "Hello world\n\n"
  )
})


test_that("produces output", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()
  create_conda_env(ormr_folder_name = ormr_folder_name)
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
  unlink(ormr_folder_name, recursive = TRUE)
})
