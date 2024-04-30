# Header ------------------------------------------------------------------
# Hospital de Amor [https://hospitaldeamor.com.br/site/]
# Núcleo de Epidemiologia e Bioestatística (NEB) [https://iep.hospitaldeamor.com.br/plataformas-de-apoio/neb/]
# Bioestatístico: Welinton Yoshio Hirai [welinton.hirai@hospitaldeamor.com.br]

#limpando ambiente
rm(list = ls())

#bibliotecas utilizadas
library(magrittr)
library(dplyr)
library(geobr)
library(sf)
library(ggplot2)

#baixando os dados
data_muni <- geobr::read_municipality(code_muni = 35)

#gerando o mapa
data_muni %>% 
  ggplot() +
  geom_sf() +
  theme_void()

#indetificandos apenas a cidade de Barretos
data_muni %>% 
  dplyr::mutate(Indicadora = if_else(name_muni == 'Barretos', 1, 0) %>% 
                  as.factor()) %>% 
  ggplot() +
  geom_sf(aes(fill = Indicadora)) +
  theme_void() +
  scale_fill_manual(values = c('white', 'skyblue'))
