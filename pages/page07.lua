local composer = require("composer")
local physics = require("physics")
local scene = composer.newScene()
local images= {}
physics.start()
physics.setGravity(0, 0)

function scene:create(event)
  local sceneGroup = self.view
  local verificarCoresRetangulos

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY
  sceneGroup:insert(fundoImage)

  images.talkImage = display.newImage( "imgs/talk.png" )
  images.talkImage.x = 100
  images.talkImage.y = -180
  images.talkImage:scale( 1.5, 1.5 )
  sceneGroup:insert( images.talkImage )

  images.caixaTexto = display.newImage( "imgs/caixaTexto.png" )
  images.caixaTexto.x = display.contentCenterX
  images.caixaTexto.y = display.contentCenterY - 580
  images.caixaTexto:scale( 2, 0.7 )
  sceneGroup:insert( images.caixaTexto )

  local texto = "Elimine a possibilidade desse recém nascido possuir o síndrome de Klinefelter ou o síndrome de Jacob. ."
    local options = {
        text = texto,
        x = display.contentCenterX,
        y = display.contentCenterY - 550,
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
    composer.gotoScene("pages.page08", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, 90,  display.contentHeight + 125, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page06", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo
  
end

scene:addEventListener("create", scene)

return scene