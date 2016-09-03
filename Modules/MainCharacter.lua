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
	mainCharacter:walk(0.234,-0.873);

]]--
local mainCharacter = {};

-- private parameters
local speedX = 10.0;
local speedY = 5.0;

-- methods declarations
function mainCharacter:walk(vector)
	print("Character walks in direction "..vector.." ");
end

function mainCharacter:jump()
	print("Character jumps");
end


return mainCharacter;