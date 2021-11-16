test_that("use", {
  ormr_folder_name <- tempfile()
  install_miniconda(
    ormr_folder_name = ormr_folder_name
  )
  package_name <- "tensorflow"

  t_before <- list_python_packages(ormr_folder_name = ormr_folder_name)
  expect_false(package_name %in% t_before$package)

  install_python_packages(
    ormr_folder_name = ormr_folder_name,
    package_names = "tensorflow"
  )

  t_after <- list_python_packages(ormr_folder_name = ormr_folder_name)
  expect_true(package_name %in% t_after$package)


  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
