--[[

	Module that initializes all values with global visibility

]]--

girlProgress = 0;
guyProgress = 100
mainCharacter = {}
rotateGroup = {}
planetRadius = 2000;
statusStar = 0

--test of color change
--[[local function test()
	girlProgress = girlProgress+0.1
	guyProgress = guyProgress - 0.1
end
Runtime:addEventListener( "enterFrame", test )]]

content = {};
content.width = display.contentWidth; -- width of content letterbox
content.height = display.contentHeight; -- height of content letterbox
content.centerX = display.contentCenterX;
content.centerY = display.contentCenterY;
content.screenWidth = display.pixelHeight*(content.height/display.pixelWidth); -- actual screen width
content.screenLeftEdge = content.centerX - content.screenWidth/2; -- x coordinate of screen left edge in relation to content letterbox
content.screenRightEdge = content.width + math.abs(content.screenLeftEdge); -- x coordinate of screen right edge in relation to content letterbox

rotateGroup = {}
planetRadius = 2000;
planetCenterX = content.centerX;
planetCenterY = content.height+planetRadius-200;

fromTime = 5 -- secons from 5 (star)
toTime = 15 -- secons to 15 (star)

-- enum of all objects that could be picked and presented to the girl
PickableObject = {
	Flower = 0,
	Star = 1
};