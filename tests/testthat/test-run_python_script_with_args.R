test_that("calling scrip without args produces output", {
  # expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  # if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- create_default_conda_env()

  python_script_path <- system.file(
    "extdata", "show_args.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  output <- run_python_script_with_args(
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

  ormr_folder_name <- create_default_conda_env()

  python_script_path <- system.file(
    "extdata", "show_args.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  output <- run_python_script_with_args(
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
