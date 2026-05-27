local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local KEY = "mtanbatocom"

local KEY_SAVE = "MTSENKAI_KEYTIME"

local VALID_TIME = 35 * 60 

local HttpService = game:GetService("HttpService")

local function saveKeyTime()

	local data = {
		expire = os.time() + VALID_TIME
	}

	if writefile then
		writefile(KEY_SAVE..".txt", HttpService:JSONEncode(data))
	end

end

local function getKeyTime()

	if not isfile then
		return 0
	end

	if not isfile(KEY_SAVE..".txt") then
		return 0
	end

	local success,data = pcall(function()

		return HttpService:JSONDecode(
			readfile(KEY_SAVE..".txt")
		)

	end)

	if success and data.expire then
		return data.expire
	end

	return 0
end

local function keyStillValid()

	return os.time() < getKeyTime()

end

if PlayerGui:FindFirstChild("ModernKeyMenu") then
	PlayerGui.ModernKeyMenu:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "ModernKeyMenu"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")

local toggle = Instance.new("ImageButton")
toggle.Name = "MenuToggle"
toggle.Parent = gui

toggle.Size = UDim2.new(0,52,0,52)
toggle.Position = UDim2.new(0,12,0.45,0)

toggle.BackgroundColor3 = Color3.fromRGB(18,18,18)
toggle.AutoButtonColor = false
toggle.BorderSizePixel = 0

toggle.Image = "rbxassetid://121818343044982"

toggle.Active = true
toggle.Selectable = true
toggle.ZIndex = 999

pcall(function()
	ContentProvider:PreloadAsync({toggle})
end)

toggle.ImageTransparency = 0

toggle.ScaleType = Enum.ScaleType.Stretch
toggle.ResampleMode = Enum.ResamplerMode.Pixelated

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0,12)
toggleCorner.Parent = toggle

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Parent = toggle
toggleStroke.Color = Color3.fromRGB(100,70,170)
toggleStroke.Thickness = 1.5

task.spawn(function()

	task.wait(0.5)

	toggle.Image = ""
	task.wait()

	toggle.Image = "rbxassetid://121818343044982"

end)

toggle.MouseEnter:Connect(function()

	TweenService:Create(toggle,TweenInfo.new(0.15),{
		BackgroundColor3 = Color3.fromRGB(35,25,50)
	}):Play()

end)

toggle.MouseLeave:Connect(function()

	TweenService:Create(toggle,TweenInfo.new(0.15),{
		BackgroundColor3 = Color3.fromRGB(18,18,18)
	}):Play()

end)

local keyFrame = Instance.new("Frame")
keyFrame.Parent = gui
keyFrame.Size = UDim2.new(0,300,0,170)
keyFrame.Position = UDim2.new(0.5,-150,0.5,-85)
keyFrame.BackgroundColor3 = Color3.fromRGB(12,12,12)

Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0,12)

local keyStroke = Instance.new("UIStroke")
keyStroke.Parent = keyFrame
keyStroke.Color = Color3.fromRGB(110,70,200)

local keyTitle = Instance.new("TextLabel")
keyTitle.Parent = keyFrame
keyTitle.Size = UDim2.new(1,0,0,40)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "MinhTrieu Roblox"
keyTitle.TextColor3 = Color3.fromRGB(200,170,255)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 22

local keyBox = Instance.new("TextBox")
keyBox.Parent = keyFrame
keyBox.Size = UDim2.new(0,240,0,38)
keyBox.Position = UDim2.new(0.5,-120,0,55)
keyBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
keyBox.PlaceholderText = "Nhập key..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.PlaceholderColor3 = Color3.fromRGB(120,120,120)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 16

Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,8)

local status = Instance.new("TextLabel")
status.Parent = keyFrame
status.Size = UDim2.new(1,0,0,25)
status.Position = UDim2.new(0,0,0,100)
status.BackgroundTransparency = 1
status.Text = ""
status.Font = Enum.Font.GothamBold
status.TextSize = 14

local checkButton = Instance.new("TextButton")
checkButton.Parent = keyFrame
checkButton.Size = UDim2.new(0,140,0,35)
checkButton.Position = UDim2.new(0.5,-70,0,125)
checkButton.BackgroundColor3 = Color3.fromRGB(90,60,150)
checkButton.Text = "XÁC NHẬN"
checkButton.TextColor3 = Color3.new(1,1,1)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 15

Instance.new("UICorner", checkButton).CornerRadius = UDim.new(0,8)

local intro = Instance.new("Frame")
intro.Parent = gui
intro.Size = UDim2.new(0,340,0,180)
intro.Position = UDim2.new(0.5,-170,0.5,-90)
intro.BackgroundColor3 = Color3.fromRGB(10,10,10)
intro.Visible = false

Instance.new("UICorner", intro).CornerRadius = UDim.new(0,12)

local introStroke = Instance.new("UIStroke")
introStroke.Parent = intro
introStroke.Color = Color3.fromRGB(110,70,200)

local introTitle = Instance.new("TextLabel")
introTitle.Parent = intro
introTitle.Size = UDim2.new(1,0,0,45)
introTitle.BackgroundTransparency = 1
introTitle.Text = "MinhTrieu Roblox"
introTitle.TextColor3 = Color3.fromRGB(190,140,255)
introTitle.Font = Enum.Font.GothamBlack
introTitle.TextSize = 24

local introText = Instance.new("TextLabel")
introText.Parent = intro
introText.Size = UDim2.new(1,-30,0,70)
introText.Position = UDim2.new(0,15,0,50)
introText.BackgroundTransparency = 1
introText.TextWrapped = true
introText.Text = "đã kích hoạt Script.\nChúc bạn chơi game vui vẻ!"
introText.TextColor3 = Color3.new(1,1,1)
introText.Font = Enum.Font.Gotham
introText.TextSize = 15

local continueButton = Instance.new("TextButton")
continueButton.Parent = intro
continueButton.Size = UDim2.new(0,150,0,38)
continueButton.Position = UDim2.new(0.5,-75,1,-50)
continueButton.BackgroundColor3 = Color3.fromRGB(90,60,150)
continueButton.Text = "TIẾP TỤC"
continueButton.TextColor3 = Color3.new(1,1,1)
continueButton.Font = Enum.Font.GothamBold
continueButton.TextSize = 15

Instance.new("UICorner", continueButton).CornerRadius = UDim.new(0,10)

local loadingFrame = Instance.new("Frame")
loadingFrame.Parent = gui
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
loadingFrame.BackgroundTransparency = 0.25
loadingFrame.Visible = false

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

local loadBox = Instance.new("Frame")
loadBox.Parent = loadingFrame
loadBox.Size = UDim2.new(0,340,0,170)
loadBox.Position = UDim2.new(0.5,-170,0.5,-85)
loadBox.BackgroundColor3 = Color3.fromRGB(20,20,20)

Instance.new("UICorner",loadBox).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke")
stroke.Parent = loadBox
stroke.Color = Color3.fromRGB(120,80,255)

local circle = Instance.new("ImageLabel")
circle.Parent = loadBox
circle.Size = UDim2.new(0,55,0,55)
circle.Position = UDim2.new(0,25,0.5,-28)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://3926305904"
circle.ImageRectOffset = Vector2.new(324,364)
circle.ImageRectSize = Vector2.new(36,36)

local loadingTitle = Instance.new("TextLabel")
loadingTitle.Parent = loadBox
loadingTitle.Size = UDim2.new(1,-100,0,30)
loadingTitle.Position = UDim2.new(0,95,0,45)

loadingTitle.BackgroundTransparency = 1
loadingTitle.Text = "MinhTrieu Loading"
loadingTitle.TextColor3 = Color3.new(1,1,1)
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.TextSize = 22
loadingTitle.TextXAlignment = Enum.TextXAlignment.Left

local loadingInfo = Instance.new("TextLabel")
loadingInfo.Parent = loadBox
loadingInfo.Size = UDim2.new(1,-100,0,20)
loadingInfo.Position = UDim2.new(0,95,0,75)

loadingInfo.BackgroundTransparency = 1
loadingInfo.Text = "Loading Script..."
loadingInfo.TextColor3 = Color3.fromRGB(180,180,180)
loadingInfo.Font = Enum.Font.Gotham
loadingInfo.TextSize = 14
loadingInfo.TextXAlignment = Enum.TextXAlignment.Left

local barBG = Instance.new("Frame")
barBG.Parent = loadBox
barBG.Size = UDim2.new(0,240,0,8)
barBG.Position = UDim2.new(0,95,0,110)
barBG.BackgroundColor3 = Color3.fromRGB(35,35,35)

Instance.new("UICorner",barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame")
bar.Parent = barBG
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(140,90,255)

Instance.new("UICorner",bar).CornerRadius = UDim.new(1,0)

local percentText = Instance.new("TextLabel")
percentText.Parent = loadBox
percentText.Size = UDim2.new(0,60,0,20)
percentText.Position = UDim2.new(1,-65,0,125)

percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.new(1,1,1)
percentText.Font = Enum.Font.GothamBold
percentText.TextSize = 15

local function startLoading()

	loadingFrame.Visible = true

	main.Visible = false
	toggle.Visible = false

	blur.Size = 18

	bar.Size = UDim2.new(0,0,1,0)

	task.spawn(function()

		while loadingFrame.Visible do

			circle.Rotation += 6

			task.wait()

		end

	end)

	for i = 1,100 do

		percentText.Text = i.."%"

		TweenService:Create(
			bar,
			TweenInfo.new(0.08),
			{
				Size = UDim2.new(i/100,0,1,0)
			}
		):Play()

		if i < 30 then
			loadingInfo.Text = "Loading Assets..."
		elseif i < 60 then
			loadingInfo.Text = "Checking Scripts..."
		elseif i < 90 then
			loadingInfo.Text = "Preparing UI..."
		else
			loadingInfo.Text = "Complete!"
		end

		task.wait(0.03)

	end

	task.wait(0.4)

	loadingFrame.Visible = false

	blur.Size = 0

	opened = true
	main.Visible = true
	toggle.Visible = true

end

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,430,0,260)
main.Position = UDim2.new(0.5,-215,0.5,-130)

main.BackgroundColor3 = Color3.fromRGB(8,8,8)
main.Visible = false

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local mainStroke = Instance.new("UIStroke")
mainStroke.Parent = main
mainStroke.Color = Color3.fromRGB(125,85,255)
mainStroke.Thickness = 1.8

local TweenService = game:GetService("TweenService")

local side = Instance.new("Frame")
side.Parent = main
side.Size = UDim2.new(0,120,1,0)
side.BackgroundColor3 = Color3.fromRGB(12,12,12)
side.BorderSizePixel = 0

Instance.new("UICorner", side).CornerRadius = UDim.new(0,12)

local sideGradient = Instance.new("UIGradient")
sideGradient.Parent = side
sideGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(18,18,18)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(40,20,55))
}
sideGradient.Rotation = 90

local textHolder = Instance.new("Frame")
textHolder.Parent = side
textHolder.Size = UDim2.new(1,0,0,60)
textHolder.Position = UDim2.new(0,0,0,2)
textHolder.BackgroundTransparency = 1

local letters = {}
local word = "MinhTrieu"

for i = 1,#word do

	local char = string.sub(word,i,i)

	local letter = Instance.new("TextLabel")
	letter.Parent = textHolder
	letter.BackgroundTransparency = 1
	letter.Size = UDim2.new(0,18,0,30)

	local x = 8 + (i-1)*12
	local curve = math.sin(i*0.55) * 8

	letter.Position = UDim2.new(0,x,0,12 + curve)

	letter.Text = char
	letter.TextColor3 = Color3.fromRGB(255,255,255)
	letter.TextSize = 24
	letter.Font = Enum.Font.GothamBlack
	letter.Rotation = curve * 1.5

	local stroke = Instance.new("UIStroke")
	stroke.Parent = letter
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(170,85,255)

	local grad = Instance.new("UIGradient")
	grad.Parent = letter
	grad.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(190,120,255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(120,60,255))
	}

	table.insert(letters,{
		label = letter,
		stroke = stroke,
		gradient = grad,
		baseY = 12 + curve
	})

end

task.spawn(function()

	while true do

		for i,v in pairs(letters) do

			local up = TweenService:Create(
				v.label,
				TweenInfo.new(
					0.8,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out
				),
				{
					Position = UDim2.new(
						v.label.Position.X.Scale,
						v.label.Position.X.Offset,
						0,
						v.baseY - 4
					),
					Rotation = v.label.Rotation + 3
				}
			)

			local down = TweenService:Create(
				v.label,
				TweenInfo.new(
					0.8,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.InOut
				),
				{
					Position = UDim2.new(
						v.label.Position.X.Scale,
						v.label.Position.X.Offset,
						0,
						v.baseY
					)
				}
			)

			local glow1 = TweenService:Create(
				v.stroke,
				TweenInfo.new(0.8),
				{
					Color = Color3.fromRGB(255,255,255),
					Thickness = 3
				}
			)

			local glow2 = TweenService:Create(
				v.stroke,
				TweenInfo.new(0.8),
				{
					Color = Color3.fromRGB(170,85,255),
					Thickness = 2
				}
			)

			local rotate = TweenService:Create(
				v.gradient,
				TweenInfo.new(2, Enum.EasingStyle.Linear),
				{
					Rotation = 360
				}
			)

			up:Play()
			glow1:Play()
			rotate:Play()

			task.wait(0.08)

			down:Play()
			glow2:Play()

		end

		task.wait(1)

	end

end)

local userId = player.UserId

local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size100x100

local content = Players:GetUserThumbnailAsync(
	userId,
	thumbType,
	thumbSize
)

local avatarHolder = Instance.new("Frame")
avatarHolder.Parent = side

avatarHolder.Size = UDim2.new(0,34,0,34)
avatarHolder.Position = UDim2.new(0.5,-17,1,-70)

avatarHolder.BackgroundColor3 = Color3.fromRGB(18,18,18)
avatarHolder.BorderSizePixel = 0

Instance.new("UICorner", avatarHolder).CornerRadius = UDim.new(1,0)

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Parent = avatarHolder
avatarStroke.Color = Color3.fromRGB(110,70,200)
avatarStroke.Thickness = 1

local avatar = Instance.new("ImageLabel")
avatar.Parent = avatarHolder

avatar.Size = UDim2.new(1,-4,1,-4)
avatar.Position = UDim2.new(0,2,0,2)

avatar.BackgroundTransparency = 1
avatar.Image = content

avatar.ScaleType = Enum.ScaleType.Crop

Instance.new("UICorner", avatar).CornerRadius = UDim.new(1,0)

local keyTimer = Instance.new("TextLabel")
keyTimer.Parent = side
keyTimer.Size = UDim2.new(1,-10,0,20)
keyTimer.Position = UDim2.new(0,5,1,-25)

keyTimer.BackgroundTransparency = 1

keyTimer.TextColor3 = Color3.fromRGB(170,170,170)
keyTimer.Font = Enum.Font.Gotham
keyTimer.TextSize = 11

task.spawn(function()

	while true do

		local remain = getKeyTime() - os.time()

		if remain > 0 then

			local minutes = math.floor(remain / 60)
			local seconds = remain % 60

			keyTimer.Text =
				"Key hết sau: "
				..minutes.."m "
				..seconds.."s"

		else

			keyTimer.Text = "Key đã hết hạn"

		end

		task.wait(1)

	end

end)

local content = Instance.new("Frame")
content.Parent = main
content.Position = UDim2.new(0,130,0,0)
content.Size = UDim2.new(1,-140,1,0)

content.BackgroundColor3 = Color3.fromRGB(8,8,8)
content.BorderSizePixel = 0

Instance.new("UICorner", content).CornerRadius = UDim.new(0,12)

local ContentProvider = game:GetService("ContentProvider")

local bgImage = Instance.new("ImageLabel")
bgImage.Name = "BackgroundImage"
bgImage.Parent = content

bgImage.AnchorPoint = Vector2.new(0.5,0.5)
bgImage.Position = UDim2.new(0.5,0,0.5,0)
bgImage.Size = UDim2.new(1,0,1,0)

bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://72093801276619"

pcall(function()
	ContentProvider:PreloadAsync({bgImage})
end)

bgImage.ImageTransparency = 0.4

bgImage.ScaleType = Enum.ScaleType.Stretch
bgImage.ResampleMode = Enum.ResamplerMode.Pixelated

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0,12)
bgCorner.Parent = bgImage

local darkOverlay = Instance.new("Frame")
darkOverlay.Parent = content
darkOverlay.Size = UDim2.new(1,0,1,0)

darkOverlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
darkOverlay.BackgroundTransparency = 0.45
darkOverlay.BorderSizePixel = 0

local overlayCorner = Instance.new("UICorner")
overlayCorner.CornerRadius = UDim.new(0,12)
overlayCorner.Parent = darkOverlay

task.spawn(function()

	task.wait(0.5)

	bgImage.Image = ""
	task.wait()

	bgImage.Image = "rbxassetid://72093801276619"

end)

local tabs = {}

local function createTab(name,y)

	local button = Instance.new("TextButton")
	button.Parent = side
	button.Size = UDim2.new(1,-10,0,34)
	button.Position = UDim2.new(0,5,0,y)

	button.BackgroundColor3 = Color3.fromRGB(8,8,8)
	button.BackgroundTransparency = 0.25

	button.Text = name
	button.TextColor3 = Color3.new(1,1,1)
	button.TextSize = 13
	button.Font = Enum.Font.GothamBold

	Instance.new("UICorner", button).CornerRadius = UDim.new(0,8)

	local stroke = Instance.new("UIStroke")
	stroke.Parent = button
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Transparency = 0.45
	stroke.Thickness = 1

	local page = Instance.new("ScrollingFrame")
	page.Parent = content
	page.Size = UDim2.new(1,0,1,0)

	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0

	page.CanvasSize = UDim2.new(0,0,0,600)
	page.ScrollBarThickness = 4
	page.ScrollBarImageColor3 = Color3.fromRGB(255,255,255)

	page.Visible = false

	local layout = Instance.new("UIListLayout")
	layout.Parent = page
	layout.Padding = UDim.new(0,8)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

		page.CanvasSize = UDim2.new(
			0,
			0,
			0,
			layout.AbsoluteContentSize.Y + 15
		)

	end)

	tabs[name] = {
		Page = page,
		Button = button
	}

	button.MouseButton1Click:Connect(function()

		for _,v in pairs(tabs) do

			v.Page.Visible = false

			TweenService:Create(v.Button,TweenInfo.new(0.15),{
				BackgroundColor3 = Color3.fromRGB(8,8,8),
				BackgroundTransparency = 0.25
			}):Play()

		end

		page.Visible = true

		TweenService:Create(button,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(90,60,150),
			BackgroundTransparency = 0
		}):Play()

	end)

	return page
end

local mainTab = createTab("🏠 Main",105)
local utilsTab = createTab("⚡ Player",145)
local settingsTab = createTab("⚙ Settings",65)

local function createButton(parent,text,y,callback)

	local holder = Instance.new("Frame")
	holder.Parent = parent
	holder.Size = UDim2.new(1,-35,0,32)

	holder.BackgroundColor3 = Color3.fromRGB(8,8,8)
	holder.BackgroundTransparency = 0.25

	holder.BorderSizePixel = 0
	holder.LayoutOrder = y

	Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)

	local stroke = Instance.new("UIStroke")
	stroke.Parent = holder
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Transparency = 0.45
	stroke.Thickness = 1

	local btn = Instance.new("TextButton")
	btn.Parent = holder
	btn.Size = UDim2.new(1,0,1,0)
	btn.BackgroundTransparency = 1

	btn.Text = text
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold

	local icon = Instance.new("TextLabel")
	icon.Parent = holder
	icon.Size = UDim2.new(0,20,1,0)
	icon.Position = UDim2.new(0,8,0,0)
	icon.BackgroundTransparency = 1

	icon.Text = "⚡"
	icon.TextColor3 = Color3.fromRGB(200,200,255)
	icon.TextSize = 12
	icon.Font = Enum.Font.GothamBold

	btn.MouseEnter:Connect(function()

		TweenService:Create(holder,TweenInfo.new(0.15),{
			BackgroundTransparency = 0.1,
			BackgroundColor3 = Color3.fromRGB(18,18,18)
		}):Play()

	end)

	btn.MouseLeave:Connect(function()

		TweenService:Create(holder,TweenInfo.new(0.15),{
			BackgroundTransparency = 0.25,
			BackgroundColor3 = Color3.fromRGB(8,8,8)
		}):Play()

	end)

	btn.MouseButton1Click:Connect(callback)

	return btn
end

createButton(mainTab,"AirFlow Hub",48,function()

	print("AirFlow Hub Script")
loadstring(game:HttpGet("https://airflowscript.com/loader"))()
end)

createButton(mainTab,"Violet Hub",88,function()

	print("Violet Hub Script")
script_key="Your Key Here";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4796888c8c56891e752644e0eb4140f6.lua"))()
end)

createButton(mainTab,"LunarZ Hub",128,function()

        print("LunarZ Hub Script")
loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarZR/bomba/refs/heads/main/AOTR1"))()
end)

createButton(mainTab,"Titanic Hub",168,function()

        print("Titanic Hub Script")
loadstring(game:HttpGet("https://raw.githubusercontent.com/TITANIC-HUB/THUB/main/Loader.lua"))()
end)

createButton(mainTab,"kira Hub",208,function()

        print("kira Hub Script")
loadstring(game:HttpGet('https://raw.githubusercontent.com/ans974829-star/KiraScripts/refs/heads/main/Attack%20On%20Titan%20%3A%20Revolution'))()
end)

createButton(mainTab,"Axon Hub",248,function()

        print("Axon Hub Script")
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/97c3f6db55a2cf72141537a85458e5a7.lua"))()
end)

createButton(mainTab,"Best AoTR Hub",268,function()
   
        print("Best AoTR Hub Script")
loadstring(game:HttpGet(('https://pastefy.app/jIAPA2zS/raw'),true))()
end)

createButton(mainTab,"Lix Hub",308,function()
         
        print("Lix Hub Script")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lixtron/Hub/refs/heads/main/loader"))() 
end)

createButton(mainTab,"Lemon Hub",348,function()

        print("Lemon Hub Script")
loadstring(game:HttpGet("https://lemonhub.xyz/panel/script"))()
end)

local lowGraphics = false
local savedMaterials = {}

createButton(utilsTab,"Giảm Độ Họa",48,function()

	lowGraphics = not lowGraphics

	if lowGraphics then

		game.Lighting.GlobalShadows = false
		game.Lighting.FogEnd = 100000
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

		for _,v in pairs(workspace:GetDescendants()) do

			if v:IsA("ParticleEmitter")
			or v:IsA("Trail")
			or v:IsA("Smoke")
			or v:IsA("Fire")
			or v:IsA("Sparkles") then

				v.Enabled = false
			end

			if v:IsA("Texture")
			or v:IsA("Decal") then

				v.Transparency = 1
			end

			if v:IsA("SpecialMesh") then

				v.TextureId = ""

			end

			if v:IsA("BasePart") then

				savedMaterials[v] = v.Material

				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0

			end

		end

		print("Giảm Độ Họa ON")

	else

		game.Lighting.GlobalShadows = true
		game.Lighting.FogEnd = 100000

		for _,v in pairs(workspace:GetDescendants()) do

			if v:IsA("ParticleEmitter")
			or v:IsA("Trail")
			or v:IsA("Smoke")
			or v:IsA("Fire")
			or v:IsA("Sparkles") then

				v.Enabled = true
			end

			if v:IsA("Texture")
			or v:IsA("Decal") then

				v.Transparency = 0
			end

			if v:IsA("BasePart") and savedMaterials[v] then

				v.Material = savedMaterials[v]

			end

		end

		print("Giảm Độ Họa OFF")

	end

end)

local removeEffects = false
local savedEffects = {}

createButton(utilsTab,"Xóa Hiệu Ứng",128,function()

	removeEffects = not removeEffects

	if removeEffects then

		for _,v in pairs(workspace:GetDescendants()) do

			if v:IsA("ParticleEmitter")
			or v:IsA("Trail")
			or v:IsA("Smoke")
			or v:IsA("Fire")
			or v:IsA("Sparkles")
			or v:IsA("Beam") then

				savedEffects[v] = v.Enabled
				v.Enabled = false

			end

			if v:IsA("PointLight")
			or v:IsA("SpotLight")
			or v:IsA("SurfaceLight") then

				savedEffects[v] = v.Enabled
				v.Enabled = false

			end

			if v:IsA("BlurEffect")
			or v:IsA("BloomEffect")
			or v:IsA("ColorCorrectionEffect")
			or v:IsA("SunRaysEffect")
			or v:IsA("DepthOfFieldEffect") then

				savedEffects[v] = v.Enabled
				v.Enabled = false

			end

		end

		print("Xóa Hiệu Ứng ON")

	else

		for v,state in pairs(savedEffects) do

			if v and v.Parent then

				if v:IsA("ParticleEmitter")
				or v:IsA("Trail")
				or v:IsA("Smoke")
				or v:IsA("Fire")
				or v:IsA("Sparkles")
				or v:IsA("Beam")
				or v:IsA("PointLight")
				or v:IsA("SpotLight")
				or v:IsA("SurfaceLight")
				or v:IsA("BlurEffect")
				or v:IsA("BloomEffect")
				or v:IsA("ColorCorrectionEffect")
				or v:IsA("SunRaysEffect")
				or v:IsA("DepthOfFieldEffect") then

					v.Enabled = state

				end

			end

		end

		print("Xóa Hiệu Ứng OFF")

	end

end)
local antiAFK = false
local antiAFKConnection

local function showTopNotification(text)

	local player = game.Players.LocalPlayer
	local gui = player:WaitForChild("PlayerGui")

	if gui:FindFirstChild("TopNotification") then
		gui.TopNotification:Destroy()
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "TopNotification"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = gui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 260, 0, 32)
	frame.Position = UDim2.new(0.5, -130, 0, 15)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BackgroundTransparency = 1
	frame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = Color3.fromRGB(120, 120, 120)
	stroke.Transparency = 0.4
	stroke.Parent = frame

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(235, 235, 235)
	label.TextSize = 14
	label.Font = Enum.Font.GothamSemibold
	label.Text = text
	label.TextTransparency = 1
	label.Parent = frame

	for i = 1, 10 do
		frame.BackgroundTransparency = 1 - (i * 0.1)
		label.TextTransparency = 1 - (i * 0.1)
		task.wait(0.01)
	end

	task.delay(2, function()
		for i = 1, 10 do
			frame.BackgroundTransparency = i * 0.1
			label.TextTransparency = i * 0.1
			task.wait(0.01)
		end
		screenGui:Destroy()
	end)
end

local function enableAntiAFK()

	if antiAFK then return end
	antiAFK = true

	local VirtualUser = game:GetService("VirtualUser")
	local Players = game:GetService("Players")

	antiAFKConnection = Players.LocalPlayer.Idled:Connect(function()
		VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end)

	showTopNotification("Anti AFK đã BẬT ✔")
	print("Anti AFK ON")
end

local function disableAntiAFK()

	if antiAFKConnection then
		antiAFKConnection:Disconnect()
		antiAFKConnection = nil
	end

	antiAFK = false

	showTopNotification("Anti AFK đã TẮT ❌")
	print("Anti AFK OFF")
end

createButton(utilsTab, "Chống AFK", 50, function()

	if antiAFK then
		disableAntiAFK()
	else
		enableAntiAFK()
	end

end)

task.wait(2)
enableAntiAFK()


local function createIntro()

	local info = Instance.new("Frame")
	info.Parent = settingsTab

	info.Size = UDim2.new(1,-35,0,185)

	info.AnchorPoint = Vector2.new(0.5,0.5)
	info.Position = UDim2.new(0.5,0,0.5,0)

	info.BackgroundColor3 = Color3.fromRGB(10,10,10)
	info.BackgroundTransparency = 0.28
	info.BorderSizePixel = 0

	Instance.new("UICorner", info).CornerRadius = UDim.new(0,14)

	local infoStroke = Instance.new("UIStroke")
	infoStroke.Parent = info
	infoStroke.Color = Color3.fromRGB(255,255,255)
	infoStroke.Thickness = 1.2
	infoStroke.Transparency = 0.45

	local title = Instance.new("TextLabel")
	title.Parent = info

	title.Size = UDim2.new(1,0,0,35)

	title.Position = UDim2.new(0,0,0,18)

	title.BackgroundTransparency = 1

	title.Text = "📜 GIỚI THIỆU"
	title.TextColor3 = Color3.fromRGB(210,180,255)
	title.Font = Enum.Font.GothamBlack
	title.TextSize = 24

	local text = Instance.new("TextLabel")
	text.Parent = info

	text.Size = UDim2.new(1,-40,0,110)

	text.Position = UDim2.new(0,20,0,62)

	text.BackgroundTransparency = 1

	text.TextWrapped = true

	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextYAlignment = Enum.TextYAlignment.Center

	text.Text =
		"==> được tạo bởi Minh Trieu.\n\n" ..

		"- Script tổng hợp các bản Attack on Titan.\n\n" ..
		"- Update Key New Vào Tuần Sau.\n\n" ..
		"YT mtsenkai"

	text.TextColor3 = Color3.new(1,1,1)
	text.Font = Enum.Font.Gotham
	text.TextSize = 14

end

createIntro()

mainTab.Visible = true
tabs["🏠 Main"].Button.BackgroundColor3 = Color3.fromRGB(90,60,150)
tabs["🏠 Main"].Button.BackgroundTransparency = 0

local opened = true

toggle.Visible = false

local debounce = false

local function toggleMenu()

	if debounce then
		return
	end

	debounce = true

	opened = not opened

	-- animation nhỏ
	TweenService:Create(toggle,TweenInfo.new(0.08),{
		Size = UDim2.new(0,46,0,46)
	}):Play()

	task.wait(0.08)

	TweenService:Create(toggle,TweenInfo.new(0.08),{
		Size = UDim2.new(0,52,0,52)
	}):Play()

	-- mở tắt menu
	main.Visible = opened

	task.wait(0.1)

	debounce = false

end

toggle.MouseButton1Click:Connect(toggleMenu)

local circle = Instance.new("ImageLabel")
local function startLoading()

	loadingFrame.Visible = true

	main.Visible = false
	toggle.Visible = false

	local blur = Instance.new("BlurEffect")
	blur.Size = 18
	blur.Parent = game.Lighting

	bar.Size = UDim2.new(0,0,1,0)

	local spinning = true

	task.spawn(function()

		while spinning do

			circle.Rotation += 5

			task.wait()

		end

	end)

	for i = 1,100 do

		percentText.Text = i.."%"

		TweenService:Create(
			bar,
			TweenInfo.new(
				0.08,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.new(i/100,0,1,0)
			}
		):Play()

		if i < 25 then

			loadingInfo.Text = "Loading Menu MinhTrieu..."

		elseif i < 50 then

			loadingInfo.Text = "Kiểm tra key..."

		elseif i < 75 then

			loadingInfo.Text = "Key Chính xác..."

		else

			loadingInfo.Text = "Hoàn thành kiểm tra..."

		end

		task.wait(0.03)

	end

	spinning = false

	task.wait(0.3)

	loadingFrame.Visible = false

	blur:Destroy()

	opened = true

	main.Visible = true
	toggle.Visible = true

	main.Size = UDim2.new(0,380,0,220)

	TweenService:Create(
		main,
		TweenInfo.new(
			0.25,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			Size = UDim2.new(0,430,0,260)
		}
	):Play()

end

checkButton.MouseButton1Click:Connect(function()

	if keyBox.Text == KEY then

		saveKeyTime()

		status.Text = "key đúng rồi!"
		status.TextColor3 = Color3.fromRGB(0,255,100)

		task.wait(0.5)

		keyFrame.Visible = false

		startLoading()

	else

		status.Text = "key sai rồi!"
		status.TextColor3 = Color3.fromRGB(255,70,70)

	end

end)

if keyStillValid() then

	keyFrame.Visible = false
	intro.Visible = false
	toggle.Visible = false

	startLoading()

else

	keyFrame.Visible = true

	main.Visible = false
	toggle.Visible = false

end
