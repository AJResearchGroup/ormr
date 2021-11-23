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
