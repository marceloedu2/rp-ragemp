
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  -- example of harvest item transformer
  {
    name="Trash Can", -- menu name
    -- permissions = {"harvest.water_bottle_tacos"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=10,
    units_per_minute=1,
    x=231.40283203125,y=-1507.09191894531,z=29.2916603088379, -- pos
    radius=5, height=1.5, -- area
    recipes = {
      ["Harvest water"] = { -- action name
        description="Harvest some water bottles.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["water"] = 1
        }
      },
      ["Harvest tacos"] = { -- action name
        description="Harvest some tacos.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["tacos"] = 1
        }
      }
    }
    --, onstart = function(player,recipe) end, -- optional start callback
    -- onstep = function(player,recipe) end, -- optional step callback
    -- onstop = function(player,recipe) end -- optional stop callback
  },
  {
    name="Academia", -- menu name
    r=255,g=125,b=0, -- color
    max_units=1000,
    units_per_minute=1000,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319, -- pos
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Força"] = { -- action name
        description="Aumente sua força e stamina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Campo de Ervas", -- menu name
    permissions = {"harvest.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- color
    max_units=200,
    units_per_minute=5,
    x=2208.777,y=5578.235,z=53.735, -- pos
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- action name
        description="Colher maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["weed"] = 1
        }
      }
    }
  },
  -- CAMPO DE METANFETAMINA    
  {
    name="Campo de Metanfetamina", -- Nome do menu
    permissions = {"harvest.metanfetamina"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=200,
    units_per_minute=5,
    x=79.686859130859,y=3705.6840820313,z=41.077156066895, -- Localização
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher Crystal Melamine.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["crystalmelamine"] = 1
        }
      }
    }
  },  
  -- PROCESSADOR DE METANFETAMINA
  {
    name="Processador de Metanfetamina", -- menu name
    permissions = {"process.metanfetamina"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=1316.8662109375,y=-450.48968505859,z=76.512893676758, -- pos
    radius=5.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Metanfetamina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["crystalmelamine"] = 1
	    },
        products={ -- items given per unit
          ["metanfetamina"] = 2
        }
      }
    }
  },  
  -- CAMPO DE COCAINA    
  {
    name="Campo de Cocaina", -- Nome do menu
    permissions = {"harvest.cocaina"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=200,
    units_per_minute=5,
    x=-41.372623443604,y=3033.3776855469,z=41.020195007324, -- Localização
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher folha de Coca.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["folhadecoca"] = 1
        }
      }
    }
  },
  -- PROCESSADOR DE COCAINA
  {
    name="Processador de cocaina", -- menu name
    permissions = {"process.cocaina"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=471.25631713867,y=-1685.3825683594,z=29.381580352783, -- pos
    radius=5.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Cocaina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["folhadecoca"] = 1
	    },
        products={ -- items given per unit
          ["cocaina"] = 2
        }
      }
    }
  },
  -- CAMPO DE MINERIO
  {
    name="Campo de Minerio", -- Nome do menu
    permissions = {"campodeminerio"}, -- you can add permissions
    r=0,g=200,b=0, -- cor
    max_units=200,
    units_per_minute=2,
    x=1534.5666503906,y=6327.1376953125,z=24.215845108032, -- Localização    
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher pedras para lavagem.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["Pedra"] = 1
        }
      }
    }
  },
-- Carro Forte
  {
    name="Cofre", -- menu name
	permissions = {"bankdriver.money"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=253.90089416504,y=225.21408081055,z=101.87578582764,
    radius=2, height=1.0, -- area
    recipes = {
      ["Dinheiro do Banco"] = { -- action name
       description="Pegar dinheiro do banco.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bank_money"] = 500000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  -- PROCESSADOR DE MINERIO
  {
    name="Lavagem de Minerio", -- menu name
    permissions = {"lavagemdeminerio"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=2, -- unidades que o transformador ganha de volta por minuto
    x=-554.48089599609,y=5324.0986328125,z=73.599700927734, -- pos
    radius=7.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Lavagem de Pedra"] = { -- action name
        description="Produzir minerio...", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["Pedra"] = 1
        },
        products={ -- items given per unit
          ["Minerio"] = 1
        }
      }
    }
  },
  {
    name="Porte de Arma", -- menu name
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=437.178802490234,y=-994.613525390625,z=30.6895904541016,
    radius=2, height=1.0, -- area
    recipes = {
      ["Porte de Arma"] = { -- action name
       description="comprar porte de arma.", -- action description
        in_money=1500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["portedearma"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="OAB", -- menu name
	permissions = {"advogado.oab"},
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=-77.134468078613,y=-802.86267089844,z=243.40579223633,
    radius=2, height=1.0, -- area
    recipes = {
      ["OAB"] = { -- action name
       description="Carteira de Advogado.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["oab"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },  
  {
    name="Processar Ervas", -- menu name
    permissions = {"process.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=200, -- unidades maximas do item
    units_per_minute=200, -- unidades que o transformador ganha de volta por minuto
    x=-781.90240478516,y=578.94976806641,z=126.74822235107, -- pos
    radius=5.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processador de Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["weed"] = 1
		},
        products={ -- items given per unit
		  ["cannabis"] = 2
        }
      }
    }
  },
}



-- define multiple static transformers with postions list
local weedplants = {
  {1873.36901855469,3658.46215820313,33.8029747009277},
  {1856.33776855469,3635.12109375,34.1897926330566},
  {1830.75390625,3621.44140625,33.8487205505371},
  {1784.70251464844,3579.93798828125,34.7956123352051},
  {182.644317626953,3315.75537109375,41.4806938171387},
  {1764.65661621094,3642.916015625,34.5866050720215},
  {1512.91027832031,1673.76025390625,111.531875610352}
}
for k,v in pairs(weedplants) do
  local plant = {
    name="Planta de Maconha", -- menu name
    --permissions = {"harvest.weed"}, -- you can add permissions
    r=0,g=200,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=v[1],y=v[2],z=v[3], -- pos
    radius=5.0, height=1.5, -- area
    recipes = {
      ["Colher"] = { -- action name
        description="Colher maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["weed"] = 1
        }
      }
    }
  }
  table.insert(cfg.item_transformers, plant)
end

local warehouses = {
  {-1111.2841796875,4937.4052734375,218.386306762695},
  {1539.01794433594,1704.29174804688,109.659622192383},
  {981.412841796875,-1805.70349121094,35.4845695495605}
}
for k,v in pairs(warehouses) do
  local warehouse = {
    name="Oficina de armas", -- menu name
    permissions = {"build.gun"}, -- you can add permissions
    r=0,g=200,b=0, -- color
    max_units=10,
    units_per_minute=1,
    x=v[1],y=v[2],z=v[3], -- pos
    radius=5.0, height=1.5, -- area
    recipes = {
      ["Build Pistol"] = { -- action name
        description="Construir pistola.", -- action description
        in_money=1500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		  ["pistol_parts"] = 1
		}, -- items taken per unit
        products={ -- items given per unit
          ["wbody|WEAPON_PISTOL"] = 1
        }
      },
      ["Build Shotgun"] = { -- action name
        description="Construir shotgun.", -- action description
        in_money=3000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		  ["shotgun_parts"] = 1
		}, -- items taken per unit
        products={ -- items given per unit
          ["wbody|WEAPON_PUMPSHOTGUN"] = 1
        }
      },
      ["Build SMG"] = { -- action name
        description="Construir submachinegun.", -- action description
        in_money=5000, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		  ["smg_parts"] = 1
		}, -- items taken per unit
        products={ -- items given per unit
          ["wbody|WEAPON_SMG"] = 1
        }
      }
    }
  }
  table.insert(cfg.item_transformers, warehouse)
end

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["weed plant"] = {
    def = {
      name="Weed Plant", -- menu name
      r=0,g=200,b=0, -- color
      max_units=50,
      units_per_minute=0,
      x=0,y=0,z=0, -- pos
      radius=0, height=0, -- area
      recipes = {
      }
    },
    positions = weedplants
  },
  ["gun warehouse"] = {
    def = {
      name="Gun Warehouse", -- menu name
      r=0,g=200,b=0, -- color
      max_units=50,
      units_per_minute=0,
      x=0,y=0,z=0, -- pos
      radius=0, height=0, -- area
      recipes = {
      }
    },
    positions = warehouses
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 30-- 12 hours -- 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["weed plant"] = 10000,
    ["gun warehouse"] = 25000
  },
  positions = {
    {1821.12390136719,3685.9736328125,34.2769317626953},
    {1804.2958984375,3684.12280273438,34.217945098877}
  },
  interval = 30, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg
