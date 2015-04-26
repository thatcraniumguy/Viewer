-- Viewer GUI API
-- Used for drawing the GUI

console = term

local function redirect()
    --Function for redirecting the screen to a specific monitor
end

function clearScreen(target)
    target.setBackgroundColor(colors.black)
    target.clear()
end