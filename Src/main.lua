local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local iskey = isfile("AzulHubKey.txt")
if iskey == false then
local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 501, 0, 461)
TextBox.Size = UDim2.new(0.166251034, 0, 0.0514403284, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 20.000
TextBox.PlaceholderText = "Key"
TextBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
local success, errormsg = pcall(function()
TextBox.FocusLost:Connect(function(enterPressed)
    if TextBox.Text == game:HttpGet("https://1.kelprepl.repl.co/verify/Azul?verify_key=".. TextBox.Text) then
       if success then
         writefile("AzulHubKey.txt", TextBox.Text)
         print("TextBox Success")
         lib:MakeNotification({
            Name = "Successful!",
            Content = "Key Correct, Load script",
            Time = 5
         })
        elseif not success then
            
        lib:MakeNotification({
        Name = "Warning",
        Content = "Invalid Key",
        Image = "rbxassetid://10894994115",
        Time = 5
    })
    end
end
end)
end)
elseif iskey == true then
local key = readfile("AzulHubKey.txt")
if key == game:HttpGet("https://1.kelprepl.repl.co/verify/Azul?verify_key=" .. key) then
    lib:MakeNotification({
            Name = "Successful!",
            Content = "Key Correct, Load script",
            Time = 5
        })
    print("Success")
else
    lib:MakeNotification({
        Name = "Warning",
        Content = "Invalid Key",
        Image = "rbxassetid://10894994115",
        Time = 5
    })
    print("Not Key")
end
end