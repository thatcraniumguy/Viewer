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
        
    end
end