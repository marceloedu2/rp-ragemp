
local cfg = {}

-- PCs positions
cfg.pcs = {
  {442.04299926758, -977.76538085938, 30.689607620239}
}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police" -- service to alert when the tracking is successful
}

-- wanted display
cfg.wanted = {
  blipid = 458,
  blipcolor = 38,
  service = "police"
}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "cannabis",
  "cacaina",
  "folhadecoca",
  "weed"
}

-- jails {x,y,z,radius}
cfg.jails = {
  {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  {459.305603027344,-997.873718261719,24.914867401123,2.1},
  {459.999938964844,-994.331298828125,24.9148578643799,1.6}
}

-- fines
-- map of name -> money
--[[cfg.fines = {
  ["Desacato."] = 0,
  ["Fuga"] = 2500,
  ["Sem habilitação"] = 5000,  
  ["Assalto a Civil"] = 5000,
  ["Assalto a Civil."] = 0,
  ["Porte ilegal de arma"] = 10000,
  ["Porte ilegal de arma."] = 0,
  ["Tráfico de drogas"] = 10000,
  ["Tráfico de drogas."] = 0,
  ["Alta Velocidade"] = 5000,
  ["Alta Velocidade."] = 0, 
  ["Direção Perigosa"] = 5000,
  ["Direção Perigosa."] = 0,
  ["Ultrapassar sinal vermelho"] = 1000,
  ["Ultrapassar sinal vermelho."] = 0, 
  ["Furto/Roubo de veículos."] = 0,
  ["Poluição Sonora"] = 2500,
  ["Poluição Sonora."] = 0,
  ["Assasinato."] = 0,
  ["Tentativa de homicídio."] = 0,
  ["Roubo a Banco."] = 0,
  ["Roubo a Loja."] = 0
}--]]

return cfg
