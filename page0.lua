local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  
  local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
  background:setFillColor(1, 0, 0) -- definir cor de fundo branco
  
  local buttonBg = display.newRect(sceneGroup, display.contentCenterX, display.contentHeight - 300, 500, 200) -- criar retângulo como plano de fundo
  buttonBg:setFillColor(0, 0, 0) -- definir cor do plano de fundo do botão
  
  local buttonText = display.newText(sceneGroup, "INICIAR", display.contentCenterX, display.contentHeight - 300, native.systemFontBold, 54) -- criar texto do botão
  buttonText:setFillColor(1, 1, 1) -- definir cor do texto do botão
  
  buttonBg:addEventListener("tap", function(event)
    composer.gotoScene("page1")
  end)
end

scene:addEventListener("create", scene)

return scene
