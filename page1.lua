local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  
  local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
  background:setFillColor(0, 1, 0) -- definir cor de fundo branco
  
  local button = display.newText(sceneGroup, "VOLTAR", display.contentCenterX, display.contentHeight - 50, native.systemFont, 20)
  button:setFillColor(0, 0, 0) -- definir cor do texto do botão
  
  button:addEventListener("tap", function(event)
    composer.gotoScene("page0")
  end)
end

scene:addEventListener("create", scene)

return scene