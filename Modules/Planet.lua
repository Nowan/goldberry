--[[

	Display group for planet objects (ground, flowers, etc.)

]]--
local planet = display.newGroup( );

local ground = display.newCircle( planet, content.centerX, content.height*3.4, planetRadius )

return planet;