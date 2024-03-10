local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

-- Define the color for highlighting
local highlightColor = Color3.new(1, 0, 0) -- Red color

-- Function to highlight a player
local function highlightPlayer(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                local highlight = Instance.new("SelectionBox")
                highlight.Adornee = part
                highlight.Color3 = highlightColor
                highlight.LineThickness = 0.05
                highlight.Parent = part
            end
        end
    end
end

-- Function to remove highlights from a player
local function removeHighlights(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("SelectionBox") then
                part:Destroy()
            end
        end
    end
end

-- Function to make parts transparent
local function makeTransparent(part)
    part.Transparency = 0.5  -- Set the transparency to 0.5 (adjust as needed)
end

-- Main loop
while true do
    for _, player in pairs(game.Players:GetPlayers()) do
        removeHighlights(player)
        highlightPlayer(player)
    end

    local origin = camera.CFrame.Position
    local direction = camera.CFrame.LookVector * 100 -- Adjust the distance as needed

    -- Raycast to detect walls
    local result = game.Workspace:Raycast(origin, direction, {player.Character, game.Workspace.Terrain})

    -- If the ray hits a wall, make it transparent
    if result then
        local hitPart = result.Instance
        if hitPart and hitPart:IsA("BasePart") then
            makeTransparent(hitPart)
        end
    end

    print("working")  -- Print "working" every refresh

    wait(1)  -- Refresh every 1 seconds
end
