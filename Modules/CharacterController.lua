--[[

	Module that listens to screen touch event, and recognises input gestures - 
	swipe up/down, swipe left/right, tap, double tap - and calls appropriate funtions in Player object


	Parameters:
	[bool] CharacterController.isActive - returns whether controller is active or not


	Methods:
	CharacterController:setActive([bool]) - enables or disables controller listening to user touch


	Usage: 

	1. (in scene)
	local mainCharacter = require("Modules.MainCharacter");
	local characterController = require("Modules.CharacterController");
	characterController:init(mainCharacter);
	characterController:setActive(true);

]]--
local characterController = {};
-- public parameters
characterController.isActive = false;

-- private parameters
local character = nil; -- MainCharacter object

-- pre-declaration of gesture functions
local onSwipe = nil;
local onSingleTap = nil;

-- pre-declaration of touch listener function
local touchListener = nil;

-- var declarations:

	local dx; -- delta x
	local dy; -- delta y
	local startX; -- touch start X
	local startY; -- touch start Y
	local direction; -- swipe direction
	local vector; -- swipe "power"
	local vectorPower = content.screenWidth/4; -- vector max value
	--local


-- methods
function characterController:init(targetCharacter)
	character = targetCharacter;
end

function characterController:setActive(flag)
	-- don't add event listener if state hasn't changed
	if(flag==characterController.isActive) then return end

	if(flag) then
		display.getCurrentStage():addEventListener( "touch", touchListener );
	else
		display.getCurrentStage():removeEventListener( "touch", touchListener );
	end
end
-- looking for vector

function checkVector(direction, delta)
	if direction == "x" then
		print("x direction")
		vector = ((vectorPower)/100 * delta)/1000
		if math.abs(vector) > 1 then
			if vector < 0 then
				vector = -1
			end
			if vector > 0 then
				vector = 1
			end
		end
		print(vector)
	end
end
-- initialization of touch listener
touchListener = function(event)

	if(event.phase=="began") then
		--print("touchBegan")
		startX = event.x;
		startY = event.y;
		dx = 0;
		dy = 0;

	elseif(event.phase=="moved") then
		--print("touchMoved")
		dx = event.x - startX;
		dy = event.y - startY;
		--onSwipe(event);


		if dx == 0 and dy == 0 then
			print("tap")
		elseif math.abs(dx) > math.abs(dy) then
			direction = "x"
			if dx > 1 then
				print("right")
			elseif dx < - 1 then
				print("left")
			else
				print("tap")
			end
			if math.abs(dx) > 1 then
				checkVector(direction,dx)
			end
		elseif math.abs(dx) < math.abs(dy) then
			--direction = "y"
			if dy > 1 then
				print("bot")
			elseif dy < - 1 then
				print("top")
			else
				print("tap")
			end
			--if math.abs(dy) > 40 then
			--	checkVector(direction,dx)
			--end
		end

	elseif(event.phase=="ended" or event.phase=="cancelled") then
		--print("touchEnded")


	end
end

onSwipe = function(event)
	character:walk(event.x,event.y);
end

onSingleTap = function()
	--print("onSingleTap")
end

return characterController;