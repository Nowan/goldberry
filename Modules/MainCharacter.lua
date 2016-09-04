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
local startAngle = math.rad(30);
local surfaceRadius = planetRadius+45;
--mainCharacter.y = planetCenterY-surfaceRadius*math.cos(startAngle);
mainCharacter.x = content.screenRightEdge-200;
mainCharacter.y = content.height - 200;
mainCharacter.xScale = 0.8
mainCharacter.yScale = 0.8

heartBoy = display.newImage("Textures/heart.png");
heartBoy.xScale = 1.2
heartBoy.yScale = 1.2
heartBoy.x = mainCharacter.x
heartBoy.y = mainCharacter.y + 30
heartBoy.rotation = -45
heartBoy:setFillColor(guyProgress/100, 0, math.abs(guyProgress/100)-1 )

-- private parameters
local maxSpeedX = 12.0;
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
	local stepDistance = velocityX*deltaTime;

	local currentAngle = 180+math.acos((planetCenterX-mainCharacter.x)/planetRadius)*180/math.pi;
	local currentArc = math.pi*planetRadius*currentAngle/180;
	local targetArc = currentArc+stepDistance;
	local targetAngle = (targetArc*180)/(math.pi*planetRadius);

	mainCharacter.x = planetCenterX + surfaceRadius * math.cos(math.rad(targetAngle));
	mainCharacter.y = planetCenterY + surfaceRadius * math.sin(math.rad(targetAngle));
	heartBoy.x = mainCharacter.x
	heartBoy.y = mainCharacter.y+30
	coordinatesX = mainCharacter.x
	coordinatesY = mainCharacter.y
end
Runtime:addEventListener( "enterFrame", movementController )

return mainCharacter;