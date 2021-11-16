test_that("use", {
  expect_silent(is_conda_installed(folder_name = tempfile()))
})
