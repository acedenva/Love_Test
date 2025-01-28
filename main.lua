if pcall(require, "lldebugger") then require("lldebugger").start() end
if pcall(require, "mobdebug") then require("mobdebug").start() end
-- Symbols for the slots
local isSpinning = false

function newRoll(img)
	local rollerCount = 0
	for _ in pairs(ROLLER.symbols) do
		rollerCount = rollerCount + 1
	end
end

function love.load()
	ROLLER = {
		symbols = {
			leo = {
				img = love.graphics.newImage("images/leo.png"),
				y = -200
			},
			mat = {
				img = love.graphics.newImage("images/mat.png"),
				y = 0 
			},
			pat = {
				img = love.graphics.newImage("images/pat.png"),
				y = 200 
			},
			mat2 = {
				img = love.graphics.newImage("images/mat.png"),
				y = 400 
			},
		}
	}
	ROLLER.rollerHeight = 0
	for _, symbol in pairs(ROLLER.symbols) do
		ROLLER.rollerHeight = ROLLER.rollerHeight + symbol.img:getHeight()
	end
	love.graphics.setBackgroundColor(0.5, 0.5, 0.5) -- Gray background
end

function love.update(dt)
	if isSpinning then
		for _, symbol in pairs(ROLLER.symbols) do
			symbol.y = symbol.y + 800 * dt
			if symbol.y > ROLLER.rollerHeight then
				symbol.y = 0
			end
		end
		--	ROLLERX = ROLLERX + 200 * dt
	end

	if love.keyboard.isDown("return") then
		isSpinning = true
	end
	if love.keyboard.isDown("escape") then
	end
end

function love.draw()
	for _, symbol in pairs(ROLLER.symbols) do
		love.graphics.draw(symbol.img, 100, symbol.y)
	end
end
