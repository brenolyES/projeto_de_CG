local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  local verificarCoresRetangulos

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

  local rect1 = display.newRect(display.contentCenterX, display.contentCenterY + 100, 800, 400)
  rect1.strokeWidth = 5
  rect1:setStrokeColor(0.27, 0.23, 0.19)
  rect1:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect1)

  local obj1 = display.newImageRect(sceneGroup, "imgs/obj1.png", 264, 269)
  obj1.x = display.contentCenterX - 200
  obj1.y = display.contentCenterY - 400
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
      else
        rect1:setFillColor(0, 0, 0, 0)
      end
    end
    return true
  end

  obj1:addEventListener("touch", onObj1Touch)
  
  local rect2 = display.newRect(display.contentCenterX, display.contentCenterY + 600, 800, 400)
  rect2.strokeWidth = 5
  rect2:setStrokeColor(0.27, 0.23, 0.19)
  rect2:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect2)

  local obj2 = display.newImageRect(sceneGroup, "imgs/obj2.png", 137, 150)
  obj2.x = display.contentCenterX + 200
  obj2.y = display.contentCenterY - 400
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
      else
        rect2:setFillColor(0, 0, 0, 0)
      end
    end
    return true
  end

  obj2:addEventListener("touch", onObj2Touch)

  local buttonNext = display.newCircle(sceneGroup,  display.actualContentWidth - 150,  display.actualContentHeight - 200, 100)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    textoObj = nil
    composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
  end)

  local buttonBack = display.newCircle(sceneGroup, 150,  display.actualContentHeight - 200, 100)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    composer.gotoScene("pages.page01", { effect = "flip", time = 100, direction="left" })
  end)
  
end

scene:addEventListener("create", scene)

return scene