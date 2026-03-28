-- Keep Track of variables

-- Keep track of variables
-- Example usage:
--[[

local mx, my = love.mouse.getPosition()
Debug:draw({
	{"Mouse X", mx},
	{"Mouse Y", my}
})

]]

local DebugRect = {}

DebugRect.lines = {}

local lineHeight

function DebugRect:load(x, y, width)
	self.x = x
	self.y = y
	self.width = width or love.graphics.getDimensions()

	local font = love.graphics.getFont()
	lineHeight = font:getHeight()
end

function DebugRect:draw(lines)
	assert(type(lines) == "table" and type(lines[1]) == "table")

	local lineY

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("=== DebugRect ===", self.x, self.y + 5)
	for i, line in ipairs(lines) do
		local description, variable = unpack(line)
		lineY = self.y + (lineHeight * i) + 5
		love.graphics.print(description .. ": " .. variable, self.x + 5, lineY)
	end

	love.graphics.rectangle("line", self.x, self.y, self.width, lineY + lineHeight + 5)
end



return DebugRect