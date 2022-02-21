test_that("use", {
  if (!is_conda_installed()) return()
  suppressMessages(
    expect_message(
      create_and_activate_conda_env(verbose = TRUE),
      "Create the environment, will check if it already exists"
    )
  )
  suppressMessages(
    expect_message(
      create_and_activate_conda_env(verbose = TRUE),
      "Activating the Conda environment with 'condaenv'"
    )
  )
  suppressMessages(
    expect_message(
      create_and_activate_conda_env(verbose = TRUE),
      "Activating Python with'python_path'"
    )
  )
})
