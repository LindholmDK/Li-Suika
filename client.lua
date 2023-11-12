local identifier = "lindholm-suika-app"

CreateThread(function ()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-phone"]:AddCustomApp({
            identifier = identifier,
            name = "Suika",
            description = "Suika App",
            developer = "Lindholm",
            defaultApp = false, -- OPTIONAL if set to true, app should be added without having to download it,
            game = true,
            size = 59812, -- OPTIONAL in kb

            ui = GetCurrentResourceName() .. "/ui/dist/index.html", -- built version

            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)

end)
