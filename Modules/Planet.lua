--[[

	Display group for planet objects (ground, flowers, etc.)

]]--



local planet = display.newGroup( );
local speed = 1
local ground = display.newImage("Textures/planet.png", planetCenterX, planetCenterY, planetRadius )
ground.rotation = 0
--local rotateGroup = {}

local m_Flower = require("Modules.Spawning.Flower");

for i=1,40 do
local flower =  m_Flower.new();
	--flower:setFillColor( 1,0,0 )
	flower.startPos = math.random(1,360)
	rotateGroup[#rotateGroup+1] = flower
end

--rotateGroup[#rotateGroup+1] = ground
local function rotateAll()
	for i=1, #rotateGroup  do
		repeat
		if not rotateGroup[i] then break end
		radius = math.sqrt((rotateGroup[i].x - ground.x)*(rotateGroup[i].x - ground.x) + (rotateGroup[i].y - ground.y)*(rotateGroup[i].y - ground.y))
		rotateGroup[i].x = -radius * (math.cos(math.rad(rotateGroup[i].startPos)))/1 +ground.x
		rotateGroup[i].y = -radius * (math.sin(math.rad(rotateGroup[i].startPos)))/1 +ground.y
		rotateGroup[i].startPos = rotateGroup[i].startPos + 0.03
		until true;
	end
	ground.rotation = ground.rotation + 0.03
end
Runtime:addEventListener( "enterFrame", rotateAll )
 --rotateAll()
return planet;