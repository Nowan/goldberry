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

    mainCharacter = require("Modules.MainCharacter");
    characterController = require("Modules.CharacterController");
    planet = require("Modules.Planet")
    characterController:init(mainCharacter);
    characterController:setActive(true);
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