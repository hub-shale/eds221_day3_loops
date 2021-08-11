## 08/11/2021 AM, intro to loops ----
## load packages
library(tidyverse)
library(palmerpenguins)

# All code, formating is limited

# if()
pinyon = 8
juniper = 12

if(pinyon == juniper) {
  print("Nailed It!")
}

if(pinyon > juniper) {
  print("meh")
}

if(pinyon < juniper) {
  print("weird...let's fix that") +
    juniper = juniper + 1
    
}

# ifelse()
plot1_forbs = c("SPAM2", "ERMI", "ERIN4", "PLPA2", "DAPU7", "XYTO", "BRTO")
# DAPU7 is put in as a silent error in the dataset, maybe can do something with it later

str_detect(plot1_forbs, pattern = "ER")
# what I really wanted to do was find ER_ (this line would include any _ER too)


# this isn't working because apparently a regular if() won't accept vectors as input?
if(str_detect(plot1_forbs, pattern = "ER")) {
  print("This is probably an Eriogonum")
} else {
  print("Go check USDA Plants.")
}
# this isn't working because apparently a regular if() won't accept vectors as input?


# as an integrated ifelse(). 
# note that you don't use print() here (using print actually breaks it for some reason)
ifelse(str_detect(plot1_forbs, pattern = "ER"),
  "This is probably an Eriogonum",
  "Go check USDA Plants."
)



# switch()

# modification to the same forb example with switch
switch(plot1_forbs[4],
       "SPAM2" = print("This is Sphaeralcea Ambigua"),
       "ERIN4" = print("This is Eriogonum Inflatum"),
       "PLPA2" = print("This is Plantago Patigonica"),
       print("Go check USDA Plants.")
       )


# for()

soil_type = c("sand", "sandy clay loam", "sandy loam", "sandy loam", 
              "clay", "sandy loam", "silt loam", "sand", "sandy loam")

for (i in seq_along(soil_type)) {
  if (soil_type[i] == "sandy loam") {
    print("this is boring dirt")
  } else {
    print("look at this dirt!")
  }
}


species = c("dog", "elephant", "goat", "dog")
age_human = c(3, 8, 4, 6)

animal_ages = vector(mode = "numeric", length = length(species))

for (i in seq_along(species)) {
  if (species[i] == "dog") {
    animal_ages[i] = age_human[i] * 7
  } else if (species[i] == "elephant") {
    animal_ages[i] = age_human[i] * 0.88
  } else if (species[i] == "goat") {
    animal_ages[i] = age_human[i] * 4.7
  }
}
# revisit this output, there are some weird added NAs


mean_mtcars = vector(mode = "numeric", length = ncol(mtcars))

for(i in 1:ncol(mtcars)) {
  mean_val = mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[i] = mean_val
}

# same thing with apply()

meaner_cars = apply(X = mtcars, MARGIN = 2, FUN = mean, na.rm = TRUE)

meanest_cars = map_df(.x = mtcars, .f = mean, na.rm = TRUE)
# note that this saves it in the environment as data instead of a value


# dplyr:: group_by() / summarize() combo
penguin_summary = penguins %>% group_by(species) %>% 
  summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))
  
test_summary = penguins %>% 
  filter(island == "Torgersen") %>% 
  select(species, flipper_length_mm, year)
#  select() is the equivalent of filter(), but select() is for rows



  