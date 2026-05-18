local gameMode = false

local function toggleGameMode()
    gameMode = not gameMode

    if gameMode then
        hl.config({
            general = {
                gaps_in     = 0,
                gaps_out    = 0,
                border_size = 0,
            },
            decoration = {
                rounding       = 0,
                rounding_power = 0,
                shadow         = { enabled = false },
                blur           = { enabled = false },
            },
        })
        hl.exec_cmd("killall " .. statusbar)
    else
        hl.config({
            general = {
                gaps_in     = 5,
                gaps_out    = 16,
                border_size = 0,
            },
            decoration = {
                rounding       = 10,
                rounding_power = 5,
                shadow         = { enabled = true, range = 9, render_power = 9, color = 0xee1a1a1a },
                blur           = { enabled = true, size = 3, passes = 6, vibrancy = 0.1696 },
            },
        })
        hl.exec_cmd(statusbar)
    end
end

hl.bind(mainMod .. " + F5", toggleGameMode)
