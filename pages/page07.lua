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

  local obj9 =  display.newImage( "imgs/obj9.png" )
  obj9.x = display.contentCenterX 
  obj9.y = display.contentCenterY - 260
  obj9:scale( 1.5, 1.5 )
  sceneGroup:insert(obj9)

  local obj1 =  display.newImage( "imgs/obj1.png" )
  obj1.x = display.contentCenterX 
  obj1.y = display.contentCenterY + 120
  obj1:scale( 2, 2 )
  sceneGroup:insert(obj1)

  local obj10 =  display.newImage( "imgs/obj10.png" )
  obj10.x = display.contentCenterX 
  obj10.y = display.contentCenterY + 400
  obj10:scale( 1.5, 1.5 )
  sceneGroup:insert(obj10)

  local imgX1 =  display.newImage( "imgs/X.png" )
  imgX1.x = display.contentCenterX 
  imgX1.y = display.contentCenterY - 120
  imgX1:scale( 2, 2 )
  sceneGroup:insert(imgX1)

  local imgX2 =  display.newImage( "imgs/X.png" )
  imgX2.x = display.contentCenterX + 180
  imgX2.y = display.contentCenterY - 80
  imgX2:scale( 2, 2 )
  sceneGroup:insert(imgX2)

  local imgY =  display.newImage( "imgs/Y.png" )
  imgY.x = display.contentCenterX - 180
  imgY.y = display.contentCenterY - 80
  imgY:scale( 2, 2 )
  sceneGroup:insert(imgY)

  local function dragObj(event)
    local obj = event.target
    if event.phase == "began" then
      display.getCurrentStage():setFocus(obj)
      obj.isFocus = true
      obj.x0 = event.x - obj.x
      obj.y0 = event.y - obj.y
    elseif obj.isFocus then
      if event.phase == "moved" then
        obj.x = event.x - obj.x0
        obj.y = event.y - obj.y0
      elseif event.phase == "ended" or event.phase == "cancelled" then
        display.getCurrentStage():setFocus(nil)
        obj.isFocus = false
      end
    end
    return true
  end

  imgX1:addEventListener("touch", dragObj)
  imgX2:addEventListener("touch", dragObj)
  imgY:addEventListener("touch", dragObj)
  physics.addBody(imgX1, "dynamic", {isSensor = true})
  physics.addBody(imgX2, "dynamic", {isSensor = true})
  physics.addBody(imgY, "dynamic", {isSensor = true})
  physics.addBody(obj10, "static")

  local function onCollision(event)
    if event.phase == "began" then
      local objA = event.object1
      local objB = event.object2
      if (objA == imgX1 and objB == obj10) or (objA == obj10 and objB == imgX1) or
         (objA == imgX2 and objB == obj10) or (objA == obj10 and objB == imgX2) or
         (objA == imgY and objB == obj10) or (objA == obj10 and objB == imgY) then
        display.remove(obj9, obj10)
        display.remove(obj10)
        display.remove(obj1)
        display.remove(imgX1)
        display.remove(imgX2)
        display.remove(imgY)
        local obj11 = display.newImage("imgs/obj11.png")
        obj11.x = display.contentCenterX
        obj11.y = display.contentCenterY
        obj11:scale(2, 2)
        sceneGroup:insert(obj11)
      end
    end
  end

  Runtime:addEventListener("collision", onCollision)

  local texto = "Elimine a possibilidade desse recém nascido possuir o síndrome de Klinefelter ou o síndrome de Jacob. ."
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