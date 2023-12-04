load_test_data <- function(day) {
# add a line in here that turns day into a string
  input_path <- test_path("test-data", paste0("day-", day, ".txt"))

  readLines(input_path, warn = FALSE)

}

load_test_data_p2 <- function(day) {
  # add a line in here that turns day into a string
  input_path <- test_path("test-data", paste0("day-", day,"_2", ".txt"))

  readLines(input_path, warn = FALSE)

}

load_real_data_p2 <- function(day) {
  # add a line in here that turns day into a string
  input_path <- "inst/day-01.txt"

  new <-readLines(input_path, warn = FALSE)
}

load_real_data <- function(day) {

  # add a line in here that turns day into a string

  input_path <- system.file(
    paste0("day-", day, ".txt"),
    package = "aoc.rstats.template"
  )

  readLines(input_path, warn = FALSE)

}
