test_that("use", {
  expect_equal(version_to_semversion("1.2.3"), "1.2.3")
  expect_equal(version_to_semversion("1.2"), "1.2.0")
  expect_equal(version_to_semversion("1"), "1.0.0")
  expect_error(
    version_to_semversion("nonsense"),
    "Cannot convert 'package_version' to a valid 'semver' string"
  )
})
