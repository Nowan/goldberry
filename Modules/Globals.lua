--[[

	Module that initializes all values with global visibility

]]--
planetRadius = 2000;
content = {};
content.width = display.contentWidth; -- width of content letterbox
content.height = display.contentHeight; -- height of content letterbox
content.centerX = display.contentCenterX;
content.centerY = display.contentCenterY;
content.screenWidth = display.pixelHeight*(content.height/display.pixelWidth); -- actual screen width
content.screenLeftEdge = content.centerX - content.screenWidth/2; -- x coordinate of screen left edge in relation to content letterbox
content.screenRightEdge = content.width + math.abs(content.screenLeftEdge); -- x coordinate of screen right edge in relation to content letterbox
fromTime = 5 -- secons from 5 (star)
toTime = 15 -- secons to 15 (star)