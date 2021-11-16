test_that("use", {
  ormr_folder_name <- tempfile()
  python_binary_path <- get_python_binary_path(
    ormr_folder_name = ormr_folder_name
  )
  expect_true(
    stringr::str_detect(
      string = python_binary_path,
      pattern = "r-miniconda.envs.r-reticulate.bin.python"
    )
  )
})
