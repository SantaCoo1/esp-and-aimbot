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

-- Loop to refresh every 1 second
while wait(1) do
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        removeHighlights(player)
        highlightPlayer(player)
    end

    -- Print "testing" in the console
    print("testing")
end
