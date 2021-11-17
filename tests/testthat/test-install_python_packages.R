test_that("use", {
  ormr_folder_name <- tempfile()

  expect_silent(
    install_python_packages(
      ormr_folder_name = ormr_folder_name,
      package_names = "scipy"
    )
  )

  unlink(ormr_folder_name, recursive = TRUE)
})
