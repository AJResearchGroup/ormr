test_that("use, nothing installed", {
  ormr_report(ormr_folder_name = tempfile())
})

test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()

  create_conda_env(ormr_folder_name = ormr_folder_name)

  ormr_report(ormr_folder_name = tempfile())

  unlink(ormr_folder_name, recursive = TRUE)
})

