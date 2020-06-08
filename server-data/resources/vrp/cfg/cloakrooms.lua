
-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
local uniforme_pm = { model = "s_m_y_cop_01" }
local uniforme_pmf = { model = "s_f_y_sheriff_01" }
local uniforme_capitao = { model = "s_m_y_cop_01" }
local uniforme_aguia = { model = "s_m_y_cop_01" }
local uniforme_rota = { model = "s_m_y_sheriff_01" }
local uniforme_rocam = { model = "s_m_y_hwaycop_01" }
local uniforme_bope = { model = "s_m_y_swat_01" }
local uniforme_tatica = { model = "s_m_m_snowcop_01" }
local uniforme_samu = { model = "s_m_m_paramedic_01" }

for i=0,19 do
  uniforme_pm[i] = {0,0}
  uniforme_pmf[i] = {0,0}
  uniforme_capitao[i] = {0,0}
  uniforme_aguia[i] = {0,0}
  uniforme_samu[i] = {0,0}
  uniforme_rocam[i] = {0,0}
  uniforme_bope[i] = {0,0}
  uniforme_tatica[i] = {0,0}
  uniforme_rota[i] = {0,0}
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["police"] = {
    _config = { permissions = {"police.cloakroom"} },
    --[[["Uniform"] = {
      [3] = {30,0},
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0},
      ["p2"] = {2,0}
    },]]
    ["Uniforme PM"] = uniforme_pm,
    ["Uniforme PM Feminina"] = uniforme_pmf,
  },
    ["emergency"] = {
    _config = { permissions = {"samu.cloakroom"} },
    --[[["Male uniform"] = {
      [3] = {92,0},
      [4] = {9,3},
      [6] = {25,0},
      [8] = {15,0},
      [11] = {13,3},
      ["p2"] = {2,0}
    }]]
    ["Uniforme SAMU"] = uniforme_samu,
  },
  ["Escolher Sexo"] = {
    _config = { not_uniform = true },
    ["Homem"] = surgery_male,
    ["Mulher"] = surgery_female
  }
}

cfg.cloakrooms = {
  {"police",457.53500366211,-991.83148193359,30.689584732056},
  {"Escolher Sexo",230.81727600098,-405.87521362305,47.924365997314},
  {"emergency",269.77987670898,-1363.4407958984,24.537780761719}
}

return cfg

