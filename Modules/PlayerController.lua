--[[

	Module that listens to screen touch event, and recognises input gestures - 
	swipe up/down, swipe left/right, tap, double tap - and calls appropriate funtions in Player object


	Parameters:
	[bool] PlayerController.isActive - returns whether controller is active or not


	Methods:
	PlayerController:setActive([bool]) - enables or disables controller listening to user touch


	Usage: 

	1. (in scene)
	local mainCharacter = require("Modules.MainCharacter");
	local playerController = require("Modules.PlayerController");
	playerController:init(mainCharacter);
	playerController:setActive(true);

]]--
local playerController = {};

-- public parameters
playerController.isActive = false;

-- private parameters
local mainCharacter = nil; -- MainCharacter object

-- pre-declaration of gesture functions
local onSwipeUp = nil;
local onSwipeDown = nil;
local onSwipeLeft = nil;
local onSwipeRight = nil;
local onSingleTap = nil;

-- pre-declaration of touch listener function
local touchListener = nil;

-- methods
function playerController:init(character)

end

function playerController:setActive(flag)
	-- don't add event listener if state hasn't changed
	if(flag==playerController.isActive) then return end

	if(flag) then
		display.getCurrentStage():addEventListener( "touch", touchListener );
	else
		display.getCurrentStage():removeEventListener( "touch", touchListener );
	end
end

-- initialization of touch listener
touchListener = function(event)
	if(event.phase=="began") then
		
	elseif(event.phase=="moved") then
		
	elseif(event.phase=="ended" or event.phase=="cancelled") then
		
	end
end

onSwipeUp = function()

end

onSwipeDown = function()
	
end

onSwipeLeft = function()
	
end

onSwipeRight = function()
	
end

onSingleTap = function()
	
end

return playerController;