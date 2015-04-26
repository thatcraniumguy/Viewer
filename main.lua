-- Viewer
-- A comprehensive peripheral visualizer for Minecraft

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