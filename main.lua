local ui = require'scripts.ui'
local data = require'scripts.data'
local counter = require'scripts.counter'

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then 
        counter.plus()
    end
end

function love.load()
    counter.load()
end

function love.update(dt)
    ui.update(dt)
end

function love.draw()
    ui.draw()
end

