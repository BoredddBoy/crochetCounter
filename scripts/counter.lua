local data = require'scripts.data'

local counter = {
    number = 0,
}

function counter.load()
    counter.number = data.load()
end

function counter.minus()
    if counter.number > 0 then
        counter.number = counter.number - 1
    end
    data.save(counter.number)
end

function counter.plus()
    counter.number = counter.number + 1
    data.save(counter.number)
end

return counter