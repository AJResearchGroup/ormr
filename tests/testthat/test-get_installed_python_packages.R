test_that("minimal use", {
  expect_silent(
    get_installed_python_packages(
      ormr_folder_name = create_default_conda_env()
    )
  )
})

test_that("no env", {
  ormr_folder_name <- tempfile()
  expect_error(
    get_installed_python_packages(ormr_folder_name = ormr_folder_name),
    "Tip: run 'ormr::create_conda_env"
  )
  expect_false(dir.exists(ormr_folder_name))
})
