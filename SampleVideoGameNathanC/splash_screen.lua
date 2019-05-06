-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local logo
local scrollXSpeed = 7
local scrollYSpeed = -3
local scrollXSpeed2 = -8
local scrollYSpeed2 = -8

---------------------------------------------------------------------------------------
--Audio Creation
---------------------------------------------------------------------------------------------------
local soundef = audio.loadSound("Sounds/sound8.mp3")
local soundefChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function moveLogo()
    logo.x = logo.x + scrollXSpeed
    logo.y = logo.y + scrollYSpeed
    -- change transparencey of logo
    logo.alpha = logo.alpha - 0.004
    -- rotate logo
    logo.rotation = logo.rotation + 4
end 

local function moveLogo2()
    logo3.x = logo3.x + scrollXSpeed2
    logo3.y = logo3.y + scrollYSpeed2
    -- change transparencey of logo
    logo3.alpha = logo3.alpha - 0.004
    -- rotate logo
    logo3.rotation = logo3.rotation + 4
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0.4, 0.7, 0.5)

    -- Insert the company logo image
    logo = display.newImageRect("Images/CompanyLogoNathanC@2x.png", 300, 300)
    logo.x = 100
    logo.y = 700
    logo2 = display.newImageRect("Images/CompanyLogoNathanC@2x.png", 300, 300)
    logo2.x = 500
    logo2.y = 500
    logo3 = display.newImageRect("Images/CompanyLogoNathanC@2x.png", 300, 300)
    logo3.x = 1030
    logo3.y = 700

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )
    sceneGroup:insert( logo2 )
    sceneGroup:insert( logo3 )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        soundefChannel = audio.play(soundef)

        -- Call the moveLogo function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveLogo)
        Runtime:addEventListener("enterFrame", moveLogo2)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
