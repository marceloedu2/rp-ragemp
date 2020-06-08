
local cfg = {}

-- example of study transformer
local itemtr_study = {
  name="Estante de Livros", -- menu name
  r=0,g=255,b=0, -- color
  max_units=20,
  units_per_minute=10,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["Livros de Produtos Quimicos"] = { -- action name
      description="Leia um livro de produtos Quimicos", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["science.chemicals"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    },
    ["Livros de Matemática"] = { -- action name
      description="Leia um Livro de Matemática", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["science.mathematics"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    }
  }
}

----------------------------------------------------------------------------------------- laboratory
local itemtr_laboratory = {
  name="Mesa de Processamento", -- menu name
  r=0,g=255,b=0, -- color
  max_units=20,
  units_per_minute=20,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["Cocaina"] = { -- action name
      description="Processar Cocaina", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["folhadecoca"] = 1
	  
	  },
      products={ -- items given per unit
	  ["cocaina"] = 1
	  }, 
      aptitudes={ -- optional
        ["laboratory.cocaine"] = 5, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 10
	  }
    },
    ["Metanfetamina"] = { -- action name
      description="Processar Metanfetamina", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["crystalmelamine"] = 1
	  
	  },
      products={ -- items given per unit
	  ["metanfetamina"] = 1
	  }, 
      aptitudes={ -- optional
        ["laboratory.cocaine"] = 5, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 10
	  }
    },	
	["Maconha"] = { -- action name
      description="Processar Maconha", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["weed"] = 1
	  },
      products={ -- items given per unit
	  ["cannabis"] = 1
	  }, 
      aptitudes={ -- optional
        ["laboratory.weed"] = 5, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 10
	  }
    },
  }
}

-- default flats positions from https://github.com/Nadochima/HomeGTAV/blob/master/List

-- define the home slots (each entry coordinate should be unique for ALL types)
-- each slots is a list of home components
--- {component,x,y,z} (optional _config)
--- the entry component is required
cfg.slot_types = {
  ["basic_flat"] = {
    {
      {"entry",-782.171,324.589,223.258},
      {"chest",-773.718078613281,325.144409179688,223.266357421875, _config = {weight=200}},
      {"wardrobe",-760.885437011719,325.457153320313,217.061080932617},
      {"gametable",-755.40185546875,318.263214111328,221.875823974609},
	  {"itemtr", _config = itemtr_laboratory, -772.294372558594,328.913177490234,223.261581420898},
      {"itemtr", _config = itemtr_study, -758.670104980469,315.048156738281,221.854904174805}
    },
    {
      {"entry",-774.171,333.589,207.621},
      {"chest",-782.118591308594,332.147399902344,207.629608154297, _config = {weight=200}},
      {"wardrobe",-795.118469238281,331.631256103516,201.42431640625},
      {"gametable",-800.763427734375,338.574951171875,206.239105224609},
	  {"itemtr", _config = itemtr_laboratory, -783.788635253906,328.553985595703,207.625396728516},
      {"itemtr", _config = itemtr_study, -797.283447265625,342.134338378906,206.21842956543}
    },
    {
      {"entry",-774.171,333.589,159.998},
      {"chest",-782.66015625,332.523284912109,160.010223388672, _config = {weight=200}},
      {"wardrobe",-795.550964355469,332.229614257813,153.804931640625},
      {"gametable",-801.228942871094,339.106231689453,158.619750976563},
	  {"itemtr", _config = itemtr_laboratory, -784.178588867188,328.916839599609,160.006057739258},
      {"itemtr", _config = itemtr_study, -797.896728515625,342.543273925781,158.599044799805}
    },
    {
      {"entry",-596.689,59.139,108.030},
      {"chest",-604.427001953125,57.0807762145996,108.035743713379, _config = {weight=200}},
      {"wardrobe",-617.180358886719,56.9536590576172,101.830520629883},
      {"gametable",-623.078796386719,63.688045501709,106.645317077637},
	  {"itemtr", _config = itemtr_laboratory, -605.9560546875,53.3968696594238,108.031196594238},
      {"itemtr", _config = itemtr_study, -619.724853515625,67.1367950439453,106.624366760254}
    },
    {
      {"entry",-1451.557,-523.546,69.556},
      {"chest",-1457.28601074219,-529.699523925781,69.565315246582, _config = {weight=200}},
      {"wardrobe",-1467.07995605469,-536.98583984375,63.3601188659668},
      {"gametable",-1476.12658691406,-534.873474121094,68.1748962402344},
	  {"itemtr", _config = itemtr_laboratory, -1456.35876464844,-533.55029296875,69.5607528686523},
      {"itemtr", _config = itemtr_study, -1475.36840820313,-530.117126464844,68.1540756225586}
    },
    {
      {"entry",-1452.185,-522.640,56.929},
      {"chest",-1457.3740234375,-529.737854003906,56.9376449584961, _config = {weight=200}},
      {"wardrobe",-1467.7158203125,-537.308349609375,50.732494354248},
      {"gametable",-1476.12670898438,-534.895751953125,55.547306060791},
	  {"itemtr", _config = itemtr_laboratory, -1456.32409667969,-533.43701171875,56.9333839416504},
      {"itemtr", _config = itemtr_study, -1475.39453125,-530.135192871094,55.5264129638672}
    },
    {
      {"entry",-907.900,-370.608,109.440},
      {"chest",-914.79296875,-375.26416015625,109.448974609375, _config = {weight=200}},
      {"wardrobe",-926.047912597656,-381.470153808594,103.243774414063},
      {"gametable",-934.216979980469,-378.082336425781,108.05859375},
	  {"itemtr", _config = itemtr_laboratory, -914.430541992188,-379.17333984375,109.444869995117},
      {"itemtr", _config = itemtr_study, -932.810302734375,-373.413330078125,108.03776550293}
    },
    {
      {"entry",-921.124,-381.099,85.480},
      {"chest",-915.268737792969,-375.818084716797,85.4891815185547, _config = {weight=200}},
      {"wardrobe",-904.0673828125,-369.910552978516,79.2839508056641},
      {"gametable",-895.890075683594,-373.167846679688,84.0987701416016},
	  {"itemtr", _config = itemtr_laboratory, -915.567504882813,-371.905731201172,85.4850234985352},
      {"itemtr", _config = itemtr_study, -897.224792480469,-377.828887939453,84.0779266357422},
    },
    {
      {"entry",-464.453,-708.617,77.086},
      {"chest",-466.566558837891,-700.528991699219,77.0956268310547, _config = {weight=200}},
      {"wardrobe",-466.892852783203,-687.88720703125,70.8903503417969},
      {"gametable",-459.870513916016,-682.054565429688,75.7051773071289},
	  {"itemtr", _config = itemtr_laboratory, -470.110504150391,-699.137634277344,77.0915145874023},
      {"itemtr", _config = itemtr_study, -456.510467529297,-685.274841308594,75.6842498779297},
    },
    {
      {"entry",-470.647,-689.459,53.402},
      {"chest",-469.077453613281,-697.664672851563,53.4144515991211, _config = {weight=200}},
      {"wardrobe",-468.939910888672,-710.398986816406,47.2093048095703},
      {"gametable",-475.543884277344,-716.226867675781,52.0241050720215},
	  {"itemtr", _config = itemtr_laboratory, -465.526031494141,-699.133666992188,53.4103393554688},
      {"itemtr", _config = itemtr_study, -479.113037109375,-712.874938964844,52.0032043457031},
    }
  },
  ["other_flat"] = {
    {
      {"entry",-784.363,323.792,211.996},
      {"chest",-766.744384765625,328.375,211.396545410156, _config = {weight=500}},
      {"wardrobe",-793.502136230469,326.861846923828,210.796630859375},
      {"gametable",-781.973083496094,338.788482666016,211.231979370117},
	  {"itemtr", _config = itemtr_laboratory, -763.146362304688,326.994598388672,211.396560668945},
      {"itemtr", _config = itemtr_study, -778.560241699219,333.439453125,211.197128295898}
    },
    {
      {"entry",-603.997,58.954,98.200},
      {"chest",-621.323669433594,54.2074241638184,97.5995330810547, _config = {weight=500}},
      {"wardrobe",-594.668823242188,55.5750961303711,96.9996185302734},
      {"gametable",-606.140441894531,43.8849754333496,97.4350128173828},
	  {"itemtr", _config = itemtr_laboratory, -624.831909179688,55.5965461730957,97.5995635986328},
      {"itemtr", _config = itemtr_study, -608.968322753906,49.1769981384277,97.4001312255859}
    },
    {
      {"entry",-1453.013,-539.629,74.044},
      {"chest",-1466.57763671875,-528.339294433594,73.4436492919922, _config = {weight=500}},
      {"wardrobe",-1449.85034179688,-549.231323242188,72.8437194824219},
      {"gametable",-1466.37182617188,-546.663757324219,73.279052734375},
	  {"itemtr", _config = itemtr_laboratory, -1467.62377929688,-524.550842285156,73.4436492919922},
      {"itemtr", _config = itemtr_study, -1463.84411621094,-541.1962890625,73.2442169189453}
    },
    {
      {"entry",-912.547,-364.706,114.274},
      {"chest",-926.693176269531,-377.596130371094,113.674102783203, _config = {weight=500}},
      {"wardrobe",-903.66650390625,-364.023223876953,113.074157714844},
      {"gametable",-908.407165527344,-379.825714111328,113.509590148926},
	  {"itemtr", _config = itemtr_laboratory, -930.571899414063,-378.051239013672,113.674072265625},
      {"itemtr", _config = itemtr_study, -913.553588867188,-376.692016601563,113.474617004395}
    }
  },
  ["fazenda_flat"] = {
    {
      {"entry",1396.9913330078,1141.8450927734,114.33367919922},
      {"chest",1398.0871582031,1164.1635742188,114.33367919922, _config = {weight=500}},
      {"wardrobe",1400.2038574219,1159.5600585938,114.33355712891},
      {"gametable",1397.1551513672,1132.1381835938,114.33355712891},
      {"itemtr", _config = itemtr_laboratory, 1393.8511962891,1145.1695556641,114.33367919922}
    }
  },
  ["casa1_flat"] = {
    {
      {"entry",-174.10354614258,497.32022094727,137.66696166992},
      {"chest",-174.37693786621,493.63809204102,130.04371643066, _config = {weight=800}},
      {"wardrobe",-167.42747497559,487.7958984375,133.84381103516},
      {"gametable",-165.07147216797,483.78701782227,137.26531982422},
      {"itemtr", _config = itemtr_laboratory, -175.00372314453,489.96774291992,130.04371643066}
    }
  },
  ["casa2_flat"] = {
    {
      {"entry",341.64733886719,437.40972900391,149.39405822754},
      {"chest",338.08242797852,436.81604003906,141.77076721191, _config = {weight=800}},
      {"wardrobe",334.31918334961,428.46383666992,145.57081604004},
      {"gametable",330.9817199707,425.03125,148.99258422852},
      {"itemtr", _config = itemtr_laboratory, 334.33459472656,436.2243347168,141.77076721191}
    }
  },
  ["casa3_flat"] = {
    {
      {"entry",373.74584960938,423.25018310547,145.90786743164},
      {"chest",376.92370605469,429.30517578125,138.30017089844, _config = {weight=800}},
      {"wardrobe",374.54263305664,411.5041809082,142.10012817383},
      {"gametable",373.52014160156,404.83322143555,145.52745056152},
      {"itemtr", _config = itemtr_laboratory, 379.07656860352,432.37295532227,138.30017089844}
    }
  },
  ["casa4_flat"] = {
    {
      {"entry",-682.23968505859,592.53051757813,145.39295959473},
      {"chest",-680.38427734375,588.95416259766,137.76976013184, _config = {weight=800}},
      {"wardrobe",-671.38696289063,587.29095458984,141.56988525391},
      {"gametable",-667.27911376953,585.09533691406,144.99156188965},
      {"itemtr", _config = itemtr_laboratory, -679.20172119141,585.43780517578,137.76976013184}
    }
  },
  ["casa5_flat"] = {
    {
      {"entry",-1289.6420898438,449.28283691406,97.902503967285},
      {"chest",-1287.9265136719,455.72882080078,90.294708251953, _config = {weight=800}},
      {"wardrobe",-1285.9825439453,438.18774414063,94.094734191895},
      {"gametable",-1285.4017333984,431.41772460938,97.522132873535},
      {"itemtr", _config = itemtr_laboratory, -1286.7156982422,459.36468505859,90.294708251953}
    },
  }
}

-- define home clusters
cfg.homes = {
  ["Apartamento Simples 1"] = {
    slot = "basic_flat",
    entry_point = {-618.73333740234,37.5940284729,43.591003417969},
    buy_price = 150000,
    sell_price = 80000,
    max = 99,
    blipid=476,
    blipcolor=4
  },
  ["Apartamento Simples 2"] = {
    slot = "basic_flat",
    entry_point = {-1446.769,-538.531,34.740},
    buy_price = 150000,
    sell_price = 80000,
    max = 99,
    blipid=476,
    blipcolor=4
  },
  ["Casa 1"] = {
    slot = "casa1_flat",
    entry_point = {-175.11683654785,502.34225463867,137.42016601563},
    buy_price = 500000,
    sell_price = 15000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Casa 2"] = {
    slot = "casa2_flat",
    entry_point = {346.84008789063,440.90414428711,147.70207214355},
    buy_price = 500000,
    sell_price = 15000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Casa 3"] = {
    slot = "casa3_flat",
    entry_point = {373.43969726563,427.83197021484,145.68418884277},
    buy_price = 500000,
    sell_price = 15000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Casa 4"] = {
    slot = "casa4_flat",
    entry_point = {-686.41821289063,596.54180908203,143.64221191406},
    buy_price = 500000,
    sell_price = 15000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Casa 5"] = {
    slot = "casa5_flat",
    entry_point = {-1294.3278808594,454.73611450195,97.506507873535},
    buy_price = 500000,
    sell_price = 15000,
    max = 1,
    blipid=40,
    blipcolor=5
  },  
  ["Fazenda"] = {
    slot = "fazenda_flat",
    entry_point = {1394.7622070313,1141.7633056641,114.61884307861},
    buy_price = 350000,
    sell_price = 150000,
    max = 1,
    blipid=40,
    blipcolor=4
  },
  ["Apartamento de luxo"] = {
    slot = "other_flat",
    entry_point = {-770.921,312.537,85.698},
    buy_price = 250000,
    sell_price = 150000,
    max = 10,
    blipid=475,
    blipcolor=5
  }
}

return cfg
