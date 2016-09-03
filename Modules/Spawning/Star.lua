--[[

	Star that falls from random position above screen upper edge

	Usage:

	(in GameScene)

	local m_Star = require("Modules.Spawning.Star");

	...

	(spawning timer)
	m_Star.spawn();

]]--
module(..., package.seeall);

function spawn()
	local star = {};

	-- randomize star x position
	star.x = math.random( content.screenLeftEdge, content.ScreenRightEdge );

	return star;
end