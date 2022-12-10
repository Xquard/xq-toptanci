

QBCore = nil 
local coreindi = false
local usingreseller = false
Citizen.CreateThread(function()
    while QBCore == nil do 
        QBCore = exports['qb-core']:GetCoreObject()
        coreindi = true
        while QBCore.Functions.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUptade')
AddEventHandler('QBCore:Client:OnJobUptade', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5)
        if IsControlJustPressed(0, 194) and usingreseller == true then
            QBCore.UI.Menu.CloseAll()
            usingreseller = false
        end
    end
end)

exports['qb-target']:AddTargetModel(`ig_bankman`, {
    options = {
        { 
            event = 'xq-base:toptancı', 
            icon = "fas fa-box", 
            label = "Toptancıyla Konuş!", 
        },
    },
    distance = 3.0 
})

exports['qb-target']:AddTargetModel(`a_m_m_soucent_03`, {
    options = {
        { 
            event = 'xq-base:tacir', 
            icon = "fas fa-box", 
            label = "Tacirle Konuş!", 
            job = 'tacir'
        },
    },
    distance = 3.0 
})


---------------Main Functions--------------

local spawnedPeds = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.PedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)

			if distance < Config.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end

			if distance >= Config.DistanceSpawn and spawnedPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end

	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end

	SetEntityAlpha(spawnedPed, 0, false)

	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end

	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end

	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(50)
		end

		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end

	if Config.FadeIn then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end

	return spawnedPed
end

RegisterNetEvent('xq-base:toptancı', function()
    exports['qb-menu']:openMenu({
        {
            header = "Toptancı Avni",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Balık Satış",
            txt = "Tane Fiyatı 3$",
            params = {
                event = "xq:keyboard-balık",
            }
        },
        {
            id = 2,
            header = "Tavuk Satış",
            txt = "Tane Fiyatı 17$",
            params = {
                event = "xq:keyboard-tavuk",
            }
        },
        {
            id = 3,
            header = "Odun Satış",
            txt = "Tane Fiyatı 17$",
            params = {
                event = "xq:keyboard-odun",
            }
        },
        {
            id = 5,
            header = "Çık",
            txt = "",
            params = {
                event = "xqBase:quit"
            }
        },
    })
end)

RegisterNetEvent("xq:keyboard-balık")
AddEventHandler("xq:keyboard-balık", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Balık Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server', "fish", keyboard)
        print(keyboard)
    end
end)

RegisterNetEvent("xq:keyboard-tavuk")
AddEventHandler("xq:keyboard-tavuk", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Tavuk Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server', "packaged_chicken", keyboard)
        print(keyboard)
    end
end)

RegisterNetEvent("xq:keyboard-odun")
AddEventHandler("xq:keyboard-odun", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Odun Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server', "packaged_plank", keyboard)
        print(keyboard)
    end
end)

RegisterNetEvent('xq-base:tacir', function()
    exports['qb-menu']:openMenu({
        {
            header = "Tacir Savaş",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Meth Satış",
            txt = "Tane Fiyatı 63$",
            params = {
                event = "xq:keyboard-meth",
            }
        },
        {
            id = 2,
            header = "Koko Satış",
            txt = "Tane Fiyatı 38$",
            params = {
                event = "xq:keyboard-koko",
            }
        },
        {
            id = 3,
            header = "Esrar Satış",
            txt = "Tane Fiyatı 35$",
            params = {
                event = "xq:keyboard-esrar",
            }
        },
        {
            id = 5,
            header = "Çık",
            txt = "",
            params = {
                event = "xqBase:quit"
            }
        },
    })
end)

RegisterNetEvent("xq:keyboard-meth")
AddEventHandler("xq:keyboard-meth", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Meth Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server2', "meth", keyboard)
        print(keyboard)
    end
end)

RegisterNetEvent("xq:keyboard-koko")
AddEventHandler("xq:keyboard-koko", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Koko Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server2', "koko_paketlenmis", keyboard)
        print(keyboard)
    end
end)

RegisterNetEvent("xq:keyboard-esrar")
AddEventHandler("xq:keyboard-esrar", function()
    local keyboard = exports["xq-keyboard"]:KeyboardInput({
        header = "Esrar Satış", 
        rows = {
            {
                id = 0, 
                txt = "Ne Kadar Satmak İstiyorsun ?"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('xq:toptanci:server2', "esrar_paketlenmis", keyboard)
        print(keyboard)
    end
end)