

solve_day_01 <- function(input) {
 library(strex)

  first <- as.numeric(substr(as.character(str_first_number(input)), 0, 1))*10

   last <- lapply(split(input,input),str_last_number)
  last_dig <- ((unlist(last)/10)%%1)*10
  comb <- first+last_dig
  answer <- sum(unlist(comb))
  return(answer)
}


solve_day_01_2 <- function(input) {

  input_with_nums <- gsub("one","o1ne",input)
  input_with_nums2 <- gsub("two","t2wo",input_with_nums)
  input_with_nums3 <- gsub("three","t3hree",input_with_nums2)
  input_with_nums4 <- gsub("four","f4our",input_with_nums3)
  input_with_nums5 <- gsub("five","f5ive",input_with_nums4)
  input_with_nums6 <- gsub("six","s6ix",input_with_nums5)
  input_with_nums7 <- gsub("seven","s7even",input_with_nums6)
  input_with_nums8 <- gsub("eight","e8ight",input_with_nums7)
  input_with_nums9 <- gsub("nine","n9ine",input_with_nums8)


  first <- as.numeric(substr(as.character(str_first_number(input_with_nums9)), 0, 1))*10

  last <- lapply(split(input_with_nums9,input_with_nums9),str_last_number)
  last_dig <- ((unlist(last)/10)%%1)*10
  comb <- first+last_dig
  answer <- sum(unlist(comb))
  return(answer)
}
