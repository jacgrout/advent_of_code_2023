library(usethis)
library(testthat)
library(stringr)
library(strex)

solve_day_00(load_test_data("00"))

result <- solve_day_01(elf_splits)


file01 <- load_real_data("02")

solve_day_01_2(load_real_data("01"))

solve_day_01_2(load_real_data_p2())


input <- load_test_data("02")

solve_day_02(input)

solve_day_02_2(input)
