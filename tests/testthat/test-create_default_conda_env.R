test_that("use", {
  expect_silent(create_default_conda_env())
  expect_message(
    create_default_conda_env(verbose = TRUE),
    "Conda environment is already created"
  )
})
