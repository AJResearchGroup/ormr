test_that("conda, install scipy", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

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

test_that("conda, install mhcnuggets", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  package_name <- "mhcnuggets"
  ormr_folder_name <- create_default_conda_env()

  # Package may already be installed
  is_python_package_installed(
    ormr_folder_name = ormr_folder_name,
    package_name = package_name
  )
  expect_silent(
    install_python_package(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      channel = "bioconda"
    )
  )

  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
})

test_that("conda, detect package names with version range", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  ormr_folder_name <- create_default_conda_env()
  expect_error(
    install_python_package(
      ormr_folder_name = ormr_folder_name,
      package_name = "setuptools==47.1.1"
    ),
    "'package_name' is not in the format of a Python package name"
  )
})

test_that("conda, install scipy", {

  package_name <- "scipy"
  ormr_folder_name <- "python3"

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

test_that("no conda, install mhcnuggets", {

  package_name <- "mhcnuggets"
  ormr_folder_name <- "python3"

  # Package may already be installed
  is_python_package_installed(
    ormr_folder_name = ormr_folder_name,
    package_name = package_name
  )
  expect_silent(
    install_python_package(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name,
      channel = "bioconda"
    )
  )

  expect_true(
    is_python_package_installed(
      ormr_folder_name = ormr_folder_name,
      package_name = package_name
    )
  )
})

test_that("no conda, detect package names with version range", {
  ormr_folder_name <- "python3"
  expect_error(
    install_python_package(
      ormr_folder_name = ormr_folder_name,
      package_name = "setuptools==47.1.1"
    ),
    "'package_name' is not in the format of a Python package name"
  )
})
