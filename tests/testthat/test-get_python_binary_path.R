test_that("use", {
  expect_error(
    get_python_binary_path(
      ormr_folder_name = tempfile()
    ),
    "failed to discover Python binary associated with path"
  )
})
