test_that("install pip", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  package_name <- "pip"
  ormr_folder_name <- create_default_conda_env()

  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )

  t <- get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  current_scipy_version <- t$version[t$package == "pip"]

  # Install 21.3.0 first, then 21.3.1
  #
  # 1. Install 21.3.0
  package_version <- "21.3.0"
  expect_silent(
    install_python_package_with_version(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      package_version = package_version
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      package_version = package_version
    )
  )

  # New version
  # 2. Install 21.3.1
  package_version <- "21.3.1"
  expect_false(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      package_version = package_version
    )
  )
  expect_silent(
    install_python_package_with_version(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      package_version = package_version
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      package_version = package_version
    )
  )
})

test_that("detect package names with version range", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  expect_error(
    install_python_package_with_version(
      ormr_folder_name = create_default_conda_env(),
      package_name = "setuptools==47.1.1",
      package_version = ""
    )
  )
})
