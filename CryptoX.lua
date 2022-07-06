if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("CryptoX by Techy (Discord: techwastaken#7592)", "GrapeTheme")
	local Player = Window:NewTab("Player")
	local Tools = Window:NewTab("Tools")
	local About = Window:NewTab("About")
    local PlayerSection = Player:NewSection("Player")
	local ToolsSection = Tools:NewSection("Tools")
	local AboutSection = About:NewSection("About CryptoX")
	PlayerSection:NewSlider("Walkspeed", "Changes your walkspeed.", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
	PlayerSection:NewSlider("Jumpheight", "Changes your jumpheight.", 255, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
	PlayerSection:NewSlider("Health", "Change your amount health (Up to 100,000)", 100000, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
	AboutSection:NewLabel("Powered by Kavo UI by xHeptc")
	AboutSection:NewLabel("CryptoX V1 by Techy (Discord: techwastaken#7592)")
	AboutSection:NewLabel("NOTE that this script will ONLY work on Prison Life!")
    ToolsSection:NewDropdown("Give Gun", "Lets you get guns like a breeze.", {"M9", "Remington 870", "AK-47"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)
	 ToolsSection:NewDropdown("OP Guns", "Give you all the most OP Gun mods.", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)
end