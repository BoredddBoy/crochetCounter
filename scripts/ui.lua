local font = love.graphics.newFont("assets/font.ttf", 220)

local colors = require'scripts.colors'
local counter = require'scripts.counter'
local settings = require'scripts.settings'

local ui = {}

local wW, wH = love.graphics.getDimensions()

local buttons = {
    {
        x = wW/2 - 300/2, y = wH/2 - 400/2 - 35, width = 300, height = 400, shadowX = wW/2 - 300/2 + 8, shadowY = wH/2 - 400/2 - 35 + 8,
        roundness = 24,
        text = counter.number, textLimit = 300, textSize = 1, textX = wW/2 - 150, textY = wH/2 - 215,
        onClick = counter.plus,
        hover = false
    },
    {
        x = wW/2 - 150, y = wH/2 - 50/2 + 205, width = 300, height = 50, shadowX = wW/2 - 150 + 6, shadowY = wH/2 - 50/2 + 205 + 6,
        roundness = 12,
        text = "-1", textLimit = 200, textSize = 0.24, textX = wW/2 - 25, textY = wH/2 + 173,
        onClick = counter.minus,
        hover = false
    }
}

function ui.load()

end

function ui.update(dt)
    if counter.number >= 100 then
        buttons[1].textSize = 0.75
        buttons[1].textLimit = 400
    else
        buttons[1].textSize = 1
        buttons[1].textLimit = 300
    end

    buttons[1].text = tostring(counter.number)

    local mX, mY = love.mouse.getPosition()
    for _, button in ipairs(buttons) do 
        if mX > button.x and mX < button.x + button.width and mY > button.y and mY < button.y + button.height then
            button.hover = true
        else
            button.hover = false
        end
    end

    settings.update()
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        for _, button in ipairs(buttons) do
            if button.hover then
                button.onClick()
            end
        end
    end
end

function ui.draw()
    
    local background_color = colors.green                               --Change the color here--
    local button_color = colors.light_green
    local shadow_color = colors.gray


    
    
    love.graphics.setColor(background_color)
    love.graphics.rectangle('fill', 0, 0, wW, wH)



    for _, button in ipairs(buttons) do
        love.graphics.setColor(shadow_color)
        love.graphics.rectangle('fill', button.shadowX, button.shadowY, button.width, button.height, button.roundness)
        love.graphics.setColor(button_color)
        love.graphics.rectangle('fill', button.x, button.y, button.width, button.height, button.roundness)
        

        love.graphics.setFont(font)
        love.graphics.setColor(colors.white)
        love.graphics.printf(button.text, button.textX, button.textY, button.textLimit, 'center', 0, button.textSize)
    end

    settings.draw()

end

return ui