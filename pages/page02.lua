local composer = require("composer")
local scene = composer.newScene()
local images= {}
local blockButton = 0
local buttonNext
local pageSound, applauseSound
local pageSoundOptions = {
  channel = 1,
  loops = 0,
  duration = 1000,
  fadein = 0
}
local applauseSound = {
  channel = 1,
  loops = 0,
  duration = 1000,
  fadein = 0
}

function scene:create(event)
  local sceneGroup = self.view
  pageSound = audio.loadSound("./sounds/page.mp3")
  applauseSound = audio.loadSound("./sounds/applause.mp3")
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

  local texto = "Determine os cromossomos autossômicos e os sexuais arrastando para sua devida área."
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

  local rect1 = display.newRect(display.contentCenterX, display.contentCenterY - 10, 650, 250)
  rect1.strokeWidth = 5
  rect1:setStrokeColor(0.27, 0.23, 0.19)
  rect1:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect1)

  local obj1 =  display.newImage( "imgs/obj1.png" )
  obj1.x = display.contentCenterX - 150
  obj1.y = display.contentCenterY - 280
  obj1:scale( 1, 1 )
  sceneGroup:insert(obj1)
  
  local title1 = display.newText({
    text = "Cromossomos Autossômicos",
    x = rect1.x,
    y = rect1.y - rect1.height / 2 - 20,
    font = native.systemFont,
    fontSize = 40,
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
  
  local rect2 = display.newRect(display.contentCenterX, display.contentCenterY + 300, 650, 250)
  rect2.strokeWidth = 5
  rect2:setStrokeColor(0.27, 0.23, 0.19)
  rect2:setFillColor(0, 0, 0, 0)
  sceneGroup:insert(rect2)

  local obj2 =  display.newImage( "imgs/obj2.png" )
  obj2.x = display.contentCenterX + 150
  obj2.y = display.contentCenterY - 280
  obj2:scale( 1.5, 1.5 )
  sceneGroup:insert(obj2)
  
  local title2 = display.newText({
    text = "Cromossomos Sexuais",
    x = rect2.x,
    y = rect2.y - rect2.height / 2 - 20,
    font = native.systemFont,
    fontSize = 40,
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
        audio.play(applauseSound, applauseSoundOptions)
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

  buttonNext = display.newCircle(sceneGroup,  display.contentCenterX + 280,  display.contentCenterY + 530, 70)
  buttonNext:setFillColor(0.5, 0.5, 0.5)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    if blockButton == 2 then     
      textoObj = nil
      audio.play(pageSound, pageSoundOptions)
      composer.removeScene("pages.page02")
      composer.gotoScene("pages.page03", { effect = "flip", time = 100, direction="left" })
    end
  end)


  local buttonBack = display.newCircle(sceneGroup, display.contentCenterX - 280,  display.contentCenterY + 530, 70)
  buttonBack:setFillColor(0.27, 0.23, 0.19)
  local image2 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image2.x, image2.y = buttonBack.x, buttonBack.y
  image2.xScale = -1
  buttonBack:addEventListener("tap", function(event)
    audio.play(pageSound, pageSoundOptions)
    composer.removeScene("pages.page02")
    composer.gotoScene("pages.page01", { effect = "flip", time = 100, direction="left" })
  end)
  
end

scene:addEventListener("create", scene)

return scene