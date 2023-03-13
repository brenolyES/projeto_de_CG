local composer = require("composer")
local scene = composer.newScene()
local images= {}

function scene:create(event)
  local sceneGroup = self.view

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY
  sceneGroup:insert(fundoImage)

  images.assunto1Image = display.newImage( "imgs/assunto4.png" )
  images.assunto1Image.x = display.contentCenterX
  images.assunto1Image.y = 50
  images.assunto1Image:scale( 1.9, 1.8)
  sceneGroup:insert( images.assunto1Image )

  images.talkImage = display.newImage( "imgs/talk.png" )
  images.talkImage.x = 100
  images.talkImage.y = display.contentCenterY - 90
  images.talkImage:scale( 1.5, 1.5 )
  sceneGroup:insert( images.talkImage )

  images.caixaTexto = display.newImage( "imgs/caixaTexto.png" )
  images.caixaTexto.x = display.contentCenterX
  images.caixaTexto.y = display.contentCenterY + 130
  images.caixaTexto:scale( 2, 2 )
  sceneGroup:insert( images.caixaTexto )

  local texto = "Em resumo, a determinação do sexo em seres humanos é uma combinação complexa de fatores genéticos e ambientais que resultam na formação dos órgãos sexuais e na expressão de características secundárias."
  local options = {
      text = texto,
      x = display.contentCenterX,
      y = display.contentCenterY + 200,
      width = 650,
      font = native.systemFont,
      fontSize = 34,
      align = "left"
  }
  local textoObj = display.newText(options)
  sceneGroup:insert(textoObj)

  -- Botão no canto inferior direito
  local buttonNext = display.newCircle(sceneGroup,  display.contentWidth - 90, display.contentHeight + 125, 70)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    textoObj = nil
    composer.gotoScene("pages.page09", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, 90,  display.contentHeight + 125, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page07", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo

end

scene:addEventListener("create", scene)

return scene