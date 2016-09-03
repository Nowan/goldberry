--[[

	Fire-haired girl AI module. She reacts on player actions accordingly to her mood, which is, well... unpredictable

]]--
local goldberry = display.newImage( "Textures/girl.png",0,0 )
goldberry.x = content.screenLeftEdge+200;
goldberry.y = content.height - 200;
goldberry.busy = false;
local distance = 0;
--goldberry:toFront()
--print("BABA")

local function makeFree()
	goldberry.busy = false;
	print("free")
end
local function makeBusy()
	goldberry.busy = true;
	print("busy")
end
local function runBack()
	transition.to(goldberry,{time = 500, x = goldberry.x - 150})
end

local function runForward()
	transition.to(goldberry,{time = 500, x = goldberry.x + 150})
end
local function hit()
	transition.to(goldberry,{time = 500, x = goldberry.x + 50})
	guyProgress = guyProgress - 10
end
local function jump()

end
local function cancelAll()
	transition.cancel(goldberry)
end
local function turnAround()

end
local function goldberryAI()
	--[[
	distance =  math.sqrt((goldberry.x - mainCharacter.x)*(goldberry.x -mainCharacter.x) + (goldberry.y - mainCharacter.y)*(goldberry.y - mainCharacter.y))
	--print("hg")
	if  goldberry.busy == false and distance < 200 then
		--print("opaopa")
		makeBusy()
		timer.performWithDelay( 2000, makeFree )
		local r = math.random(1,3)
		if r == 1 then
			if goldberry.x > 50 then 
				runBack()
			end
		elseif r == 2 then
			runForward()
		elseif r == 3 then
			hit()
		end

	end
	]]--
end

Runtime:addEventListener( "enterFrame", goldberryAI )

return goldberry;