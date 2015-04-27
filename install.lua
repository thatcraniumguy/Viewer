-- Viewer installer/updater
-- Connects to GitHub to retrieve the latest version available
version = 0.01

-- Clear log files
if fs.exists("/logs/viewerUpdater.log") then
    fs.delete ("/logs/viewerUpdater.log")
end

-- Debug tool
local function logfile(input)
    local file = fs.open("/logs/viewerUpdater.log", "a")
    file.write(input)
    file.close()
end

-- Installer code
local filenames = {
    gui
    main.lua
    install.lua
    }

if not http then
    logfile("HTTP API not enabled! Please enable the HTTP API in the ComputerCraft config file, or ask your server administrator to do so.")
    print("HTTP API not enabled! Please enable the HTTP API in\nthe ComputerCraft config file, or ask your server/nadministrator to do so.")
    return
else
    for i,filename in pairs(files) do
        local file = fs.open(filename, "w")
        local site = http.get("https://raw.githubusercontent.com/thatcraniumguy/Viewer/master/"..filename[i])
        local content = site.readAll()
        if not content then 
            logfile("No response from GitHub. Please check the ComputerCraft config and ensure that the GitHub url has been whitelisted.")
            print("No response from GitHub. Please check the\nComputerCraft config and ensure that the GitHub url\nhas been whitelisted.")
            return
        else
            logfile("Retrieved file from https://raw.githubusercontent.com/thatcraniumguy/Viewer/master/"..filename[i])
            file.write(content)
            file.close()
            logfile("File saved at "..filename)
        end
    end
end