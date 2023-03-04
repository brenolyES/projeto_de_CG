local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  
  local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
  background:setFillColor(0.96, 0.95, 0.9)

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY

  local titleImage = display.newImageRect(sceneGroup, "imgs/title.png", 1100, 1500)
  titleImage.x = display.contentCenterX
  titleImage.y = display.contentCenterY
  
  local buttonBg = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentHeight - 300, 500, 180, 62)
  buttonBg:setFillColor(0.84, 0.72, 0.5) 
  
  local buttonText = display.newText(sceneGroup, "INICIAR", display.contentCenterX, display.contentHeight - 300, native.systemFontBold, 80)
  buttonText:setFillColor(1, 1, 1)
  
  buttonBg:addEventListener("tap", function(event)
    composer.gotoScene("pages.page1", { effect = "flip", time = 100, direction="left" })
  end)
end

scene:addEventListener("create", scene)

return scene
