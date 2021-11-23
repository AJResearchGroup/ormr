test_that("install scipy", {

  package_name <- "scipy"
  ormr_folder_name <- create_default_conda_env()

  # Package may already be installed
  is_python_package_installed(
    ormr_folder_name = ormr_folder_name,
    package_name = package_name
  )

  expect_silent(
    install_python_package(
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
  ormr_folder_name <- create_default_conda_env()
  expect_error(
    install_python_package(
      ormr_folder_name = ormr_folder_name,
      package_name = "setuptools==47.1.1"
    ),
    "Tip use 'install_python_package_with_version'"
  )
})
