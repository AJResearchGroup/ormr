test_that("use, nothing installed", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  suppressMessages(
    expect_message(
      ormr_report(ormr_folder_name = tempfile()),
      "ormr_folder_name"
    )
  )
})

test_that("use, default version", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  suppressMessages(
    expect_message(
      ormr_report(ormr_folder_name = create_default_conda_env()),
      "ormr_folder_name"
    )
  )
})

test_that("use, default version", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_conda_installed()) return()

  suppressMessages(
    expect_message(
      ormr_report(ormr_folder_name = get_default_ormr_folder_name()),
      "ormr_folder_name"
    )
  )
})
