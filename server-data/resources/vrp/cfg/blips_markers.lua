-- this file is used to define additional static blips and markers to the map
-- some lists: https://wiki.gtanet.work/index.php?title=Blips

local cfg = {}

-- list of blips
-- {x,y,z,idtype,idcolor,text}
cfg.blips = {
  -- Gangs 
  {-1388.7412109375, -586.31683349609, 30.219205856323, 93, 73, "Downtown CO."},
  {-250.604, -2030.000, 30.000, 135, 45, "MazeBank Arena"},
  --{-1171.42, -1572.72, 3.6636, 140, 69, "Smoke on the Water"},
  {-565.171, 276.625, 83.286, 93, 73, "Tequil-La La"},
  {293.089, 180.466, 104.301, 135, 7, "Teatro"},
  {2208.777, 5578.235, 53.735, 469, 69, "Campo de Maconha"},
  {-781.90240478516, 578.94976806641, 126.74822235107, 171, 3, "Processamento de Maconha"},
  {-41.372623443604, 3033.3776855469, 41.020195007324, 51, 3, "Campo de Cocaina"},
  {79.686859130859, 3705.6840820313, 41.077156066895, 51, 4, "Campo de Metanfetamina"},
  {1316.8662109375, -450.48968505859, 76.512893676758, 171, 3, "Processamento de Metanfetamina"},
  {471.25631713867, -1685.3825683594, 29.381580352783, 171, 3, "Processamento de Cocaina"},
  -- Oficina de armas
  {-1111.2841796875, 4937.4052734375, 218.386306762695, 387, 25, "Oficina de Armas"},
  {1539.01794433594, 1704.29174804688, 109.659622192383, 387, 25, "Oficina de Armas"},
  {981.412841796875, -1805.70349121094, 35.48456954956054, 387, 25, "Oficina de Armas"},
  -- Banco
  {150.266, -1040.203, 29.374, 108, 25, "Banco do Brasil"},
  {-1212.980,  -330.841, 37.787, 108, 25, "Banco do Brasil"},
  {-2962.582,  482.627, 15.703, 108, 25, "Banco do Brasil"},
  {-112.202,  6469.295, 31.626, 108, 25, "Banco do Brasil"},
  {314.187,  -278.621, 54.170, 108, 25, "Banco do Brasil"},
  {-351.534,  -49.529, 49.042, 108, 25, "Banco do Brasil"},
  {241.727,  220.706, 106.286, 108, 25, "Banco do Brasil"},
  -- Police Stations
  {425.130, -979.558, 30.711, 60, 26, "Departamento de Policia"},
  {1859.234,  3678.742, 33.690, 60, 26, "Departamento de Policia"},
  {-438.862, 6020.768, 31.490, 60, 26, "Departamento de Policia"},
  {818.221, -1289.883, 26.300, 60, 26, "Departamento de Policia"},
  {1679.049, 2513.711, 45.565, 285, 4, "Prisão"},
  -- Hospitals
  { 1151.21,  -1529.62,  35.37, 61, 11, "Hospital"},
  {-1202.96252441406,-1566.14086914063,4.61040639877319,311,17,"Academia"}
}

-- list of markers
-- {x,y,z,sx,sy,sz,r,g,b,a,visible_distance}
cfg.markers = {
}

return cfg