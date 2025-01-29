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
				y = 0
			},
			mat = {
				img = love.graphics.newImage("images/mat.png"),
				y = 200
			},
			pat = {
				img = love.graphics.newImage("images/pat.png"),
				y = 400
			}
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
			if symbol.y > ROLLER.rollerHeight then
				symbol.y = symbol.y-ROLLER.rollerHeight 
			end
			symbol.y = symbol.y + 1600 * dt
		end
		--	ROLLERX = ROLLERX + 200 * dt
	end

	if love.keyboard.isDown("return") then
		isSpinning = true
	end
	if love.keyboard.isDown("escape") then
	end
end

function drawRoller()
	for _, symbol in pairs(ROLLER.symbols) do
		if symbol.y > 200 then
				love.graphics.draw(symbol.img, 100, symbol.y - ROLLER.rollerHeight)
		end
		love.graphics.draw(symbol.img, 100, symbol.y)
	end
end

function love.draw()
	drawRoller()
end
