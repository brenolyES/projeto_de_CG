local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view

  -- Background
  local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
  background:setFillColor(0.96, 0.95, 0.9) 
  sceneGroup:insert(background)

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY
  sceneGroup:insert(fundoImage)
  -- Background

  local talkImage = display.newImageRect(sceneGroup, "imgs/talk.png", 180, 150)
  talkImage.x = 150
  talkImage.y = display.contentCenterY - 950
  sceneGroup:insert(talkImage)

  local caixaTexto = display.newImageRect(sceneGroup, "imgs/caixaTexto2.png", 1000, 600)
  caixaTexto.x = display.contentCenterX
  caixaTexto.y = display.contentCenterY - 800
  sceneGroup:insert(caixaTexto)

  local texto = "Determine os cromossomos autossômicos e os sexuais arrastando para sua devida área."
    local options = {
        text = texto,
        x = display.contentCenterX,
        y = display.contentCenterY - 720,
        width = 950,
        font = native.systemFont,
        fontSize = 49,
        align = "left"
    }
    local textoObj = display.newText(options)
    sceneGroup:insert(textoObj)
  

  -- Botão no canto inferior direito
  local buttonNext = display.newCircle(sceneGroup,  display.actualContentWidth - 150,  display.actualContentHeight - 200, 100)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    textoObj = nil
    composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, 150,  display.actualContentHeight - 200, 100)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page01", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo

end

scene:addEventListener("create", scene)

return scene