local data = {}

function data.save(value)
    love.filesystem.write("save.txt", tostring(value))
end

function data.load()
    if love.filesystem.getInfo('save.txt') then
        local num = love.filesystem.read("save.txt")
        return tonumber(num) or 0
    else
        return 0
    end
end

return data