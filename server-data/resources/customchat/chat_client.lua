CCserver = Tunnel.getInterface("customchat","customchat")

local chatInputActive = false
local chatInputActivating = false

local function trim(s)
  return s:match'^%s*(.*%S)' or ''
end
local playerColor = {0,0,0}
AddEventHandler("playerSpawned",function()
	local r = math.random(10,250)
	local g = math.random(10,250) 
	local b = math.random(10,250)
	playerColor = {r,g,b}
end)
-- proximity chat
RegisterNetEvent('sendGlobalMessage')
AddEventHandler('sendGlobalMessage', function(id, name, message,user_id,identity)
    TriggerEvent('chatMessage', "[Global] (".. identity.name .. " " .. identity.firstname ..")", {255, 0, 0}, message)
end)

RegisterNetEvent('sendTwitterMessage')
AddEventHandler('sendTwitterMessage', function(id, name, message,user_id,identity)
	TriggerEvent('chatMessage', "[Twitter] (".. identity.name .. " " .. identity.firstname ..")", {0, 170, 255}, message)
end)

RegisterNetEvent('sendOOCMessage')
AddEventHandler('sendOOCMessage', function(id, name, message,user_id,identity)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', "[OOC] ".. identity.name .. " " .. identity.firstname .. " ["..user_id.."] ", {128, 128, 128}, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 29.999 then
		TriggerEvent('chatMessage', "[OOC] ".. identity.name .. " " .. identity.firstname .. " ["..user_id.."] ", {128, 128, 128}, message)
	end
end)

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', name, playerColor, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 5.999 then
		TriggerEvent('chatMessage', name, playerColor, message)
	end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, name, message)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6" .. name .."  ".."  " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 5.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6" .. name .."  ".."  " .. message)
	end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^4*" .. name .."  ".."  " .. message .. "*")
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 5.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^4*" .. name .."  ".."  " .. message .. "*")
	end
end)

-- custom chat
RegisterNetEvent('chatMessage')
AddEventHandler('chatMessage', function(name, color, message)
    SendNUIMessage({
        name = name,
        color = color,
        message = message
    })
end)

RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false

    SetNuiFocus(false)

    if data.message and trim(data.message) ~= "" then
        local id = PlayerId()

        local r, g, b = GetPlayerRgbColour(id, _i, _i, _i)
        --local r, g, b = 255, 128, 0

        TriggerServerEvent('chatMessageEntered', GetPlayerName(id), { r, g, b }, data.message)
    end

    cb('ok')
end)

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
    Wait(100)

    SendNUIMessage({
    	playername = GetPlayerName(PlayerId())
    })

    while true do
        Wait(0)

        if not chatInputActive then
            if IsControlPressed(0, 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
                chatInputActive = true
                chatInputActivating = true

                SendNUIMessage({
                    meta = 'openChatBox'
                })
            end
        end

        if chatInputActivating then
            if not IsControlPressed(0, 245) then
                SetNuiFocus(true)

                chatInputActivating = false
            end
        end
    end
end)
