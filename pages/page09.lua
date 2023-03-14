local composer = require("composer")
local images= {}

local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY

  images.caixaTexto = display.newImage( "imgs/logoUPE.png" )
  images.caixaTexto.x = display.contentCenterX
  images.caixaTexto.y = display.contentCenterY - 550
  images.caixaTexto:scale( 2, 2 )
  sceneGroup:insert( images.caixaTexto )

  images.titleImage = display.newImage( "imgs/titleEnd.png" )
  images.titleImage.x = display.contentCenterX
  images.titleImage.y = display.contentCenterY + 90
  images.titleImage:scale( 1.6, 1.6 )
  sceneGroup:insert( images.titleImage )

  local myText1 = display.newText( "Brenoly Porto Lira da Silva", display.contentCenterX, display.contentCenterY - 400, native.systemFont, 54 )
  myText1:setFillColor( 69/255, 59/255, 49/255 )
  sceneGroup:insert(myText1)

  local options = 
  {
      text = "Projeto desenvolvido para a disciplina de Computação Gráfica no curso de Engenharia de Software da Universidade de Pernambuco, sob orientação do Professor Ewerton Mendoça.",     
      x = display.contentCenterX,
      y = display.contentCenterY - 300,
      width = 600,
      font = native.systemFont,   
      fontSize = 23,
      align = "center"  -- Alignment parameter
  }
   
  local myText2 = display.newText( options )
  myText2:setFillColor( 69/255, 59/255, 49/255 )
  sceneGroup:insert(myText2)
  
  local buttonBg = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentHeight - 70, 300, 80, 30)
  buttonBg:setFillColor(0.84, 0.72, 0.5) 
  
  local buttonText = display.newText(sceneGroup, "REINICIAR", display.contentCenterX, display.contentHeight - 70, native.systemFontBold, 40)
  buttonText:setFillColor(1, 1, 1)
  
  buttonBg:addEventListener("tap", function(event)
    composer.removeScene("pages.page09")
    composer.gotoScene("pages.page00", { effect = "flip", time = 100, direction="left" })
  end)
end

scene:addEventListener("create", scene)

return scene
