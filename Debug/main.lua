local Debug = require "debugRect"

function love.load()
	Debug:load(0, 0)
end

function love.update(dt)
end

function love.draw()
	local mx, my = love.mouse.getPosition()
	Debug:draw({
		{"Mouse X", mx},
		{"Mouse Y", my}
	})
end