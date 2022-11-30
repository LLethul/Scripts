-- require players, replicatedstorage, httpservice
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer;

repeat wait() until Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("BodyEffects") and Player.Character:FindFirstChild("Humanoid") and Player.Character
wait(2)

-- spy-chat
loadstring(game:HttpGet("https://raw.githubusercontent.com/dehoisted/Chat-Spy/main/source/main.lua"))();

-- function to loadstring files from lib on Ix1x0x3's glorious repo
local function RequireLib(Name)
    local BaseURL = "https://raw.githubusercontent.com/Ix1x0x3/glorious/master/lib/"

    return loadstring(game:HttpGet(BaseURL .. Name .. ".lua"))()
end

-- function simmilar to RequireLib, but baseurl is root of the repo
local function RequireRaw(Name)
    local BaseURL = "https://raw.githubusercontent.com/Ix1x0x3/glorious/master/"

    return loadstring(game:HttpGet(BaseURL .. Name))()
end

-- find a player with some text matching in their display name or username
local function FindPlayer(Text)
    for _, Player in pairs(Players:GetPlayers()) do
        if (Player.Name:lower():find(Text:lower()) or Player.DisplayName:lower():find(Text:lower())) then
            return Player
        end
    end
end

local function Network(Data)
	if Data and Data.Character and Data.Character:FindFirstChild("HumanoidRootPart") ~= nil and Data.Character:FindFirstChild("Humanoid") ~= nil and Data.Character:FindFirstChild("Head") ~= nil then
		return true
	end
	return false
end

local function NilChar()
	if Network(Player) then
		--getgenv().PauseStandSummon = true
		_G.Killing = false
		local ops = Player.Character.HumanoidRootPart.CFrame;
		for i, v in pairs(Player.Character:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
				v:Destroy()
			end
		end
		repeat wait() until Player.Character:FindFirstChild("HumanoidRootPart");
		--getgenv().PauseStandSummon = false
		Player.Character.HumanoidRootPart.CFrame = ops;
	end
end

-- lib files
local Notifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local AACheat = RequireLib("AntiAntiCheat")
local Combat = RequireLib("Combat")
local UIBase = RequireLib("UI")

-- loadstring eurus from Ix1x0x3 on github
local Eurus = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ix1x0x3/eurus/main/src/index.lua", true))()

local UI = UIBase(Eurus, Combat, {});

-- data for script
local Data = {

    States = {
        Killing = false;
    };

    Settings = {
        Trusted = {};
    };

    Teleports = {
        Bank = CFrame.new(-440.553162, 40.4877129, -282.201294);
        Gun1 = CFrame.new(-560.408386, 9.4998455, -735.695557);
        Gun2 = CFrame.new(480.753693, 49.5049934, -606.235535);
        Taco = CFrame.new(591.004211, 52.5614128, -479.238953);
        AdminBase = CFrame.new(-873.095764, -31.7642345, -536.206848);
        Jail = CFrame.new(-798.215027, -39.6332512, -841.371155, -0.999920964, -1.05247384e-08, -0.0125734461, -9.96513272e-09, 1, -4.45695854e-08, 0.0125734461, -4.44407675e-08, -0.999920964);
        Lava = CFrame.new(-748.354065, -39.6382561, -885.135925, 0.061075896, -6.92042548e-08, -0.998133123, -7.74161393e-08, 1, -7.40707904e-08, 0.998133123, 8.17955552e-08, 0.061075896);
		["Jewelry Store"] = CFrame.new(-626.5,23.5,-268.5);
		["Casino"] = CFrame.new(-865.75,22,-147.5);
		["Jeff's"] = CFrame.new(557.25,51.025,-492.5);
		["High School"] = CFrame.new(-653,22,255);
		["Hood Kicks"] = CFrame.new(-223,22,-410.25);
		["Klips"] = CFrame.new(3.5,22,-89.5);
		["Da Furniture"] = CFrame.new(-491,22,-95);
		["Hood Fitness"] = CFrame.new(-75.75,22.75,-639);
		["Gas Station"] = CFrame.new(595.5,49,-258.25);
		-- Gear
		["Medium Armor (1)"] = CFrame.new(-594,10.5,-793.75);
		["Medium Armor (2)"] = CFrame.new(544.5,50.5,-626.5);
		["High-Medium Armor"] = CFrame.new(-938,-28.25,560);
		["Tyrone's (1)"] = CFrame.new(-559,8.25,-736.75);
		["Tyrone's (2)"] = CFrame.new(481.5,48.25,-600);
		-- Guns
		["Revolver"] = CFrame.new(-633.25,22,-133.75);
		["Double Barrel"] = CFrame.new(-1038,22,-275.25);
		["Grenade Launcher"] = CFrame.new(-959,-1,469);
		["RPG"] = CFrame.new(111.5,-27,-277);
		["Flamethrower"] = CFrame.new(-150,54,-94.75);
		["Silencer/Bat"] = CFrame.new(-83.25,22,-286.25);
		["Drum Gun"] = CFrame.new(-74.25,22.75,-86);
		["AUG"] = CFrame.new(-273.5,52.5,-222.5);
		["LMG"] = CFrame.new(-619.25,23.5,-299.5);
		["Bag"] = CFrame.new(-308,51.25,-725.5);
		-- Other Locations
		["Pool"] = CFrame.new(-847.75,22,-279);
		["Bike"] = CFrame.new(-826,22.25,-541.25);
		["Subway Station"] = CFrame.new(-422,-21,36.5);
		["Alley"] = CFrame.new(-270,22,-254.5);
		["Police Station"] = CFrame.new(-262.25,22,-114.5);
		["Hospital"] = CFrame.new(102.5,23,-484.5);
		["Church"] = CFrame.new(206.5,22,-90.5);
		["Park"] = CFrame.new(365.75,50,-404.25);
		["Playground"] = CFrame.new(-269.5,22.25,-759);
		["Apartment"] = CFrame.new(450,54.75,-733);
		["Food Store (1)"] = CFrame.new(-329.25,23.75,-297.5);
		["Food Store (2)"] = CFrame.new(299,49.5,-618.5);
		["Phone Store"] = CFrame.new(-104.25,22,-870.75);
		["Movie Theater"] = CFrame.new(-1006.25,25.25,-117.75);
		-- Admin
		["Admin Base"] = CFrame.new(-735.3,-39.5,-886.25);
		["Admin Gear (1)"] = CFrame.new(-798.5,-39.5,-904.25);
		["Admin Gear (2)"] = CFrame.new(-870.25,-38.25,-551.5);
		["Admin Jail"] = CFrame.new(-798.5,-39.5,-841);
    };

    Mods = {
        [Player.Name] = {
            KillAura = false;
            KRange = 25;
        }
    }

}

local function IsTrusted(T)
    for _, v in pairs(Data.Settings.Trusted) do
        if v.Name == T.Name then
            return true
        end
    end
    return false
end

-- same as FindPlayer, but for teleports
local function FindTeleport(Text)
    if not Text then
        return
    end
    for TeleportName, TeleportLoc in pairs(Data.Teleports) do
        if (TeleportName:lower():find(Text:lower())) then
            return TeleportName
        end
    end
end

-- logger class that uses Notifications.

local Logger = {}
Logger.__index = Logger

function Logger.new()
    local self = setmetatable({}, Logger)

    return self
end

function Logger:Send(Title, Body, Time)
    -- Notifications.new("info", Title, Body, true, (Time and Time or 5), function()
    --     print(Title .. ": " .. Body)
    -- end)

    UI:Fire("NotifSend", Title, Body)
end

-- setup anti-anti-cheat, and set up eurus.
AACheat.Run(Logger)

-- commands for eurus
local Commands = {

    gbullet = {
        info = {
            name = "gbullet",
            description = "godmode",
            usage = "gbullet",
            aliases = {"god"}
        },
        run = function()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
                    v:Destroy()
                end
            end
            game.Players.LocalPlayer.Character.Name = 'Deleted'
            local localPlayer = game:GetService('Players').LocalPlayer;
            local localCharacter = localPlayer.Character;
            localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
            local newCharacter = localPlayer.CharacterAdded:Wait();
            local spoofFolder = Instance.new('Folder');
            spoofFolder.Name = 'FULLY_LOADED_CHAR';
            spoofFolder.Parent = newCharacter;
            newCharacter:WaitForChild('BodyEffects').Dead:Destroy();
            local spoofValue = Instance.new('BoolValue', newCharacter.BodyEffects);
            spoofValue.Name = 'Dead';
            wait()
            --godblock/godbullet
            local ps = game:GetService("Players")
            local lp = ps.LocalPlayer
            local char = lp.Character
        
            char.BodyEffects.Armor:Destroy()
            char.BodyEffects.Defense:Destroy()
        
            local Clone1 = Instance.new("IntValue")
            Clone1.Name = "Armor"
            Clone1.Parent = char.BodyEffects
        
            local Clone2 = Instance.new("NumberValue")
            Clone2.Name = "Defense"
            Clone2.Parent = char.BodyEffects
            wait()
            --walspeed
            local d = {}
            local e = {}
            local g = {}
            local h = {}
            local j = {}
            local k = {}
            local function l()
                local m = 3
                local n = checkcaller
                local o = getrawmetatable(game)
                setreadonly(o, false)
                local p = o.__index
                local q = o.__newindex
                local r = o.__namecall
                o.__index =
                    newcclosure(
                        function(s, t)
                        if n() then
                            return p(s, t)
                        end
                        if d[s] and d[s][t] then
                            local u = d[s][t]
                            if u["IsCallback"] == true then
                                return u["Value"](s)
                            else
                                return u["Value"]
                            end
                        end
                        if g[t] then
                            local v = g[t]
                            if v["IsCallback"] == true then
                                return v["Value"](s)
                            else
                                return v["Value"]
                            end
                        end
                        if j[s] and j[s][t] then
                            return k[s][t]
                        end
                        return p(s, t)
                    end
                    )
                o.__newindex =
                    newcclosure(
                        function(w, x, y)
                        if n() then
                            return q(w, x, y)
                        end
                        if e[w] and e[w][x] then
                            local z = e[w][x]
                            if z["Callback"] == nil then
                                return
                            else
                                z["Callback"](w, y)
                                return
                            end
                        end
                        if h[x] then
                            local A = h[x]
                            if A["Callback"] == nil then
                                return
                            else
                                A["Callback"](w, y)
                                return
                            end
                        end
                        if j[w] and j[w][x] then
                            local B = j[w][x]
                            if type(y) ~= B["Type"] then
                                error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
                            end
                            k[w][x] = y
                            return
                        end
                        return q(w, x, y)
                    end
                    )
                local D = game.Players.LocalPlayer.Character.Humanoid
                local function A(_)
                    local a0 = p(D, _)
                    local a1 = type(a0)
                    if not j[D] then
                        j[D] = {}
                    end
                    if not k[D] then
                        k[D] = {}
                    end
                    j[D][_] = {Type = a1}
                    k[D][_] = p(D, _)
                    local a2 = function()
                        j[D][_] = nil
                        k[D][_] = nil
                    end
                    return {remove = a2, Remove = a2}
                end
                A("WalkSpeed")
                A("JumpPower")
            end
            l()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            wait()
            while wait() do
                game.ReplicatedStorage.MainEvent:FireServer("Block", true)
                wait()
                for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
                        v:Stop();
                    end;
                end;
            end
            wait()
            while wait() do
                pcall(function()
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 1 then
                            game.ReplicatedStorage.MainEvent:FireServer("Block", true)
                        end
                    end
                end)
            end        
        end
    };

    tp = {
        info = {
            name = "tp",
            description = "teleport to a location",
            usage = "tp [location]",
            aliases = {},
        };

        run = function(Self, Args)
            local Target = Args[1]:lower() == "me" and Self or FindPlayer(Args[1])
            local Target2 = Args[2]:lower() == "me" and Self or FindPlayer(Args[2])
            
            if (Target and Target2) then
                if Target == Player then
                    Player.Character.PrimaryPart.CFrame = Target2.Character.PrimaryPart.CFrame
                end

                Combat.GrabBring(Target, Target2.Character.PrimaryPart.CFrame)
            end
        end;
    };

    kill = {
        info = {
            name = "kill",
            description = "kill a player",
            usage = "kill [player]",
            aliases = {"k"},
        };

        run = function(Self, Args)
            local Target = FindPlayer(Args[1])


            if Target then
                Data.States.Killing = true
                Combat.Eliminate(Target)
                Data.States.Killing = false
            end
        end;
    };

    bring = {
        info = {
            name = "bring",
            description = "bring a player",
            usage = "bring [player]",
            aliases = {"b"},
        };

        run = function(Self, Args)
            local Target = FindPlayer(Args[1])


            if Target then
                Data.States.Killing = true
                Combat.GrabBring(Target, Players.LocalPlayer.Character.PrimaryPart.CFrame)
                Data.States.Killing = false
            end
        end;
    };

    showlm = {
        info = {
            name = "showlm",
            description = "teleport a player to a landmark",
            usage = "showlm [landmark] [target]",
            aliases = {"lmtp","sl"},
        };

        run = function(Self, Args)
            local Target = FindTeleport(Args[1])

            if Target then
                if Self == Player then
                    Player.Character.PrimaryPart.CFrame = Data.Teleports[Target]
                    return
                end

                Data.States.Killing = true
                Combat.GrabBring(Target, Data.Teleports[Target])
                Data.States.Killing = false
            end
        end;
    };

    jail = {
        info = {
            name = "jail",
            description = "jail a player",
            usage = "jail [player]",
            aliases = {},
        };

        run = function(Self, Args)
            local Target = FindPlayer(Args[1])

            if Target then
                Data.States.Killing = true
                Combat.GrabBring(Target, Data.Teleports.Jail)
                Data.States.Killing = false
            end
        end;
    };

    landmark = {
        info = {
            name = "landmark",
            description = "teleport to a landmark",
            usage = "landmark [landmark]",
            aliases = {"lmk","lm","lc","goto"},
        };

        run = function(Self, Args)
            local Target = FindTeleport(Args[1])

            if Target then
                if Self == Player then
                    Player.Character.PrimaryPart.CFrame = Data.Teleports[Target]
                    return
                end

                Data.States.Killing = true
                Combat.GrabBring(Target, Data.Teleports[Target])
                Data.States.Killing = false
            end
        end;
    };

    mod = {
        info = {
            name = "mod",
            description = "mod a player",
            usage = "mod [player]",
            aliases = {"admin", "rank"},
        };

        run = function(Self, Args)
            local Target = FindPlayer(Args[1])

            Logger:Send("Ranking " .. Target.Name .. " to moderator", "Okay!")

            Eurus:RegisterPlayer(Target, {
                Rank = 5
            })
        end;
    };

    trusted = {
        info = {
            name = "trusted",
            description = "add a player to trusted",
            usage = "trusted [player]",
            aliases = {},
        };

        run = function(Self, Args)
            if Self == Player then
                local Target = FindPlayer(Args[1])

                if Target then
                    table.insert(Data.Settings.Trusted, Target)
                    Logger:Send(Target.Name .. " has been added to trusted", "Okay!")
                end
            else
                local Target = FindPlayer(Args[1])

                if Target then
                    table.insert(Data.Settings.Trusted, Target)
                    Logger:Send(Target.Name .. " has been added to trusted", "Okay!")
                end
            end
        end;
    };

    untrust = {
        info = {
            name = "untrusted",
            description = "remove a player from trusted",
            usage = "untrusted [player]",
            aliases = {},
        };

        run = function(Self, Args)
            if Self == Player then
                local Target = FindPlayer(Args[1])

                if Target then
                    table.remove(Data.Settings.Trusted, Target.Name)
                end
            else
                local Target = FindPlayer(Args[1])

                if Target then
                    table.remove(Data.Settings.Trusted, Target.Name)
                end
            end
        end;
    };

    trustedlist = {
        info = {
            name = "trustedlist",
            description = "list trusted players",
            usage = "trustedlist",
            aliases = {},
        };

        run = function(Self, Args)
            if Self == Player then
                local Trusted = ""

                for Index, Player in pairs(Data.Settings.Trusted) do
                    Trusted = Trusted .. Player.Name .. ", "
                end

                Logger:Send("Trusted", Trusted, 5)
            else
                local Trusted = ""

                for Index, Player in pairs(Data.Settings.Trusted) do
                    Trusted ..= Player.Name .. ", "
                end

                Eurus:Chat("Trusted: " .. Trusted, Self)
            end
        end;
    };

    killaura = {
        info = {
            name = "killaura",
            description = "toggle killaura",
            usage = "killaura",
            aliases = {},
        };

        run = function(Self, Args)
            if Self == Player then
                if (Data.Mods[Player.Name].KillAura) then
                    Data.Mods[Player.Name].KillAura = false
                    Logger:Send("Kill Aura Disabled", "Okay!")
                else
                    Data.Mods[Player.Name].KillAura = true
                    Logger:Send("Kill Aura Enabled", "Okay!")
                end
            else
                if (Data.Mods[Player.Name].KillAura) then
                    Data.Mods[Player.Name].KillAura = false
                    Eurus:Chat("[Kill Aura] Kill Aura Disabled", Self)
                else
                    Data.Mods[Player.Name].KillAura = true
                    Eurus:Chat("[Kill Aura] Kill Aura Enabled", Self)
                end
            end
        end;
    };

    aurarange = {
        info = {
            name = "aurarange",
            description = "set killaura range",
            usage = "aurarange [range]",
            aliases = {},
        };

        run = function(Self, Args)
            if Self == Player then
                if (Args[1]) then
                    Data.Mods[Player.Name].KRange = tonumber(Args[1])
                    Logger:Send("Kill Range", "Kill Range set to " .. Args[1], 5)
                end
            else
                if (Args[1]) then
                    Data.Mods[Player.Name].KRange = tonumber(Args[1])
                    Eurus:Chat("[Kill Range] Kill Range set to " .. Args[1], Self)
                end
            end
        end;
    };

    rejoin = {
        info = {
            name = "rejoin",
            description = "rejoin the game",
            usage = "rejoin",
            aliases = {"rj"},
        };

        run = function(Self, Args)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Karz1337/SilentAimArchive/c71d25fe1542ea4b45f98950468c0dde889c0721/ValiantENV", true))();
            queueonteleport("_G.lastpos = CFrame.new(" .. tostring(Player.Character.PrimaryPart.CFrame) .. ");loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Ix1x0x3/glorious/master/src/Main.lua\", true))();" )
            TeleportService:Teleport(game.PlaceId, Player);
        end
    };
}

-- setup eurus and add commands
for _, Command in pairs(Commands) do
    Eurus:AddCommand(_, Command.info.aliases, Command.info, Command.run)
    Logger:Send("Command " .. Command.info.name .. " loaded", "Okay!", 0.5)
end

-- listen for commands ran on eurus
Eurus.CommandRan:Connect(function(Runner, Command, Args)
    if Runner ~= Player then
        Logger:Send(Runner.Name .. " ran \"!".. Command .. table.concat(Args, " ") .. "\"", "Okay!", 3)
    end
end)

UI.Event:Connect(function(Name, ...)
    if Name:find("!!") then
        _G["G___"..Name:gsub("!!","")] = ...
    end
end)

local NilBody = function()
	if Network(Player) then
		_G.Killing = false
		local ops = Player.Character.HumanoidRootPart.CFrame;
		for i, v in pairs(Player.Character:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
				v:Destroy()
			end
		end
		repeat wait() until Player.Character:FindFirstChild("HumanoidRootPart");
		Player.Character.HumanoidRootPart.CFrame = ops;
	end
end

-- killaura handler, with auto respawn
RunService.Heartbeat:Connect(function()

    coroutine.wrap(function()
        if Player.Character then
            if Player.Character:FindFirstChildOfClass("Humanoid") then
                if Player.Character.BodyEffects:FindFirstChild"K.O".Value == true or Player.Character.Humanoid.Health <= 3 then
					NilBody()
				end
            end
        end
    end)()

    -- go through all mods and check if they have killaura on. if they do, then get all players near them and kill them.
    for Name, Mod in pairs(Data.Mods) do
        local MPlayer = game.Players[Name]

        if Mod.KillAura then

            for _, Target in pairs(game.Players:GetPlayers()) do
                if Target == MPlayer then
                    continue;
                end

                if Target.Character then
                    if Target.Character.PrimaryPart then
                        if (Target.Character.PrimaryPart.Position - MPlayer.Character.PrimaryPart.Position).magnitude < Mod.KRange and not IsTrusted(Target) and not Data.States.Killing then
                            Data.States.Killing = true
                            Combat.Eliminate(Target, false)
                            Data.States.Killing = false
                        end
                    end
                end
            end
        end
    end
end)