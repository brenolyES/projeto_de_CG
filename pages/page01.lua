local composer = require("composer")
local scene = composer.newScene()
local images= {}
local pageSound
local pageSoundOptions = {
  channel = 1,
  loops = 0,
  duration = 1000,
  fadein = 0
}

function scene:create(event)
  local sceneGroup = self.view
  pageSound = audio.loadSound("./sounds/page.mp3")

  local fundoImage = display.newImageRect(sceneGroup, "imgs/fundo.png", display.actualContentWidth, display.actualContentHeight)
  fundoImage.x = display.contentCenterX
  fundoImage.y = display.contentCenterY
  sceneGroup:insert(fundoImage)

  images.assunto1Image = display.newImage( "imgs/assunto1.png" )
  images.assunto1Image.x = display.contentCenterX
  images.assunto1Image.y = display.contentCenterY - 400
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

  local texto = "A determinação do sexo em seres humanos é determinada pelos cromossomos sexuais. Em seres humanos, existem 23 pares de cromossomos, totalizando 46 cromossomos. Destes, 44 são cromossomos autossômicos, que não estão diretamente envolvidos na determinação do sexo, e os outros dois são cromossomos sexuais, o X e o Y."
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
  local buttonNext = display.newCircle(sceneGroup,  display.contentCenterX + 280,  display.contentCenterY + 530, 70)
  buttonNext:setFillColor(0.84, 0.72, 0.51)
  local image1 = display.newImageRect(sceneGroup, "imgs/next.png", 40, 40)
  image1.x, image1.y = buttonNext.x, buttonNext.y
  buttonNext:addEventListener("tap", function(event)
    audio.play(pageSound, pageSoundOptions)
    textoObj = nil
    composer.removeScene("pages.page01")
    composer.gotoScene("pages.page02", { effect = "flip", time = 100, direction="left" })
  end)
  -- Botão no canto inferior direito

end

scene:addEventListener("create", scene)

return scene