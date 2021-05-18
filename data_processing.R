# Cargamos librerías

library(readr)
library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(fs)
library(writexl)
library(xlsx)


## ENERO 16

# Indicamos la ruta donde se encuentra el excel
path <- "01. enero_2016.xls"

# Unificamos el enero 16 por sus Sheet
data_ene16 = path %>% 
  excel_sheets() %>% 
  set_names() %>% 
  map_df(~ read_excel(path = path, sheet = .x), .id = "Sheet")

# Indica el nombre de las columnas
colnames(data_ene16)

# Seleccionamos las columnas que queremos
data_ene16 <- data_ene16%>% select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3")

# Indica valores unico de la columna Sheet
distinct(data_ene16, Sheet)

data_ene16[data_ene16$Sheet == "Albacete" & data_ene16$Sheet == "Azuqueca", ]
subset(data_ene16, Sheet ==  "Azuqueca")

data_ene16 <- filter(data_ene16, Sheet %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca"))

view(data_ene16)


# Guardar el data_ene16
write_xlsx(data_ene16, "C:/Users/Desktop/ene16.xlsx")



# Indicamos la ruta donde se encuentra el excel
path <- "02. febrero_2016.xls"

# Unificamos el feb 16 por sus Sheet
data_feb16 = path %>% 
  excel_sheets() %>% 
  set_names() %>% 
  map_df(~ read_excel(path = path, sheet = .x), .id = "Sheet")

# Indica el nombre de las columnas
colnames(data_feb16)

# Seleccionamos las columnas que queremos
data_feb16 <- data_feb16%>% select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3")

# Indica valores unico de la columna Sheet
distinct(data_feb16, Sheet)


data_feb16 <- filter(data_feb16, Sheet %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto", "Puertollano Campo Futbol" ))


# Guardar el data_feb16
write_xlsx(data_feb16, "C:/Users/Desktop/feb16.xlsx")



# Indicamos la ruta donde se encuentra el excel
path <-  "Junio_2017.xlsx"

# Unificamos el mar 16 por sus Sheet
data_mar16 = path %>% 
  excel_sheets() %>% 
  set_names() %>% 
  map_df(~ read_excel(path = path, sheet = .x), .id = "Sheet")

# Indica el nombre de las columnas
colnames(data_mar16)

# Seleccionamos las columnas que queremos
data_mar16 <- data_mar16%>% select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3")

# Indica valores unico de la columna Sheet
distinct(data_mar16, Sheet)


data_mar16 <- filter(data_mar16, Sheet %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto", "Puertollano Calle Ancha" ))


# Guardar el data_feb16
write_xlsx(data_mar16, "C:/Users/Desktop/mar16.xlsx")



############################

# LIMPIEZA DATOS 2016

# Route to multiple excel files 
paths <- c("01. enero_2016.xls", "02. febrero_2016.xls", "03. marzo_2016.xls", "04. abril-2016.xls","05. mayo_2016.xls",
           "06. junio_2016.xls",  "07. julio_2016.xls" ,  "08. agosto-2016.xls",
"09. septiembre-2016.xls", "10. octubre_2016.xls", "11. noviembre_2016.xls", "12. diciembre_2016.xls")

# run a loop for the length of your char vector with files
for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto", "Puertollano Calle Ancha" ))
  # Save the data
  write_xlsx(data, file)
}

# "C:/Users/Desktop//file.xlsx"




###################################################################################

#########################################

# ITS WORK TO XLSX

read_multiple_excel <- function(path) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = path)
}


data_16 <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "year_month")

write_xlsx(data_16, "C:/Users/Desktop/data_16.xlsx")


data_16 <- read_xlsx("data_16.xlsx")


distinct(data_16, Provincia)


# LIMPIEZA DATOS 2017 con un formato 

# Route to multiple excel files 
paths <- c("11. Noviembre_2017.xlsx", "12. Diciembre_2017.xlsx", "9. Septiembre_2017.xlsx", "Marzo_2017.xlsx")


# run a loop for the length of your char vector with files
for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA","PERIODO", "NO2", "FL_NO2","NO", "FL_NO","O3", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto",
                            "Puertollano Calle Ancha", "Calle Ancha", "Instituto", "Calle Ancha", "Puertollano_CalleAncha", "Calle ancha"))
  # Save the data
  write_xlsx(data, file)
}



# LIMPIEZA DATOS 2017 con dos formato 

# Route to multiple excel files 
paths <- c("10. Octubre_2017.xlsx")

# run a loop for the length of your char vector with files
for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto",
                            "Puertollano Calle Ancha", "Calle Ancha", "Instituto", "Calle Ancha", "Puertollano_CalleAncha", "Calle ancha"))
  # Save the data
  write_xlsx(data, file)
}



# LIMPIEZA DATOS 2017 con tres formato 

# Route to multiple excel files 
paths <- c("11. Noviembre_2017.xlsx", "12. Diciembre_2017.xlsx", "9. Septiembre_2017.xlsx","Abril_2017.xlsx",        
"Agosto_2017.xlsx", "Julio_2017.xlsx","Junio_2017.xlsx","Marzo_2017.xlsx","Mayo_2017.xlsx")

# run a loop for the length of your char vector with files
for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>%
    select("Provincia","FECHA","PERIODO", "NO2", "FL_NO2","NO", "FL_NO","O3", "FL_O3") %>%
    rename(FECHA_HI = FECHA,PERIODO_HI = PERIODO, NO2_HI = NO2, NO_HI = NO, O3_HI = O3)
    
  # Save the data
  write_xlsx(data, file)
}




read_multiple_excel <- function(path) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = path)
}


data_17 <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "year_month")

write_xlsx(data_17, "C:/Users/Desktop/data_17.xlsx")



# LIMPIEZA DATOS 2018 


# Route to multiple excel files 
paths <- c("1. Enero_2018.xlsx", "10. Octubre_2018.xlsx", "11. Noviembre_2018.xlsx", "12. Diciembre_2018.xlsx",
           "2. Febrero_2018.xlsx", "3. Marzo_2018.xlsx", "4. Abril_2018.xlsx","5. Mayo_2018.xlsx",     
           "6. Junio_2018.xlsx", "7. Julio_2018.xlsx","8. Agosto_2018.xlsx", "9. Septiembre_2018.xlsx")

# Run a loop for the length of your char vector with files
for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto",
                            "Puertollano Calle Ancha", "Calle Ancha", "Instituto", "Calle Ancha", "Puertollano_CalleAncha", "Calle ancha"))
  # Save the data
  write_xlsx(data, file)
}


read_multiple_excel <- function(path) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = path)
}


data_18 <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "year_month")

write_xlsx(data_18, "C:/Users/Desktop/data_18.xlsx")



# LIMPIEZA DATOS 2019 


paths <- c("1. Enero_2019.xlsx", "10. Octubre_2019.xlsx", "11. Noviembre_2019.xlsx", "12. Diciembre_2019.xlsx",
    "2. Febrero_2019.xlsx","3. Marzo_2019.xlsx","4. Abril_2019.xlsx", "5. Mayo_2019.xlsx",     
    "6. Junio_2019.xlsx", "7. Julio_2019.xlsx", "8. Agosto_2019.xlsx",   
    "9. Septiembre_2019.xlsx")

# run a loop for the length of your char vector with files

for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto",
                            "Puertollano Calle Ancha", "Calle Ancha", "Instituto", "Calle Ancha", "Puertollano_CalleAncha", "Calle ancha"))
  # Save the data
  write_xlsx(data, file)
}


read_multiple_excel <- function(path) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = path)
}


data_19 <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "year_month")

write_xlsx(data_19, "C:/Users/Desktop/data_19.xlsx")




# LIMPIEZA DATOS 2020 


paths <- c("10.Octubre_2020.xlsx", "11.Noviembre_2020.xlsx", "12.Diciembre_2020.xlsx",
            "5. Mayo_2020.xlsx", "6. Junio_2020.xlsx", "7. Julio_2020.xlsx", "8. Agosto_2020.xlsx",
            "9.Septiembre_2020.xlsx", "1. Enero_2020_2.xlsx", "2. Febrero_2020.xlsx",
            "3. Marzo_2020.xlsx","4. Abril_2020.xlsx")

# run a loop for the length of your char vector with files

for (i in 1:length(paths)){
  # select position from vector acording to loop index
  file <- paths[i]
  # Unificate data for Sheet
  data <- excel_sheets(file) %>% 
    set_names() %>% 
    map_df(~ read_excel(path = file, sheet = .x), .id = "Sheet") %>% 
    select("Sheet","FECHA_HI","PERIODO_HI", "NO2_HI", "FL_NO2","NO_HI", "FL_NO","O3_HI", "FL_O3") %>% 
    rename(Provincia = Sheet)%>%
    filter(Provincia %in% c("Albacete", "Azuqueca", "Toledo", "Puertollano_Calle_Ancha", "Puertollano_Instituto", "Cuenca", "Puertollano Instituto",
                            "Puertollano Calle Ancha", "Calle Ancha", "Instituto", "Calle Ancha", "Puertollano_CalleAncha", "Calle ancha"))
  # Save the data
  write_xlsx(data, file)
}



#  LIMPIEZA DATOS 2020

paths2 <- c("10.Octubre_2020.xlsx", "11.Noviembre_2020.xlsx", "12.Diciembre_2020.xlsx",
            "5. Mayo_2020.xlsx", "6. Junio_2020.xlsx", "7. Julio_2020.xlsx", "8. Agosto_2020.xlsx",
            "9.Septiembre_2020.xlsx", "1. Enero_2020_2.xlsx", "2. Febrero_2020.xlsx",
            "3. Marzo_2020.xlsx","4. Abril_2020.xlsx")

read_multiple_excel <- function(paths2) {
  paths2%>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = paths2)
}


data_20 <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "year_month")


write_xlsx(data_20, "C:/Users/Desktop/data_20.xlsx")



# UNIFICACION DE DATOS DE 16, 17, 18, 19, 20 

paths3 <- c("data_16.xlsx", "data_17.xlsx", "data_18.xlsx", "data_19.xlsx", "data_20.xlsx")

read_multiple_excel <- function(paths3) {
  paths3 %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = paths3)
}


data <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "unificate")


write_xlsx(data, "C:/Users/Desktop/data1.xlsx")

