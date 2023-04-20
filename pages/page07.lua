local composer = require("composer")
local scene = composer.newScene()
local images= {}
local imgX2Caiu = false

function scene:create(event)
  local sceneGroup = self.view
  local verificarCoresRetangulos

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY
  sceneGroup:insert(fundoImage)

  images.talkImage = display.newImage( "imgs/talk.png" )
  images.talkImage.x = display.contentCenterX - 280
  images.talkImage.y = display.contentCenterY - 580
  images.talkImage:scale( 1.5, 1.5 )
  sceneGroup:insert( images.talkImage )

  images.caixaTexto = display.newImage( "imgs/caixaTexto.png" )
  images.caixaTexto.x = display.contentCenterX
  images.caixaTexto.y = display.contentCenterY - 480
  images.caixaTexto:scale( 2, 0.7 )
  sceneGroup:insert( images.caixaTexto )

  local obj1 =  display.newImage( "imgs/obj1.png" )
  obj1.x = display.contentCenterX 
  obj1.y = display.contentCenterY
  obj1:scale( 2, 2 )
  sceneGroup:insert(obj1)

  local imgX1 =  display.newImage( "imgs/X.png" )
  imgX1.x = display.contentCenterX + 80
  imgX1.y = display.contentCenterY - 200
  imgX1:scale( 1, 1 )
  sceneGroup:insert(imgX1)

  local imgY2 =  display.newImage( "imgs/Y.png" )
  imgY2.x = display.contentCenterX - 80
  imgY2.y = display.contentCenterY - 200
  imgY2:scale( 1, 1 )
  sceneGroup:insert(imgY2)

  local imgX2 =  display.newImage( "imgs/X.png" )
  imgX2.x = display.contentCenterX + 180
  imgX2.y = display.contentCenterY - 150
  imgX2:scale( 1, 1 )
  sceneGroup:insert(imgX2)

  local imgY =  display.newImage( "imgs/Y.png" )
  imgY.x = display.contentCenterX - 180
  imgY.y = display.contentCenterY - 150
  imgY:scale( 1, 1 )
  sceneGroup:insert(imgY)

  local function verificarImagensForaDaTela()
    if (imgX2 == nil and imgY == nil) then
      display.remove(imgX1)
      imgX1 = nil
      display.remove(imgY2)
      imgY2 = nil
      display.remove(obj1)
      obj1 = nil
      local bebe =  display.newImage( "imgs/obj11.png" )
      bebe.x = display.contentCenterX 
      bebe.y = display.contentCenterY
      bebe:scale( 2, 2 )
      sceneGroup:insert(bebe)
    end
  end

  local function onAccelerate(event)
    local acceleration = event
    if (acceleration.isShake and imgX2) then
      transition.to(imgX2, {y = display.actualContentHeight + imgX2.height, time = 500, onComplete = function()
        display.remove(imgX2)
        imgX2 = nil
        imgX2Caiu = true
      end})
    elseif (acceleration.isShake and imgX2 == nil and imgY) then
      transition.to(imgY, {y = display.actualContentHeight + imgY.height, time = 500, onComplete = function()
        display.remove(imgY)
        imgY = nil
        verificarImagensForaDaTela()
      end})
    end
  end  

  system.setAccelerometerInterval(50)
  Runtime:addEventListener("accelerometer", onAccelerate)

  local texto = "Elimine a possibilidade desse recém nascido possuir o síndrome de Klinefelter ou o síndrome de Jacob."
    local options = {
        text = texto,
        x = display.contentCenterX,
        y = display.contentCenterY - 460,
        width = 650,
        font = native.systemFont,
        fontSize = 34,
        align = "left"
    }
  local textoObj = display.newText(options)
  sceneGroup:insert(textoObj)

  local texto2 = "Dica: Agite o celular ate eliminar as possibilidades do bebe ter a sindome de Klinefelter/jacob."
  local options2 = {
      text = texto2,
      x = display.contentCenterX,
      y = display.contentCenterY + 300,
      width = 650,
      font = native.systemFont,
      fontSize = 25,
      align = "center"
  }
local textoObj2 = display.newText(options2)
textoObj2:setFillColor( 0.27, 0.23, 0.19 )
sceneGroup:insert(textoObj2)

  -- Botão no canto inferior direito
  local buttonNext = display.newCircle(sceneGroup,  display.contentCenterX + 280,  display.contentCenterY + 530, 70)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    textoObj = nil
    composer.removeScene("pages.page07")
    composer.gotoScene("pages.page08", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, display.contentCenterX - 280,  display.contentCenterY + 530, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.removeScene("pages.page07")
    composer.gotoScene("pages.page06", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo
  
end

scene:addEventListener("create", scene)

return scene