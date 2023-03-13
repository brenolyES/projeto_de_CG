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

  local obj5 =  display.newImage( "imgs/obj5.png" )
  obj5.x = display.contentCenterX 
  obj5.y = display.contentCenterY + 400
  obj5:scale( 2, 2 )
  sceneGroup:insert(obj5)

  local obj3 =  display.newImage( "imgs/obj3.png" )
  obj3.x = display.contentCenterX - 200
  obj3.y = display.contentCenterY - 300
  obj3:scale( 2, 2 )
  sceneGroup:insert(obj3)

  local obj4 =  display.newImage( "imgs/obj4.png" )
  obj4.x = display.contentCenterX + 200
  obj4.y = display.contentCenterY - 300
  obj4:scale( 2, 2 )
  sceneGroup:insert(obj4)

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

  obj3:addEventListener("touch", dragObj)
  obj4:addEventListener("touch", dragObj)
  physics.addBody(obj3, "dynamic", {isSensor = true})
  physics.addBody(obj4, "dynamic", {isSensor = true})
  physics.addBody(obj5, "static", {radius=50})

  local function onCollision(event)
    if event.phase == "began" then
      local objA = event.object1
      local objB = event.object2
      if (objA == obj4 and objB == obj5) or (objA == obj5 and objB == obj4) then
        display.remove(obj5)
        display.remove(obj4)
        local obj6 = display.newImage("imgs/obj6.png")
        obj6.x = obj5.x
        obj6.y = obj5.y - 100
        obj6:scale(2, 2)
        sceneGroup:insert(obj6)
      end
    end
  end

  Runtime:addEventListener("collision", onCollision)


  local texto = "Determine o cromossomos capaz de gerar uma pessoa do sexo FEMININO."
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
    composer.gotoScene("pages.page05", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito
  
  -- Botão no canto inferior esquerdo
  local buttonBack = display.newCircle(sceneGroup, 90,  display.contentHeight + 125, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior esquerdo
  
end

scene:addEventListener("create", scene)

return scene