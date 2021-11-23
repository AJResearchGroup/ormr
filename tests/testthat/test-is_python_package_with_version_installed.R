test_that("use", {
  ormr_folder_name <- create_default_conda_env()
  t <- get_installed_python_packages(ormr_folder_name = ormr_folder_name)

  installed_pip_version <- t$version[t$package == "pip"]

  # Actual version
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = paste0("==", installed_pip_version)
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = paste0(">=", installed_pip_version)
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = paste0("<=", installed_pip_version)
    )
  )

  # Older version
  expect_false(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = "==1.0"
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = ">=1.0"
    )
  )
  expect_false(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = "<=1.0"
    )
  )

  # Newer version
  expect_false(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = "==1234567"
    )
  )
  expect_false(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = ">=1234567"
    )
  )
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = "<=1234567"
    )
  )

  # Without an operator
  expect_true(
    is_python_package_with_version_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = "pip",
      package_version = installed_pip_version
    )
  )

})
