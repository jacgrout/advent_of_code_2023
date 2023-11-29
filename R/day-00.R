solve_day_00 <- function(input) {

  input_num <- as.numeric(input)

  elf_splits <- split(input_num, cumsum(is.na(input_num)))
  elf_sums <- vapply(elf_splits, sum, na.rm = TRUE, FUN.VALUE = numeric(1))

  max(elf_sums)

}
