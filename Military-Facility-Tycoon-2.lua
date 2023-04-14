local player = game:GetService("Players").LocalPlayer
local tycoon = game:GetService("Workspace")["Ruixey's Tycoonkit 1.12"].Tycoons[player.Tycoon.Value.Name]
local no = {"Buy VIPUpgrader", "Buy VIPDropper", "Buy DoubleCash", "Buy Autocollect", "BuyGroupMember", "Buy Railgun"}
local touch = tycoon.Essentials.CurrencyCollector.Giver
local touch2 = game:GetService("Workspace")["Sadakos_Curse"].HumanoidRootPart
local dropper1 = tycoon.Purchased["Dropper 1"].Decoration.Grey.Part.CFrame

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Fuck this game lol",
	LoadingTitle = "Mil Sim Fucker",
	LoadingSubtitle = "by SippingSizzurp"})


local tabs = {}

tabs.main = Window:CreateTab("Main", 4483362458) -- Title, Image
tabs.autofarm = Window:CreateTab("AutoFarm", 4483362458) -- Title, Image
tabs.tps = Window:CreateTab("Teleports", 4483362458) -- Title, Image

local Section = tabs.main:CreateSection("Money Glitch")

local moneytoggle = false
local button = tycoon.Purchased["Dropper 1"].Clicker.ClickerPrompt

local Toggle = tabs.main:CreateToggle({
	Name = "Toggle Money Spam",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		moneytoggle = Value
		while moneytoggle and wait() do
            fireproximityprompt(button, 3)
		end
	end,
})

tabs.main:CreateToggle({
    Name = "Auto Collect",
    CurrentValue = false,
    Flag = "autocollect", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(value)
        local toggle = 0 -- 0 for fire, 1 for un-fire
        local touch = tycoon.Essentials.CurrencyCollector.Giver
        local touch2 = player.Character.HumanoidRootPart
        
        while value and wait() do
            if toggle == 0 then
                toggle = 1
            else
                toggle = 0
            end
            
            firetouchinterest(touch2, touch, toggle)
        end
    end,
})


local Button = tabs.tps:CreateButton({
	Name = "Buy Buttons",
	Callback = function()
		local buttons = tycoon.Buttons:GetChildren()
		for i, v in ipairs(buttons) do
            if not table.find(no, v.name) then
                local child = v:FindFirstChild("Head")
                newcf = child.CFrame
                player.Character.HumanoidRootPart.CFrame = newcf
                wait()
            end
		end
	end,
})

local Button = tabs.tps:CreateButton({
	Name = "TP to Dropper1",
	Callback = function()
		local dropper1 = tycoon.Purchased["Dropper 1"].Decoration.Grey.Part.CFrame
        player.Character.HumanoidRootPart.CFrame = dropper1
	end,
})

local autofarm = false

local Label = tabs.autofarm:CreateLabel("For this to work make sure to enable money spam and auto collect")

local Toggle = tabs.autofarm:CreateToggle({
	Name = "Toggle Auto Farm",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autofarm = Value
		while autofarm and wait() do
            local buttons = tycoon.Buttons:GetChildren()
        	for i, v in ipairs(buttons) do
                if not table.find(no, v.name) then
                    local child = v:FindFirstChild("Head")
                    newcf = child.CFrame
                    player.Character.HumanoidRootPart.CFrame = newcf
                    wait()
                end
        	end
        	
            player.Character.HumanoidRootPart.CFrame = dropper1
            wait(60)
        	
        end
	end,
})


local Toggle = tabs.autofarm:CreateToggle({
	Name = "Toggle Auto Rebirth",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		while Value and wait() do
		    game:GetService("ReplicatedStorage").TycoonEvent:FireServer("Rebirth")
		    wait(60)
		end
	end,
})
	
