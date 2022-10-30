
library(tidyverse)
library(lubridate)
library(leaflet)
library(shiny)
library(shinyhelper)


id <- "1cTekOyvQa0sRKp9IChFW232N67hFidAm"
ufodata <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id))


ufo <- ufodata %>% select(Date_time, UFO_shape, country, latitude, longitude, city) %>%
        filter(country=="gb") %>% 
        filter(!is.na(Date_time)&!is.na(UFO_shape)&!is.na(latitude)&!is.na(longitude)) %>% 
        filter(UFO_shape!=""&latitude!=""&longitude!="") %>% 
        mutate(time=year(mdy_hm(Date_time)),latitude=as.numeric(latitude)) %>%
        mutate(city=str_to_title(city)) %>% 
        filter(!is.na(latitude)) %>% select(-Date_time) 

