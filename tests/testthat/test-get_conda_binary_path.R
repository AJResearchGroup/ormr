test_that("use", {
  ormr_folder_name <- tempfile()
  expect_equal(
    file.path(
      get_miniconda_path(ormr_folder_name = ormr_folder_name),
      "bin", "conda"
    ),
    get_conda_binary_path(ormr_folder_name = ormr_folder_name)
  )
})
