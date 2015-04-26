-- Viewer
-- A comprehensive peripheral visualizer for Minecraft
version = 0.01

function getSettings()
    -- Retrieve settings from saved file, or if none exists, create settings from default list
    local defaultSettings = {
        menuBarColor = colors.red,
        menuTextColor = colors.blue,
        menuLocation = "top"
        backgroundColor = colors.black,
        textColor = colors.white
        }
    if not fs.exists("viewer.cfg") then
        local file = fs.open("viewer.cfg", "w")
        file.write(texutils.serialize(defaultSettings))
        file.close()
    else
        local file = fs.open("viewer.cfg", "r")
        local content = file.read()
        settings = textutils.unserialize(content)
    end
end

settings = getSettings()

local pList = {}
function getList()
    for num,pName in ipairs(peripheral.getNames()) do
        local p = peripheral.wrap(pName)
        pList[num] = {
            name = pName,
            label = peripheral.getType(pName),
            methods = p.listMethods(),
            fluids = p.getTankInfo(),
            inventory = {
                name = p.getInventoryName(),
                max = p.getInventorySize(),
                stored = p.getAllStacks()
                },
            energy = {
                max = p.getMaxEnergyStored(),
                stored = p.getEnergyStored()
                }
            }
    end
end
local function printPeripheralTable()
    local file = fs.open("dump", "w")
    file.write(textutils.serialize(pList))
    file.close()
    print("Peripheral list dumped!")
end
getList()
printPeripheralTable()