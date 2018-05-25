-----------------------------------------------------------------------------------------
--
-- gameScene.lua
--
-- Created By: Fawaz Mezher
-- Created On: May 2018
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local physics = require( "physics" )

local scene = composer.newScene()

-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    physics.start()
	physics.setGravity( 0, 25 )
	physics.setDrawMode( "default" )

 
end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then

        local theGround = display.newImage( "./assets/sprites/land.png" )
		theGround.x = display.contentCenterX - 600
		theGround.y = display.contentHeight
		theGround.id = "the ground"
		physics.addBody( theGround, 'static', {
	    	friction = 0.5, 
	    	bounce = 0.3 
	    	} )
		sceneGroup:insert( theGround )
	
		local theGround2 = display.newImage( "./assets/sprites/land.png" )
		theGround2.x = 1450
		theGround2.y = display.contentHeight
		theGround2.id = "the ground"
		physics.addBody( theGround2, 'static', {
		    friction = 0.5, 
		    bounce = 0.3 
		    } )
		sceneGroup:insert( theGround2 )

	 local ninjaGirl = display.newImage( "./assets/sprites/ninjaGirl.png" )
	 ninjaGirl.x = 1000
	 ninjaGirl.y = 200
	 ninjaGirl.id = "ninjaGirl"
	 physics.addBody( ninjaGirl, "dynamic", {
	 	friction = 0.5,
	 	density = 3.0, 
	 	bounce = 0.3
	 	} )
	 sceneGroup:insert( ninjaGirl )
	 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene