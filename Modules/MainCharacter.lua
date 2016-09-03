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
local maxSpeedX = 8.0;
local maxSpeedY = 1.5;

local velocityX = 0.0;

local directionX = 0;
local directionY = 0;

local friction = 0.5;
local acceleration = 0.5;
-- when true, forces character to slowly stop in runtime


-- methods declarations
function mainCharacter:setVectors(vecX, vecY)
	if vecX then
		if(vecX==0) then
			directionX = 0;
		else
			directionX = vecX>0 and math.ceil( vecX ) or math.floor(vecX);
		end
	end
	
	if vecY then
		if(vecY==0) then
			directionY = 0;
		else
			directionY = vecY>0 and math.ceil( vecY ) or math.floor(vecY);
		end
	end

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

	if(directionX==0) then
		if(velocityX==0) then return end; -- return if character doesn't move

		-- slowly stop character
		local velocityDirectionX = velocityX>0 and 1 or -1;
		velocityX = velocityX - friction*velocityDirectionX*deltaTime;
		if(math.abs(velocityX)<1) then velocityX = 0 end
	else
		-- slowly accelerate character
		velocityX = velocityX + acceleration*directionX;
		if(math.abs(velocityX)>maxSpeedX) then velocityX = maxSpeedX*directionX; end
	end
	mainCharacter.x = mainCharacter.x + velocityX*deltaTime;
end
Runtime:addEventListener( "enterFrame", movementController )

return mainCharacter;