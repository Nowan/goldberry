--[[

	Flower that grows on planet's surface, can be collected by MainCharacter and presented to Goldberry

	Usage:

	(in Planet.lua)
	
	local m_Flower = require("Modules.Spawning.Flower");

	...

	local flower =  m_Flower.new();
	flower.x = ...;
	flower.y = ...;

]]--
module(...,package.seeall);

function new()
	local flower = {};

	return flower;
end