test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_pip_installed()) return()
  expect_error(check_pip_is_installed(ormr_folder_name = ormr_folder_name))
})

test_that("use", {
  ormr_folder_name <- tempfile()
  expect_error(
    check_pip_is_installed(ormr_folder_name = ormr_folder_name),
    "'conda_binary_path' not found at"
  )
  if (!plinkr::is_on_ci()) return()

  install_miniconda(ormr_folder_name = ormr_folder_name)
  # Nope, already installed with Miniconda
  if (1 == 2) {
    expect_error(
      check_pip_is_installed(ormr_folder_name = ormr_folder_name),
      "Package 'pip' not found"
    )
    install_pip(
      ormr_folder_name = ormr_folder_name
    )
  }
  expect_silent(
    check_pip_is_installed(ormr_folder_name = ormr_folder_name)
  )
})
