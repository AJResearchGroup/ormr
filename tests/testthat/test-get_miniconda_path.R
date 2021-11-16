test_that("use", {
  expect_equal(basename(reticulate::miniconda_path()), "r-miniconda")
  ormr_folder_name <- tempfile()
  expect_equal(
    get_miniconda_path(ormr_folder_name = ormr_folder_name),
    "~/.local/share/gcaer/r-miniconda"
  )
})
