test_that("minimal use", {
  expect_silent(get_default_ormr_folder_name())
})

test_that("always the same folder", {
  expect_equal(
    get_default_ormr_folder_name(),
    get_default_ormr_folder_name()
  )
})
