local composer = require("composer")
local images= {}

local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY

  images.titleImage = display.newImage( "imgs/title.png" )
  images.titleImage.x = display.contentCenterX
  images.titleImage.y = display.contentCenterY - 70
  images.titleImage:scale( 1.6, 1.6 )
  sceneGroup:insert( images.titleImage )
  
  local buttonBg = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentHeight - 70, 300, 80, 30)
  buttonBg:setFillColor(0.84, 0.72, 0.5) 
  
  local buttonText = display.newText(sceneGroup, "INICIAR", display.contentCenterX, display.contentHeight - 70, native.systemFontBold, 40)
  buttonText:setFillColor(1, 1, 1)
  
  buttonBg:addEventListener("tap", function(event)
    composer.removeScene("pages.page00")
    composer.gotoScene("pages.page01", { effect = "flip", time = 100, direction="left" })
  end)
end

scene:addEventListener("create", scene)

return scene
