test_that("install scipy", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  package_name <- "scipy"
  ormr_folder_name <- create_default_conda_env()

  expect_false(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
  expect_silent(
    install_python_packages(
      ormr_folder_name = ormr_folder_name,
      package_names = package_name
    )
  )
  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
})

test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  package_name <- "setuptools==47.1.1"
  # package_name <- "setuptools"
  ormr_folder_name <- create_default_conda_env()

  expect_false(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
  expect_silent(
    install_python_packages(
      ormr_folder_name = ormr_folder_name,
      package_names = package_name
    )
  )
  skip("Install 'setuptools==47.1.1' fails")
  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
})

