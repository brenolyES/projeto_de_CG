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
  
  local assunto2Image = display.newImageRect(sceneGroup, "imgs/assunto2.png", 1000, 700)
  assunto2Image.x = display.contentCenterX
  assunto2Image.y = display.contentCenterY - 600
  sceneGroup:insert(assunto2Image)
  
  local talkImage = display.newImageRect(sceneGroup, "imgs/talk.png", 180, 150)
  talkImage.x = 150
  talkImage.y = display.contentCenterY
  sceneGroup:insert(talkImage)

  local caixaTexto = display.newImageRect(sceneGroup, "imgs/caixaTexto.png", 1000, 950)
  caixaTexto.x = display.contentCenterX
  caixaTexto.y = display.contentCenterY + 400
  sceneGroup:insert(caixaTexto)

  local texto = "A maioria das pessoas nasce com uma combinação de cromossomos XX (feminino) ou XY (masculino). A presença de um cromossomo X adicional é o que determina o sexo feminino, enquanto a presença de um cromossomo Y é o que determina o sexo masculino. A forma como estes cromossomos se combinam e interagem com os outros cromossomos autossômicos é o que regula o desenvolvimento dos órgãos sexuais, as características secundárias, etc."
  local options = {
      text = texto,
      x = display.contentCenterX,
      y = display.contentCenterY + 520,
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
    composer.gotoScene("pages.page00", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, 150,  display.actualContentHeight - 200, 100)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page02", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo

end

scene:addEventListener("create", scene)

return scene