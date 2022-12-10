QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('xq:toptanci:server')
AddEventHandler('xq:toptanci:server', function(item, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local price = Config.ShopItems[item].SellItem.itemprice
    local moneyprice = price * amount
    
    if Player then
      if Player.Functions.RemoveItem(item, amount) then
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('QBCore:Notify', source, amount.." Adet "..item.." Adlı İtem Sattın Ve "..moneyprice.."$ Kazandın")
        Player.Functions.AddMoney('cash', moneyprice)
        local Player = QBCore.Functions.GetPlayer(source)
				local citizenid = Player.PlayerData.citizenid
				local id = source
				local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
				local discord = QBCore.Functions.GetIdentifier(id, 'discord')
				local license = QBCore.Functions.GetIdentifier(id, 'license')
				local oyuncu = "\n\n".."**ID :** ".. id .. "\n" .. "**Citizen ID :** " .. citizenid .."\n".."**İc İsim** : " .. name .."\n".."**Steam** : "..GetPlayerName(source).."\n".."**Discord : **" .. discord.."\n".."**Lisans : **".. license ..""
				TriggerEvent('xq-log', 'toptanci', '', 'green', "**Açıklama : **"..amount.." adet "..item.." adlı item sattı ve "..moneyprice.."$ kazandı"..oyuncu)
      else
        TriggerClientEvent('QBCore:Notify', source, 'Üzerinizde Hiç '..item..' Yok')
      end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Oyuncu Bulunamadı!')
    end
end)

RegisterNetEvent('xq:toptanci:server2')
AddEventHandler('xq:toptanci:server2', function(item, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local price = Config.ShopItems2[item].SellItem.itemprice
    local moneyprice = price * amount
    
    if Player then
      if Player.Functions.RemoveItem(item, amount) then
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('QBCore:Notify', source, amount.." Adet "..item.." Adlı İtem Sattın Ve "..moneyprice.."$ Kazandın")
        Player.Functions.AddMoney('cash', moneyprice)
        local Player = QBCore.Functions.GetPlayer(source)
				local citizenid = Player.PlayerData.citizenid
				local id = source
				local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
				local discord = QBCore.Functions.GetIdentifier(id, 'discord')
				local license = QBCore.Functions.GetIdentifier(id, 'license')
				local oyuncu = "\n\n".."**ID :** ".. id .. "\n" .. "**Citizen ID :** " .. citizenid .."\n".."**İc İsim** : " .. name .."\n".."**Steam** : "..GetPlayerName(source).."\n".."**Discord : **" .. discord.."\n".."**Lisans : **".. license ..""
				TriggerEvent('xq-log', 'tacir', '', 'green', "**Açıklama : **"..amount.." adet "..item.." adlı item sattı ve "..moneyprice.."$ kazandı"..oyuncu)
      else
        TriggerClientEvent('QBCore:Notify', source, 'Üzerinizde Hiç '..item..' Yok')
      end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Oyuncu Bulunamadı!')
    end
end)