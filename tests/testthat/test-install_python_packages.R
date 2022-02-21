test_that("conda, install scipy", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  package_names <- "scipy"
  ormr_folder_name <- create_default_conda_env()

  # Package may already be installed
  is_python_package_installed(
    ormr_folder_name = ormr_folder_name,
    package_name = package_names
  )

  expect_silent(
    install_python_packages(
      ormr_folder_name = ormr_folder_name,
      package_names = package_names
    )
  )
  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_names
    )
  )
})

test_that("no conda, install scipy", {
  package_names <- "scipy"
  ormr_folder_name <- "python3"

  # Package may already be installed
  is_python_package_installed(
    ormr_folder_name = ormr_folder_name,
    package_name = package_names
  )

  expect_silent(
    install_python_packages(
      ormr_folder_name = ormr_folder_name,
      package_names = package_names
    )
  )
  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_names
    )
  )
})
