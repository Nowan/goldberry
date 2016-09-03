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

-- initialization of touch listener
touchListener = function(event)
	if(event.phase=="began") then

	elseif(event.phase=="moved") then
		onSwipe(event);
	elseif(event.phase=="ended" or event.phase=="cancelled") then
		
	end
end

onSwipe = function(event)
	character:walk(event.x,event.y);
end

onSingleTap = function()
	
end

return characterController;