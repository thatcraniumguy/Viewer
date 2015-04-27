-- Viewer
-- A comprehensive peripheral visualizer for Minecraft
version = 0.01

-- Load bundled APIs
os.loadAPI("gui")

-- Clear log files
if not fs.exists("/logs") then
    fs.mkdir("/logs")
else
    if fs.exists("/logs/viewer.log") then
        fs.delete ("/logs/viewer.log")
    end
end

-- Debug tool
local function logfile(input)
    local file = fs.open("/logs/viewer.log", "a")
    file.write(input)
    file.close()
end

function getSettings()
    -- Retrieve settings from saved file, or if none exists, create settings from default list
    local defaultSettings = {
        safeShutdown = false
        }
    if not fs.exists("viewer.cfg") then
        logfile("Main settings not found!")
        local file = fs.open("viewer.cfg", "w")
        file.write(texutils.serialize(defaultSettings))
        file.close()
        logfile("Using default settings")
    else
        logfile("Main settings found!")
        local file = fs.open("viewer.cfg", "r")
        local content = file.read()
        settings = textutils.serialize(content)
        logfile("Main settings loaded")
    end
end

function getList()
    pList = {}
    for num,pName in ipairs(peripheral.getNames()) do
        logfile(num.." available peripherals found:")
        local p = peripheral.wrap(pName)
        logfile(pName)
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