solve_day_03 <- function(input) {
library(dplyr)
library(stringr)

#FUNCTIONS
  get_horiz_neighbours<-function(x,y){
    horiz_neighbours <- c(paste0(x,",",y-1),paste0(x,",",y+1))
    return(horiz_neighbours)
  }

  get_vert_neighbours<-function(x,y){
    vert_neighbours <- c(paste0(x-1,",",y),paste0(x+1,",",y))
    return(vert_neighbours)
  }

  get_diag_neighbours<-function(x,y){
    diag_neighbours <- c(paste0(x-1,",",y-1),paste0(x-1,",",y+1),paste0(x+1,",",y-1),paste0(x+1,",",y+1))
    return(diag_neighbours)
  }

  is_valid_symbol <- function(x,y){
    if(df2$digit[x,y]=="."){FALSE}else{

      ifelse(grepl("[[:punct:]]", df2$digit[x,y]), TRUE, FALSE)
    }
  }

##############################################################
#import data

  input_split <- split(input,input)
  # input_split_game <- str_split(input_split, ":")
  # input_split_out <- str_split(input_split, ";")


#split the data into a dataframe with colmun one is the string and keep the order of original vector
df <- as.data.frame(unlist(input_split)) |>
  rename(string="unlist(input_split)")
rownames(df) <- 1:nrow(df)
df <- df %>% arrange(factor(string, levels = input))

df2 <-
df |>
mutate(digit= str_extract_all(string, "\\d|\\D", simplify = TRUE))# any digit or not digit
##########################################################################################



}
