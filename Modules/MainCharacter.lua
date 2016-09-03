--[[

	MainCharacter module. Contains character sprite and methods to control its movements

	Methods:

	MainCharacter:walk(vectorX, vectorY) - move character in direction provided by vectors
	this function is continuous - must be called every frame in order to last longer
	vectorX and vectorY values are floats between -1 and 1. Sign meaning:
	vectorX = -1 - left; 1 - right; 0 - doesn't change position on x coordinate 
	vectorY = -1 - up; 1 - down; 0 - doesn't change position on Y coordinate 

	MainCharacter:jump()
	
	Usage:

	To move character: (in runtime or any other continuous function):
	mainCharacter:setVectors(0.234,-0.873);

]]--
local mainCharacter = display.newImage("Textures/boy.png");
mainCharacter.x = content.screenRightEdge-200;
mainCharacter.y = content.height - 200;

-- private parameters
local speedX = 3.0;
local speedY = 1.5;

local vectorX = 0;
local vectorY = 0;

local friction = 5.0;

-- methods declarations
function mainCharacter:setVectors(vecX, vecY)
	vectorX = vecX and vecX or 0;
	vectorY = vecY and vecY or 0;
end

function mainCharacter:jump()
	print("Character jumps");
end

-- controlling character movements

local runtime = 0
 
local function getDeltaTime()
    local temp = system.getTimer()  -- Get current game time in ms
    local dt = (temp-runtime) / (1000/60)  -- 60 fps or 30 fps as base
    runtime = temp  -- Store game time
    return dt
end

local function movementController(event)
	local deltaTime = getDeltaTime();
	mainCharacter.x = mainCharacter.x + speedX*vectorX*deltaTime;

	-- slowly decrease vectorX to stop character
	local decrement = (friction/100)*deltaTime;
	vectorX = vectorX >= 0 and math.max(vectorX-decrement,0) or math.min(vectorX+decrement,0);
end
Runtime:addEventListener( "enterFrame", movementController )

return mainCharacter;