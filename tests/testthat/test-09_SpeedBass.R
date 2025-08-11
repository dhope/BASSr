test_that("sumH working as expected", {
  vec <- 1:10
  h <- 1.5
  expect_equal(
    sum(vec) + h,
    sumH(vec, h)
  )

  expect_equal(
    2,
    sumH(1,1))

  expect_error(sumH("s", 1))

  })
