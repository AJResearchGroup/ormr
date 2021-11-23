test_that("use, nothing installed", {
  suppressMessages(
    expect_message(
      ormr_report(ormr_folder_name = tempfile()),
      "ormr_folder_name"
    )
  )
})

test_that("use, default version", {
  suppressMessages(
    expect_message(
      ormr_report(ormr_folder_name = create_default_conda_env()),
      "ormr_folder_name"
    )
  )
})

test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()

  ormr_folder_name <- tempfile()

  create_conda_env(ormr_folder_name = ormr_folder_name)

  ormr_report(ormr_folder_name = tempfile())

  unlink(ormr_folder_name, recursive = TRUE)
})

