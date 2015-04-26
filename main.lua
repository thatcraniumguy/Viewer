-- Viewer
-- A comprehensive peripheral visualizer for Minecraft
version = 0.01

-- Load bundled APIs
os.loadAPI("gui")

-- Clear log files
if fs.exists("viewer.log") then
    fs.delete ("viewer.log")
end

-- Debug tool
local function logFile(input)
    local file = fs.open("viewer.log", "a")
    file.write(input)
    file.close()
end

function getSettings()
    -- Retrieve settings from saved file, or if none exists, create settings from default list
    local defaultSettings = {
        
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

function getList()
    pList = {}
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

settings = getSettings()
gui.drawScreen()

-------------------------------------------------------------------
local function printPeripheralTable()
    local file = fs.open("dump", "w")
    file.write(textutils.serialize(pList))
    file.close()
    print("Peripheral list dumped!")
end
getList()
printPeripheralTable()