test_that("install scipy", {
  package_name <- "scipy"
  ormr_folder_name <- create_default_conda_env()

  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )

  t <- get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  current_scipy_version <- t$version[t$package == "pip"]

  # Flip-flop between 21.3.0 and 21.3.1
  package_version <- character(0)
  if (current_scipy_version == "21.3.1") {
    package_version <- "21.3.0"
  } else {
    package_version <- "21.3.1"
  }
  testthat::expect_equal(length(package_version), 1)

  skip("HIERO")
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
      package_name = package_name
    )
  )
  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
})

test_that("detect package names with version range", {
  expect_error(
    install_python_package_with_version(
      ormr_folder_name = ormr_folder_name,
      package_name = "setuptools==47.1.1"
    ),
    "Tip use 'install_python_package_with_version_with_version'"
  )
})
