

library(tidyverse)
library(readxl)
library(janitor)

dados_receita <- read_excel("dados/revisao_receita_bbg.xlsx") %>% 
    slice(-1) %>% 
    rename(datas = 1) %>% 
    mutate(
        datas = as.numeric(datas)
    ) %>% 
    mutate(
        datas = excel_numeric_to_date(datas)
    ) %>% 
    pivot_longer(
        cols = -datas,
        names_to = "ticker",
        values_to = "receita"
    ) %>% 
    filter(
        !is.na(receita)
    ) %>% 
    mutate(
        receita = as.numeric(receita)
    )
    
    

dados_juros = read_excel(
    "dados/Dados_4Y_DI_NTNB.xlsx"
) %>% 
    clean_names()



# dados_preco <- read_csv2("dados/dados_2015_2018.csv") %>% 
#     bind_rows("dados/dados_2002_2005.csv" %>%  read_csv2()) %>% 
#     bind_rows("dados/dados_2009_2011.csv" %>%  read_csv2()) 
#     bind_rows("dados/dados_2011_2012.csv" %>%  read_csv2()) 


dados_preco <- read_csv2("dados/dados_TUDO_teste.csv") %>% 
    bind_rows("dados/dados_2002_2005.csv" %>%  read_csv2())    

write_rds(dados_receita, "dados-preparados/dados_receita.rds" )
write_rds(dados_juros, "dados-preparados/dados_juros.rds" )
write_rds(dados_preco, "dados-preparados/dados_preco.rds" )







