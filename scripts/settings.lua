local colors = require'scripts.colors'

local wW, wH = love.graphics.getDimensions()

local settings = {
    {
        x = wW/2 + wW/2.5 - 16, y = wH/2 + wH/2.7 - 16,
        asset = love.graphics.newImage('assets/settings.png'),
        color = {1,1,1},
        onClick = nil,
        hover = false
    }
}

function settings.draw()
    love.graphics.setColor(settings.color)
    love.graphics.draw(settings[1].asset, settings[1].x, settings[1].y, 0, 2)
end

return settings