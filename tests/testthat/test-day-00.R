test_that("day 00 functions operate as expected", {

  input <- load_test_data("00")

  result <- solve_day_00(input)
  expected_result <- 24000

  expect_equal(result, expected_result)

})
