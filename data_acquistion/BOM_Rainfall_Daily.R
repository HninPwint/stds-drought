library(stringr)
library(dplyr)
library(ASGS)
library(ASGS.foyer)
library(readxl)
library(tidyverse)

# Load the text files of monthly Evaporation data
bom_temp_daily_list <- list.files(path="acorn_sat_v2_daily_tmax", pattern="*.daily.xls$")

filelist <- sapply(bom_temp_daily_list, read_excel, simplify = FALSE)
bind_rows(.id= "id")
view(bom_temp_daily_list)
