


#split the data into a dataframe with colmun one is the game number and column 2 is the rest of the string
df <- as.data.frame(unlist(input_split))
rownames(df) <- 1:nrow(df)

df2 <-
  df |>
  dplyr::rename(string=`unlist(input_split)`) |>
  mutate(startpoint=as.numeric(gregexpr(':',string))) |>
  mutate(tot_len=stringr::str_length(string)) |>
  mutate(game=substr(string,6,startpoint-1)) |>
  mutate(string=substr(string,startpoint+1,tot_len)) |>
  select(-startpoint,-tot_len) |>
  #  mutate(split_out=strsplit(string, ";")) |>
  mutate(words= str_extract_all(string, "\\b[a-z]+\\b", simplify = TRUE)) |>
  mutate(numbs=str_extract_all(string, "\\d+", simplify = TRUE))

get_invalid_game_number <- function(game,maxelementnum){
  invalid=0
  i=1
  total=0
  gamenum=game
  for (i in 1:maxelementnum) {
    cat(paste0("game=",game))
    if (df2$words[gamenum,i] == "red" & as.numeric(df2$numbs[gamenum,i]) >12|
        df2$words[gamenum,i] == "blue" & as.numeric(df2$numbs[gamenum,i]) >14|
        df2$words[gamenum,i] == "green" & as.numeric(df2$numbs[gamenum,i]) >13
    ) {
      result = 1
      #   cat(paste0("result=",result))
      total=total+result
    } else{
      result=0
      #   cat(paste0("result=",result))
      total=total+result
    }
    i=i+1
    # cat(paste0("invalid=",invalid))
    if(total>=1){invalid=as.numeric(df2$game[game])}
    # cat(paste0("invalid=",invalid))
  }
  cat(paste0("invalid=",invalid))
  return(invalid)
}

totinvalids=0
totalrow=0

for (i in 1:nrow(df2)) {
  totalrow = totalrow+i

  totinvalids = totinvalids+get_invalid_game_number(i,length(df2$words)/nrow(df2))
  i=i+1
  cat(paste0("totalrow: ",totalrow))
  cat(paste0("totinvalids: ",totinvalids))
}
result=totalrow-totinvalids
print(result)

return(result)


}


solve_day_02_2 <- function(input) {
  library(dplyr)
  library(stringr)

  input_split <- split(input,input)
  # input_split_game <- str_split(input_split, ":")
  # input_split_out <- str_split(input_split, ";")




  #split the data into a dataframe with colmun one is the game number and column 2 is the rest of the string
  df <- as.data.frame(unlist(input_split))
  rownames(df) <- 1:nrow(df)

  df2 <-
    df |>
    dplyr::rename(string=`unlist(input_split)`) |>
    mutate(startpoint=as.numeric(gregexpr(':',string))) |>
    mutate(tot_len=stringr::str_length(string)) |>
    mutate(game=substr(string,6,startpoint-1)) |>
    mutate(string=substr(string,startpoint+1,tot_len)) |>
    select(-startpoint,-tot_len) |>
    #  mutate(split_out=strsplit(string, ";")) |>
    mutate(words= str_extract_all(string, "\\b[a-z]+\\b", simplify = TRUE)) |>
    mutate(numbs=str_extract_all(string, "\\d+", simplify = TRUE))



  colour="red"
  maxelementnum=18

  get_min_number_for_colour <- function(game,maxelementnum,colour){
    #get the minimum value where the colour is red
    #in the loop
    col <-colour
    i=1
    min=0
    gamenum=game
    maxelnum <-maxelementnum
    for  (i in 1:maxelementnum) {
      redmin <- as.numeric(if(df2$words[gamenum,i] == col ){df2$numbs[gamenum,i]})
      if(redmin>min){min=redmin} else {min=min}
      i=i+1
    }
    return(min)
    #if the result is smaller than the previous result then replace the previous result with this result otherwise leave it
    #return(redmin)
  }

  #get the minimum value where the colour is blue
  #bluemin=

  #get the minimum value where the colour is green
  #greenmin=

  #multiply the three numbers together

}

