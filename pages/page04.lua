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
  images.talkImage.x = display.contentCenterX - 280
  images.talkImage.y = display.contentCenterY - 580
  images.talkImage:scale( 1.5, 1.5 )
  sceneGroup:insert( images.talkImage )

  images.caixaTexto = display.newImage( "imgs/caixaTexto.png" )
  images.caixaTexto.x = display.contentCenterX
  images.caixaTexto.y = display.contentCenterY - 480
  images.caixaTexto:scale( 2, 0.7 )
  sceneGroup:insert( images.caixaTexto )

  local ovulo =  display.newImage( "imgs/obj5.png" )
  ovulo.x = display.contentCenterX 
  ovulo.y = display.contentCenterY + 450
  ovulo:scale( 1, 1 )
  sceneGroup:insert(ovulo)
  
  local cromossomo =  display.newImage( "imgs/obj4.png" )
  cromossomo.x = display.contentCenterX - 200
  cromossomo.y = display.contentCenterY - 250
  cromossomo:scale( 1, 1 )
  sceneGroup:insert(cromossomo)

  local texto2 = "Dica: O objetivo é fazer com que o cromossomo chegue até o ovulo. Então, mexa o celular de um lado para o outro e agite para ajudar o cromossomo a chegar no objetivo."
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

  physics.addBody(cromossomo, "dynamic", {isSensor = true})
  physics.addBody(ovulo, "static", {radius=50})

  local function checkCenter()
    if cromossomo and cromossomo.x > display.contentCenterX - 50 and cromossomo.x < display.contentCenterX + 50 and cromossomo.y > display.contentCenterY - 50 and cromossomo.y < display.contentCenterY + 50 then
        textoObj2.text = "Dica: Agora agite o celular para o cromossomo a chegar ao óvulo!"
    end
  end

  local function onCollision(event)
    if event.phase == "began" then
      local objA = event.object1
      local objB = event.object2
      if (objA == cromossomo and objB == ovulo) or (objA == ovulo and objB == cromossomo) then
        display.remove(textoObj2)
        local bebe = display.newImage("imgs/obj6.png")
        bebe.x = display.contentCenterX
        bebe.y = display.contentCenterY
        bebe:scale(2, 2)
        sceneGroup:insert(bebe)
      end
    end
  end

  local function onAccelerate(event)
    local acceleration = event
    if (acceleration.isShake and cromossomo.x >= display.contentWidth * 0.5 and cromossomo.y >= display.contentHeight * 0.5) then
      transition.to(cromossomo, {time=1000, y=display.contentHeight * 0.8})
    end
  end  

  local function onOrientationChange(event)
    local currentOrientation = event.type
    if currentOrientation == "landscapeLeft" then
      cromossomo:rotate(-90)
      transition.to(cromossomo, {time=1000, x=display.contentWidth * 0.8})
    else
      cromossomo.rotation = 0
      if cromossomo.x >= display.contentWidth * 0.8 and cromossomo.y >= display.contentHeight * 0.3 then
        transition.to(cromossomo, {time=1000, y=display.contentCenterY})
      end
      if currentOrientation == "landscapeRight" and cromossomo.x ~= display.contentCenterX - 200 then
        cromossomo:rotate(90)
        transition.to(cromossomo, {time=1000, x=display.contentCenterX})
      end
    end
  end
  
  system.setAccelerometerInterval(50)
  Runtime:addEventListener("orientation", onOrientationChange)
  Runtime:addEventListener("accelerometer", onAccelerate)
  Runtime:addEventListener("collision", onCollision)
  Runtime:addEventListener("enterFrame", checkCenter)


  local texto = "Faca com que o cromossomo x chegue ate o ovulo assim gerando um bebe do sexo FEMININO."
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

  -- Botão no canto inferior direito
  local buttonNext = display.newCircle(sceneGroup,  display.contentCenterX + 280,  display.contentCenterY + 530, 70)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    textoObj = nil
    composer.removeScene("pages.page04")
    composer.gotoScene("pages.page05", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, display.contentCenterX - 280,  display.contentCenterY + 530, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.removeScene("pages.page04")
    composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo
  
end

scene:addEventListener("create", scene)

return scene