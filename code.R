# Header ------------------------------------------------------------------
# Hospital de Amor [https://hospitaldeamor.com.br/site/]
# Núcleo de Epidemiologia e Bioestatística (NEB) [https://iep.hospitaldeamor.com.br/plataformas-de-apoio/neb/]
# Bioestatístico: Welinton Yoshio Hirai [welinton.hirai@hospitaldeamor.com.br]

#limpando ambiente
rm(list = ls())

setwd("C:/Users/HANEB02/Documents/GitHub/Mapa---SP")

#bibliotecas utilizadas
library(magrittr)
library(dplyr)
library(geobr)
library(sf)
library(ggplot2)

#baixando os dados
data_muni <- geobr::read_municipality(code_muni = 35)

# png('imagens/mapa1.png', width = 2400, height = 1200, res = 200)
#gerando o mapa
data_muni %>% 
  ggplot() +
  geom_sf() +
  theme_void()
# dev.off()

# png('imagens/mapa2.png', width = 2400, height = 1200, res = 200)

#indetificandos apenas a cidade de Barretos
data_muni %>% 
  dplyr::mutate(Indicadora = if_else(name_muni %in% c('Barretos', 'Lavínia'), 1, 0) %>% 
                  as.factor()) %>% 
  ggplot() +
  geom_sf(aes(fill = Indicadora)) +
  theme_void() +
  scale_fill_manual(values = c('white', 'skyblue'))

# dev.off()