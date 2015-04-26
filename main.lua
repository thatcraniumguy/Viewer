-- Viewer
-- A comprehensive peripheral visualizer for Minecraft

local pList = {}
function getList()
    for _,name in pairs(peripheral.getNames()) do
        local p = peripheral.wrap(name)
        pList.name = name
        pList.name.type = p.getType()
    end
end

function populateList(list)
    for i,v in pairs(list) do
        --[[peripherals = {
            {
                name = peripheral.getNames()
                type = peripheral.getType()
                inventory = {
                    name = getInventoryName()
                    max = getInventorySize()
                    stored = getAllStacks()
                }
                energy = {
                    max = getMaxEnergyStored()
                    stored = getEnergyStored()
                methods = getAdvancedMethodsData()
                }
            }
        }]]
    end
end