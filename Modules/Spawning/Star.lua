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
star = {}

function spawn()
	local timeSpawn = math.random( fromTime,toTime)
	local seconds = 0
	local tableStar ={}

	local function Time()
		seconds = seconds - 1
		local second = seconds % timeSpawn
		if second == 0 then 
			local spawnStar = display.newImage( "Textures/star_pointer_box.png" )
			spawnStar.height = 50
			spawnStar.width = 50
			spawnStar.x = math.random( 0, content.centerX - 100);
			tableStar[#tableStar+1] = spawnStar
			timeSpawn = math.random( fromTime,toTime)
			statusStar = 1
			print( statusStar.." statusStar star" )
			transition.to(tableStar[#tableStar], { time=700, x=math.random(content.centerX,content.width), y=math.random(100, content.centerY-50), onComplete=fadeOut} )
		end
	end
	
	local countDownTimer = timer.performWithDelay( 1000, Time, seconds )

	function fadeOut()
		transition.fadeOut( tableStar[#tableStar], {time = 100} )
		--statusStar = 0
		tableStar[#tableStar]:removeSelf( )
	end
end

star.spawn = spawn()
return star