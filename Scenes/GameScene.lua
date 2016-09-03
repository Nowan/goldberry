--[[

	Game scene, a control point of all implemented modules

]]--
local composer = require( "composer" );
local scene = composer.newScene();

-- modules pre-declaration
local mainCharacter = nil;
local characterController = nil;
function scene:create( event )
    local sceneGroup = self.view;
    local bg = display.newImage("Textures/background.png",content.centerX,content.centerY)
    bg.width =content.screenWidth
    bg.height = content.height
    mainCharacter = require("Modules.MainCharacter");
    goldberry = require("Modules.Goldberry");
    characterController = require("Modules.CharacterController");
    planet = require("Modules.Planet")
    characterController:init(mainCharacter);
    characterController:setActive(true);
    mod_star = require("Modules.Spawning.Star")
    local star = mod_star.spawn
end



function scene:show( event )
    local sceneGroup = self.view;
    local phase = event.phase;

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
        
    end
end


function scene:hide( event )
    local sceneGroup = self.view;
    local phase = event.phase;

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end



function scene:destroy( event )
    local sceneGroup = self.view;

end

-- Scene isteners
scene:addEventListener( "create", scene );
scene:addEventListener( "show", scene );
scene:addEventListener( "hide", scene );
scene:addEventListener( "destroy", scene );

return scene