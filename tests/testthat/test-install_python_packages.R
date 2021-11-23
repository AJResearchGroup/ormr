test_that("install scipy", {
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
