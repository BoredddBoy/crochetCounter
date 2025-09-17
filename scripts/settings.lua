local colors = require'scripts.colors'

local wW, wH = love.graphics.getDimensions()

local settings = {
    {
        x = wW/2 + wW/2.5 - 16, y = wH/2 + wH/2.7 - 16,
        asset = love.graphics.newImage('assets/settings.png'),
        onClick = nil,
        hover = false
    }
}

local color = {1,1,1}

function settings.update(dt)
    local mX, mY = love.mouse.getPosition()
    for _, button in ipairs(settings) do 
        if mX > button.x and mX < button.x + 64 and mY > button.y and mY < button.y + 64 then
            color = {1,1,1}
        else
            color = {90/100,90/100,90/100}
        end
    end
end

function settings.draw()
    love.graphics.setColor(color)
    love.graphics.draw(settings[1].asset, settings[1].x, settings[1].y, 0, 2)
end

return settings