local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")

local banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank",
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Highway)",
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Blaine County Savings",
		lastrobbed = 0
	},
	["fleeca3"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Vinewood Hills)",
		lastrobbed = 0
	},
	["fleeca4"] = {
		position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 48.0463104248047 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Burton)",
		lastrobbed = 0
	},
	["fleeca5"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Alta)",
		lastrobbed = 0
	},
	["fleeca6"] = {
		position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		reward = 30000 + math.random(100000,200000),
		nameofbank = "Fleeca Bank (Desert)",
		lastrobbed = 0
	},
	["pacific"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = 60000 + math.random(100000,200000),
		nameofbank = "Pacific Standard PDB (Downtown Vinewood)",
		lastrobbed = 0
	},
	["bancoprincipal"] = {
		position = { ['x'] = 265.60995483398, ['y'] =  213.61218261719, ['z'] = 101.68347930908 },
		reward = 150000 + math.random(100000,200000),
		nameofbank = "Banco do Brasil (Principal)",
		lastrobbed = 0
	}		
}

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery was cancelled at: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robbery was cancelled at: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
	if banks[robb] then
		local bank = banks[robb]

		if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then
			TriggerClientEvent('chatMessage', source, 'ROUBO', {255, 0, 0}, "Esse Banco já foi roubado recentemente, Aguarde: ^2" .. (1200 - (os.time() - bank.lastrobbed)) .. "^0 segundos.")
			return
		end
		TriggerClientEvent('chatMessage', -1, 'AVISO', {255, 0, 0}, "Assalto a Banco em Andamento em ^2" .. bank.nameofbank)
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Voce iniciou um Assalto ao Banco: ^2" .. bank.nameofbank .. "^0, Não se afaste muito deste ponto!")
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Segure o Banco por ^15 ^0minutes, e escape da Policia Vivo, e o Dinheiro é Seu!")
		TriggerClientEvent('es_bank:currentlyrobbing', source, robb)
		banks[robb].lastrobbed = os.time()
		robbers[source] = robb
		local savedSource = source
		SetTimeout(300000, function()
			if(robbers[savedSource])then
				local user_id = vRP.getUserId({savedSource})
				if(user_id)then
					vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
					TriggerClientEvent('chatMessage', -1, 'AVISO', {255, 0, 0}, "O Roubo de ^2" .. bank.nameofbank .. "^0! foi concluido, Policiais deixaram os Bandidos Escaparem.")	
					TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)
				end
			end
		end)
	end
end)