Config = {}

-------- Shop Items ------
Config = {
    ShopItems = {
        ['packaged_chicken'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Tavuk (tane) - 17$', itemprice = 17}
        },
        ['packaged_plank'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Talaş (tane) - 17$', itemprice = 17}
        },
        ['fish'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Balık (tane) - 3$', itemprice = 3}
        }
    },
    ShopItems2 = {
        ['meth'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Meth (tane) - 63$', itemprice = 63}
        },
        ['koko_paketlenmis'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Kokain (tane) - 38$', itemprice = 38}
        },
        ['esrar_paketlenmis'] = {
            SellItem = {Item = 'cash', ItemShowName = 'Esrar (tane) - 35$', itemprice = 35}
        }
    }
}

--- QBCORE CONFIG ------

Config.MaxSellLimit = 'infinite' ----- Number or 'infinite', this only works per time, so after they reopen the menu the sell limit willl reset.
------- Discord Config ----

Config.WebhookLink = 'https://discord.com/api/webhooks/983989175114162216/l091TdrVQrKF7kV0w9BjNVq6_o8SrIfPuCm-7RgkXTMam_AytKkitn5ZEgbPJGVHdPdG'
Config.WebhookLink2 = 'https://discord.com/api/webhooks/984119453912555541/27L_enR3PaY662ZH-AwNFiUearK9v-QVmgHQu9QljBn3Z2ElF8w5Q6i9s_rrIfbU2O1r'
Config.WebhookAvatar = '' ---- use hizliresim.
Config.WebhookName = 'xqToptanci'
------------------------------

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
    {
        model = `ig_bankman`,
        coords = vector4(312.2512, -229.064, 54.216, 244.5),
        gender = 'male'
    },
    {
        model = `a_m_m_soucent_03`,
        coords = vector4(1982.982, 3026.279, 47.908, 325.52),
        gender = 'male'
    },
    {
        model = `a_m_m_soucent_01`,
        coords = vector4(487.7776, -2181.14, 5.918, 242.24),
        gender = 'male'
    },
}