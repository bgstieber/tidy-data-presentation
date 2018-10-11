knitr::opts_chunk$set(
  echo = FALSE,
  warning = FALSE,
  message = FALSE,
  fig.align = "center"
)

library(tidyverse)
library(scales)
library(extrafont)
library(knitr)
#options(kableExtra.auto_format = FALSE)
# options(knitr.table.format = "latex")
# library(kableExtra)
loadfonts()
# 
# options(tibble.print_max = 3, tibble.print_min=3)

theme_bgs <- function(){
  theme_bw() +
  theme(text = element_text(family = 'Segoe UI'),
        plot.title = element_text(face = 'plain',
                                  size = 14),
        plot.subtitle = element_text(family = 'Segoe UI Semibold'),
        panel.grid.minor = element_line(colour = "grey98", size = 0.25),
        axis.title = element_text(family = 'Segoe UI Semibold', size = 9),
        panel.border = element_rect(colour = 'grey85'),
        axis.ticks = element_blank(),
        legend.justification = 'top',
        legend.title = element_text(family = 'Segoe UI Semibold'),
        strip.background = element_rect(fill = 'grey92'),
        strip.text = element_text(family = 'Segoe UI Semibold'))
}

theme_set(theme_bgs())

# kable <- function(data, scale_down = FALSE){
#   if(scale_down){
#     data %>%
#       kable(align = 'l', booktabs = T) %>%
#       kable_styling(latex_options = c("scale_down"),
#                     position = 'center')
#   }else{
#     data %>%
#       kable(align = 'l', booktabs = T) %>%
#       kable_styling(position = 'center')
#   }
#   
# }

library(tidyverse)
# knitr::include_graphics('./memes/hadley_tidy_data.jpg')
# knitr::include_graphics('./memes/fed_up_niles2.png')

## First untidy example
kable(table4a %>% mutate_if(is.numeric, 
                                  scales::comma))
tb_data <- table4a
tb_data %>%
    gather(key = year, 
           value = tb_cases, 
           -country) 

## Second untidy example
hec_untidy <- HairEyeColor %>%
    as_data_frame() %>%
    unite('Hair - Eye - Sex', Hair, Eye, Sex, sep = ' - ') %>% 
    head()

hec_untidy %>%
    kable()
hec_untidy %>%
  separate(col = `Hair - Eye - Sex`,
           into = c('hair', 'eye', 'sex'),
           sep = ' - ') # actually not needed
hec_untidy %>%
  separate(col = `Hair - Eye - Sex`,
           into = c('hair', 'eye', 'sex'),
           sep = ' - ') %>% # actually not needed
  uncount(n)

## Third untidy example
mkt_untidy <- EuStockMarkets %>% 
  as_data_frame() %>%
  head(31) %>%
  mutate(day = factor(paste0('d', 1:31), paste0('d', 1:31)),
         year = 2000,
         month = 1) %>%
  gather(stock, value, -day, -month, -year)%>%
  spread(day, value) %>%
  .[, 1:7]

mkt_untidy %>%
  kable()

mkt_untidy %>%
    gather(day, price, starts_with('d')) %>% # wide to long
    spread(stock, price) %>% # long back to wide-ish
    mutate(day = gsub('d', '', day)) %>% # remove "d"
    unite(date, year, month, day, sep = '-') %>% # 3 cols to 1
    mutate(date = lubridate::ymd(date))

mkt_untidy %>%
    gather(day, price, starts_with('d')) %>% # wide to long
    # spread(stock, price) %>% # long back to wide-ish
    mutate(day = gsub('d', '', day)) %>% # remove "d"
    unite(date, year, month, day, sep = '-') %>% # 3 cols to 1
    mutate(date = lubridate::ymd(date))

## another example from tidy data paper

fpath <- "https://raw.githubusercontent.com/tidyverse/tidyr/master/vignettes/weather.csv"

(weather <- read_csv(fpath))
# page 10 (subset of full data)
(weather_sub <- weather[,1:12])
# This is almost tidy, but instead of values, the element
# column contains names of variables.
# Missing values are dropped to conserve space.
(weather_sub2 <- weather_sub %>%
  gather(day, value, starts_with('d')) %>%
  mutate(day = gsub('d', '', day)) %>%
  unite(date, year, month, day, sep = '-') %>%
  mutate(date = as.Date(date, '%Y-%m-%d')) %>%
  na.omit())

# Each row represents the meteorological measurements for a single day. There
# are two measured variables, minimum (tmin) and maximum (tmax) temperature; all other
# variables are fixed.
weather_sub2 %>%
  spread(element, value)

## Fourth untidy example
tw_data <- data_frame(
  golfer = 'Tiger Woods',
  birth_date = structure(2189, class = "Date"),
  birth_place = 'Cypress, CA',
  tournament_date = structure(c(9775, 9789, 9873, 9964), class = "Date"),
  tournament = c("Las Vegas", "Disney", "Mercedes", "Masters"),
  final_score = c("-27", "-21", "-14", "-18")) 

tw_data %>%
  kable(scale_down = TRUE)
# helper function
select_distinct <- function(data, ...){
  select(data, ...) %>%
    distinct()
}
# golfer table
golfer <- tw_data %>% 
  select_distinct(golfer, birth_date, birth_place)

# tournament table
tournament <- tw_data %>% 
  select_distinct(tournament, tournament_date)

# result table
tournament_results <- tw_data %>% 
  select_distinct(tournament, winner = golfer, final_score)

## Fifth untidy example
t_15 <- data_frame(year = 2015, cpi = 237)
t_16 <- data_frame(year = 2016, cpi = 240)
t_17 <- data_frame(year = 2017, cpi = 245)
kable(list(t_15, t_16, t_17))
bind_rows(t_15, t_16, t_17)
