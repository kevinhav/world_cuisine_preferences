# preprocess data
  
library(tidyverse)


main <- function(){

  df <- read.csv("data/food-world-cup-data.csv", check.names = FALSE)
  
  col_names <- c(
    "respondent_id", 
    "knowledge_cuisines", 
    "interest_cuisines", 
    "algeria", 
    "argentina", 
    "australia", 
    "belgium", 
    "bosnia", 
    "brazil", 
    "cameroon", 
    "chile", 
    "colombia", 
    "costa_rica", 
    "croatia", 
    "ecuador", 
    "england", 
    "france", 
    "germany", 
    "ghana", 
    "greece", 
    "honduras", 
    "iran", 
    "italy", 
    "ivory_coast", 
    "japan", 
    "mexico", 
    "netherlands", 
    "nigeria", 
    "portugal", 
    "russia", 
    "south_korea", 
    "spain", 
    "switzerland", 
    "united_states", 
    "uruguay", 
    "china", 
    "india", 
    "thailand", 
    "turkey", 
    "cuba", 
    "ethiopia", 
    "vietnam", 
    "ireland", 
    "gender", 
    "age", 
    "household_income", 
    "education", 
    "location"
  )
  
  # Update column names
  colnames(df) <- col_names
  
  
  # Replace responses with integer values
  df <- df |> 
    mutate(across(4:43, ~ as.numeric(ifelse(. == "N/A", NA, .)))) |> 
    mutate(interest_cuisines = case_when(
      str_detect(interest_cuisines, "A lot") ~ 4,
      str_detect(interest_cuisines, "Some") ~ 3,
      str_detect(interest_cuisines, "Not much") ~ 2,
      str_detect(interest_cuisines, "Not at all") ~ 1,
      TRUE ~ NA
    ))

  
  return(df)
}

data <- main()


