test_that("use", {
  expect_equal(basename(reticulate::miniconda_path()), "r-miniconda")
  ormr_folder_name <- tempfile()
  expect_equal(
    normalizePath(
      get_miniconda_path(ormr_folder_name = ormr_folder_name),
      mustWork = FALSE
    ),
    normalizePath(
      file.path(ormr_folder_name, "r-miniconda"),
      mustWork = FALSE
    )
  )
})
