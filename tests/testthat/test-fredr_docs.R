test_that("fredr_docs just works...", {
  skip_on_cran()
  skip_if_offline()
  expect_silent(fredr_docs())
})
