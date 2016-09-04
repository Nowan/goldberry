--[[

	Fire-haired girl AI module. She reacts on player actions accordingly to her mood, which is, well... unpredictable

]]--
local goldberry = display.newImage( "Textures/girl.png",0,0 )
goldberry.x = content.screenLeftEdge+200;
goldberry.y = content.height - 200;
goldberry.xScale = 0.8
goldberry.yScale = 0.8
goldberry.busy = false;
local distance = 0;

goldberry.linkToCharacter = nil;
--goldberry:toFront()
--print("BABA")

heartGirl = display.newImage("Textures/heart.png");
heartGirl.xScale = 2.0
heartGirl.yScale = 2.0
heartGirl.x = goldberry.x
heartGirl.y = goldberry.y - 150
heartGirl:setFillColor(girlProgress/100, 0, 1-(girlProgress/100) )

goldberry.presents = display.newGroup( );

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


return goldberry;