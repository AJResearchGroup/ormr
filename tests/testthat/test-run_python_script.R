test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()
  create_conda_env(ormr_folder_name = ormr_folder_name)

  python_script_path <- system.file(
    "extdata", "hello_world.py", package = "ormr"
  )
  expect_true(file.exists(python_script_path))

  run_python_script(
    ormr_folder_name = ormr_folder_name,
    python_script_path = python_script_path
  )

  unlink(ormr_folder_name, recursive = TRUE)
})
