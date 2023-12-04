test_that("day 01 function achieves expected result", {

  input <- load_test_data("01")  # function in R/utils.R

  result <- solve_day_01(input)  # call our function
  expected_result <- 142  # known result for test data provided by AOC site

  expect_equal(result, expected_result)  # will pass silently

})
