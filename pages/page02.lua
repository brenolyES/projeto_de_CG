local composer = require("composer")
local scene = composer.newScene()
local images= {}
local blockButton = 0
local buttonNext

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

  local texto = "Determine os cromossomos autossômicos e os sexuais arrastando para sua devida área."
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

  local rect1 = display.newRect(display.contentCenterX, display.contentCenterY + 30, 700, 300)
  rect1.strokeWidth = 5
  rect1:setStrokeColor(0.27, 0.23, 0.19)
  rect1:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect1)

  local obj1 =  display.newImage( "imgs/obj1.png" )
  obj1.x = display.contentCenterX - 200
  obj1.y = display.contentCenterY - 300
  obj1:scale( 1.3, 1.3 )
  sceneGroup:insert(obj1)
  
  local title1 = display.newText({
    text = "Cromossomos Autossômicos",
    x = rect1.x,
    y = rect1.y - rect1.height / 2 - 20,
    font = native.systemFont,
    fontSize = 50,
    align = "center",
    width = rect1.width,
  })
  title1:setFillColor( 0.27, 0.23, 0.19 )
  sceneGroup:insert(title1)

  local function onObj1Touch(event)
    if event.phase == "began" then
      display.getCurrentStage():setFocus(event.target, event.id)
      event.target.isFocus = true
    elseif event.phase == "moved" then
      if event.target.isFocus then
        event.target.x = event.x
        event.target.y = event.y
      end
    elseif event.phase == "ended" or event.phase == "cancelled" then
      display.getCurrentStage():setFocus(event.target, nil)
      event.target.isFocus = false
      
      if event.x > rect1.x - rect1.width / 2 and
         event.x < rect1.x + rect1.width / 2 and
         event.y > rect1.y - rect1.height / 2 and
         event.y < rect1.y + rect1.height / 2 then
        rect1:setFillColor(0.84, 0.72, 0.51)
        blockButton = blockButton + 1
        if blockButton == 2 then
          buttonNext:setFillColor(0.84, 0.72, 0.51) 
        end
      else
        blockButton = blockButton - 1
        rect1:setFillColor(0, 0, 0, 0)
        buttonNext:setFillColor(1, 1, 1)
      end
    end
    return true
  end

  obj1:addEventListener("touch", onObj1Touch)
  
  local rect2 = display.newRect(display.contentCenterX, display.contentCenterY + 400, 700, 300)
  rect2.strokeWidth = 5
  rect2:setStrokeColor(0.27, 0.23, 0.19)
  rect2:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect2)

  local obj2 =  display.newImage( "imgs/obj2.png" )
  obj2.x = display.contentCenterX + 200
  obj2.y = display.contentCenterY - 300
  obj2:scale( 2, 2 )
  sceneGroup:insert(obj2)
  
  local title2 = display.newText({
    text = "Cromossomos Sexuais",
    x = rect2.x,
    y = rect2.y - rect2.height / 2 - 20,
    font = native.systemFont,
    fontSize = 50,
    align = "center",
    width = rect2.width,
  })
  title2:setFillColor( 0.27, 0.23, 0.19 )
  sceneGroup:insert(title2)

  local function onObj2Touch(event)
    if event.phase == "began" then
      display.getCurrentStage():setFocus(event.target, event.id)
      event.target.isFocus = true
    elseif event.phase == "moved" then
      if event.target.isFocus then
        event.target.x = event.x
        event.target.y = event.y
      end
    elseif event.phase == "ended" or event.phase == "cancelled" then
      display.getCurrentStage():setFocus(event.target, nil)
      event.target.isFocus = false
      
      if event.x > rect2.x - rect2.width / 2 and
         event.x < rect2.x + rect2.width / 2 and
         event.y > rect2.y - rect2.height / 2 and
         event.y < rect2.y + rect2.height / 2 then
        rect2:setFillColor(0.84, 0.72, 0.51)
        blockButton = blockButton + 1
        if blockButton == 2 then
        buttonNext:setFillColor(0.84, 0.72, 0.51) 
        end
      else
        blockButton = blockButton - 1
        rect2:setFillColor(0, 0, 0, 0)
        buttonNext:setFillColor(0.5, 0.5, 0.5)
      end
    end
    return true
  end

  obj2:addEventListener("touch", onObj2Touch)

  buttonNext = display.newCircle(sceneGroup,  display.contentWidth - 90, display.contentHeight + 125, 70)
  buttonNext:setFillColor(0.5, 0.5, 0.5)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    if blockButton == 2 then     
      textoObj = nil
      composer.removeScene("pages.page02")
      composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
    end
  end)


  local buttonBack = display.newCircle(sceneGroup, 90,  display.contentHeight + 125, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.removeScene("pages.page02")
    composer.gotoScene("pages.page01", { effect = "flip", time = 100, direction="left" })
  end)
  
end

scene:addEventListener("create", scene)

return scene