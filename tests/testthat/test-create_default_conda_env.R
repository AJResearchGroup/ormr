test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  expect_silent(create_default_conda_env())
  expect_message(
    create_default_conda_env(verbose = TRUE),
    "Conda environment is already created"
  )
})
