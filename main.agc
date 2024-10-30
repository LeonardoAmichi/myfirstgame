// Project: myFirstGame 
// Created: 2024-08-01

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "MyFirstGame" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window
// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

global animacaoBaixo
global spriteAnimacaoCima
global animacaoCimaImagem
global animacaoEsquerdaImagem
global spriteAnimacaoEsquerda
global animacao1Sprite
global animacao1Imagem
global movdireita
global enemy1, enemy2, enemy3, enemy4, enemy5
global tiroSprite

global tiroC = 1
global xTiro = 0
global yTiro = 0
global xPerso = 0
global yPerso = 0

global animaa = 0
global animad = 0
global animas = 0
global animaw = 0

global count = 0
global vidas = 3

global tempoInimigo1 = 0
global tempoInimigo2 = 0
global tempoInimigo3 = 0
global tempoInimigo4 = 0

global tempoTiro1 = 0
global tempoTiro2 = 0
global tempoTiro3 = 0
global tempoIiro4 = 0

global playSprite
global menu
global pontos = 0
global som
global tempoFinal
global lifeSprite1, lifeSprite2, lifeSprite3
global aux
global velocity = 2
global tempoAux = 0
global tempoAux2 = 0
global tempoAux3 = 0
global tempo
global auxPontos = 0

fundoFinal = LoadImage("End.png")
fundoImagem = LoadImage("fundo.png")
fundoSprite = CreateSprite(fundoImagem)
SetSpriteSize(fundoSprite, 1024, 768)

tiroImagem = LoadImage("tiro.png")
animacao1Imagem = LoadImage("animacao1.png")
tiroSprite = createSprite(tiroImagem)
SetSpriteVisible(tiroSprite, 0)

animacao1Sprite = createSprite(animacao1Imagem)//sprite principal
movdireita = LoadImage("MovDireita.png")
animacaoEsquerdaImagem = LoadImage("MovEsquerda.png")
spriteAnimacaoEsquerda = CreateSprite(animacaoEsquerdaImagem)

animacaoCimaImagem = LoadImage("cowboyCima.png")
spriteAnimacaoCima = CreateSprite(animacaoCimaImagem)


//Principal e para baixo
SetSpriteSize(animacao1Sprite, 100, 100)
SetSpriteAnimation(animacao1Sprite, 223, 223, 4)
PlaySprite(animacao1Sprite, 5)
SetSpritePosition(animacao1Sprite, 450, 350)


//Esquerda
SetSpriteSize(spriteAnimacaoEsquerda, 100, 100)
SetSpriteAnimation(spriteAnimacaoEsquerda, 223, 223, 4)
SetSpriteVisible(spriteAnimacaoEsquerda, 0)

//Pra cima
SetSpriteSize(spriteAnimacaoCima, 80, 80)
SetSpriteAnimation(spriteAnimacaoCima, 223, 223, 4)
SetSpriteVisible(spriteAnimacaoCima, 0)

//Morte
morte = LoadImage("morteSprite.png")
global morteSprite
morteSprite = CreateSprite(morte)
setSpriteSize(morteSprite, 100, 100)
SetSpriteAnimation(morteSprite, 223, 223, 5)
SetSpriteVisible(morteSprite, 0)
global auxMorte = 0


//Enemys
enemyBaixo = LoadImage("orcBaixo.png")
enemyCima = LoadImage("orcCima.png")
enemyDireita = LoadImage("orcDireita.png")
enemyEsquerda = LoadImage("orcEsquerda.png")

enemy1 = CreateSprite(enemyBaixo)
enemy2 = CreateSprite(enemyBaixo)
enemy3 = CreateSprite(enemyBaixo)
enemy4 = CreateSprite(enemyBaixo)

SetSpriteSize(enemy1, 60, 60)
SetSpriteSize(enemy2, 60, 60)
SetSpriteSize(enemy3, 60, 60)
SetSpriteSize(enemy4, 60, 60)

SetSpriteAnimation(enemy1, 180,170,3)
SetSpriteAnimation(enemy2, 180,170,3)
SetSpriteAnimation(enemy3, 180,170,3)
SetSpriteAnimation(enemy4, 180,170,3)

playSprite(enemy1, 5)
playSprite(enemy2, 5)
playSprite(enemy3, 5)
playSprite(enemy4, 5)

SetSpriteVisible(enemy1, 0) 
SetSpriteVisible(enemy2, 0)
SetSpriteVisible(enemy3, 0) 
SetSpriteVisible(enemy4, 0)

SetSpritePosition(enemy1, 2000, 2000)
SetSpritePosition(enemy2, 2000, 2000)
SetSpritePosition(enemy3, 2000, 2000)
SetSpritePosition(enemy4, 2000, 2000)

//Inicio
fundoLogin = LoadImage("Inicio.png")
play = LoadImage("Play.png")
help = LoadImage("Help.png")

fundoInicio = CreateSprite(fundoLogin)
playSprite = createSprite(play)
helpSprite = createSprite(help)
SetSpriteSize(fundoInicio, 1024, 768)
SetSpriteSize(helpSprite, 230, 150)
SetSpritePosition(helpSprite, 510, 450)
SetSpriteSize(playSprite, 230, 150)
SetSpritePosition(playSprite, 260, 450)

//Help
fundoHelp = LoadImage("helpMenu.png")
fundoHelpSprite = createsprite(fundoHelp)
SetSpriteSize(fundoHelpSprite, 1024, 768)
SetSpriteVisible(fundoHelpSprite, 0)


//Life
life1 = LoadImage("life.png")
life2 = LoadImage("life.png")
life3 = LoadImage("life.png")

lifeSprite1 = CreateSprite(life1)
setSpritesize(lifeSprite1, 70, 70)
SetSpriteVisible(lifeSprite1, 0)

lifeSprite2 = CreateSprite(life2)
setSpritesize(lifeSprite2, 70, 70)
SetSpriteVisible(lifeSprite2, 0)

lifeSprite3 = CreateSprite(life3)
setSpritesize(lifeSprite3, 70, 70)
SetSpriteVisible(lifeSprite3, 0)

lifeSpawn = LoadImage("heartsSprite.png")
global lifeSpawnSprite
lifeSpawnSprite = CreateSprite(lifeSpawn)

SetSpriteSize(lifeSpawnSprite, 40, 35)
SetSpriteAnimation(lifeSpawnSprite, 205, 190, 5)
playSprite(lifeSpawnSprite, 5)
SetSpriteVisible(lifeSpawnSprite, 0)
global auxLife = 0

//OST
loadSound(7, "powerup.wav")
loadSound(6, "kill.wav")
loadSound(5, "life.wav")
loadSound(4, "tiro.wav")
LoadSound(3, "Ending.wav")
LoadSound(2, "ostPrincipal.wav")
loadSound(1, "menu.wav")

//Boots
boots = loadImage("boots.png")
global bootsSprite
bootsSprite = createSprite(boots)
setSpriteSize(bootsSprite, 50, 50)
SetSpriteVisible(bootsSprite, 0)
global velocityPerso = 5
global auxBoots = 0

//Super Gun
gun = LoadImage("gun.png")
global gunSprite
gunSprite = createSprite(gun)
SetSpriteSize(gunSprite, 50, 50)
global velociyGun = 5
global auxGun = 0
SetSpriteVisible(gunSprite, 0)

//menu Final
tabela = LoadImage("score.png")
global tabelasprite
tabelasprite = CreateSprite(tabela)
SetSpriteVisible(tabelasprite,0)

quitImage = LoadImage("Quit.png")
global quitSprite
quitSprite = createSprite(quitImage)
SetSpriteVisible(quitSprite, 0)
SetSpriteSize(quitSprite, 230, 150)

global PontosFinal
PontosFinal = CreateText("Kill " + str(pontos))
SetTextSize(PontosFinal, 80)
SetTextPosition(PontosFinal,200,1990)

global TempoScore
TempoScore = CreateText("Tempo " + str(tempo))
SetTextSize(TempoScore,80)
SetTextPosition(TempoScore,-600,1200)

font = LoadFont("Fonte.ttf")
SetTextFont(PontosFinal, font)
SetTextFont(TempoScore, font)

SetTextColor(TempoScore,00, 00, 00, 255)
SetTextColor(PontosFinal, 00, 00, 00, 255)

//Variaveis utilizadas
count = 2
spawn = 0
pontos = 0
tempoInimigo = 0
menu = 0
som = 0
fundoF = 0


do
		
	if(vidas = 0 and fundoF = 0)
		menu = 3
		tempoAux2 = GetSeconds() - tempo
		SetSpriteVisible(enemy1, 0)
		SetSpriteVisible(enemy2, 0)
		SetSpriteVisible(enemy3, 0)
		SetSpriteVisible(enemy4, 0)
		SetSpriteVisible(TiroSprite, 0)
		
		SetSpriteVisible(animacao1Sprite, 0)
		SetSpriteVisible(morteSprite, 1)
		SetSpritePosition(morteSprite, getSpriteX(animacao1Sprite), getSpriteY(animacao1Sprite))
		if(auxMorte = 0)
			PlaySprite(morteSprite, 1)
			auxMorte = 1
			endif
		if(tempoAux2 = 4)
			fundoF = 1
			endif
		endif
	
	if(vidas = 0 and fundoF = 1)
			if(som = 2)
				StopSound(2)
				PlaySound(3, 80, 1)
				som = 3
				endif
			CreateSprite(1,fundoFinal)
			SetSpriteVisible(tabelasprite,1)
			SetSpriteVisible(quitSprite,1)
			SetSpriteDepth(tabelasprite,1)
			SetSpriteDepth(quitsprite,1)
			SetSpritePosition(tabelasprite,250,900)
			SetSpritePosition(quitSprite,400,900)
			SetTextString(TempoScore, "Tempo- " + str(Tempo))
			SetTextString(PontosFinal, "Kills- " + str(Pontos))
			fundoF = 2
			endif
	if(fundoF = 2)
		quit()
		movscore()
	endif
			
	if(menu = 0)
		if(som = 0)
			PlaySound(1, 80, 1)
			som = 1
			endif
		SetSpriteVisible(fundoInicio, 1)
		help()
		play()
		endif
		
		if(menu = 0 or menu = 2)
			tempoAux = GetSeconds()
			endif
			
	if(menu = 2)
		SetSpriteVisible(fundoHelpSprite, 1)
		playHelp()
		endif
	
	if(menu = 1)
		if(som = 1)
			StopSound(1)
			playSound(2, 80, 1)
			som = 2
			endif
		SetSpriteVisible(fundoInicio, 0)
		SetSpriteVisible(fundoHelpSprite, 0)
		SetSpriteVisible(playSprite, 0)
		SetSpriteVisible(helpSprite, 0)
		tempo = GetSeconds() - tempoAux
		tempoAux2 = getSeconds()
		
		if(tempo >= 2)
			tiro()
			endif
		if(tempo = 2)
			
			if(getSpriteX(enemy1) > 1500 and getSpriteY(enemy1) > 1500)	
				SetSpriteVisible(enemy1, 1)
				spawn(enemy1, random(400,600), 140)
				endif
			if(getSpriteX(enemy2) > 1500 and getSpriteY(enemy2) > 1500)
				SetSpriteImage(enemy2,enemyDireita)
				SetSpriteAnimation(enemy2, 180,170,3)
				playSprite(enemy2, 5)
				SetSpriteVisible(enemy2, 1)
				spawn(enemy2, 150, random(300, 400))
				endif
			if(getSpriteX(enemy3) > 1500 and getSpriteY(enemy3) > 1500)
				SetSpriteImage(enemy3,enemyEsquerda)
				SetSpriteAnimation(enemy3, 180,170,3)
				playSprite(enemy3, 5)
				SetSpriteVisible(enemy3, 1)
				spawn(enemy3, 800, random(400, 500))
				endif
				
			if(getSpriteX(enemy4) > 1500 and getSpriteY(enemy4) > 1500)
				setSpriteImage(enemy4,enemyCima)
				SetSpriteAnimation(enemy4, 180,170,3)
				playSprite(enemy4, 5)
				SetSpriteVisible(enemy4, 1)
				spawn(enemy4, random(400, 500), 620)
				endif
				
			endif
			respawn()
			Collision()
			KillTiro()
			movimento()
			borda()
			life()
			SpawnLife()
			SpawnBoots()
			SpawnGun()
			mov(enemy1)
			mov(enemy2)
			mov(enemy3)
			mov(enemy4)
			
			if(tempo = 60)
			fundoF = 0
			auxMorte = 1
			vidas = 0
			endif
			endif 
			
			Sync()
loop


function movscore()
	
	if(GetSpriteY(tabelasprite) > 170)
		SetSpritePosition(tabelasprite,GetSpriteX(tabelasprite), GetSpriteY(tabelasprite) -4.1)
	endif
	if(getSpriteY(quitSprite) > 600)
		SetSpritePosition(quitSprite, getSpriteX(quitSprite), getSpriteY(quitSprite) - 1.5)
	endif
	if(getspritey(tabelasprite) <= 170)
		SetTextPosition(PontosFinal,300,220)
		SetTextDepth(PontosFinal,0)
		SetTextPosition(TempoScore,300,310)
		SetTextDepth(TempoScore,0)
		
	endif
	
endfunction

function movimento ()
	if(GetRawKeyState(87))//w
		SetSpritePosition(animacao1Sprite, GetSpriteX(animacao1Sprite), GetSpriteY(animacao1Sprite) - velocityPerso)
			if(animaw = 0)
			SetSpriteImage(animacao1Sprite,animacaoCimaImagem)
			SetSpriteAnimation(animacao1Sprite, 223, 223, 4)
			animaw = 1
			animaa = 0
			animas = 0
			animad =0
			PlaySprite(animacao1sprite, 4)
			endif
		endif
		
	if(GetRawKeyState(83))//s
		SetSpritePosition(animacao1Sprite, GetSpriteX(animacao1Sprite), GetSpriteY(animacao1Sprite) + velocityPerso)
		if(animas = 0)
			animas = 1
			animaw = 0
			animaa = 0
			animad = 0
			SetSpriteImage(animacao1Sprite,animacao1Imagem)
			SetSpriteAnimation(animacao1Sprite, 223, 223, 4)
			PlaySprite(animacao1sprite, 4)
		endif
	endif
		
	if(GetRawKeyState(65))//a
		
		SetSpritePosition(animacao1sprite, GetSpriteX(animacao1sprite) - velocityPerso, GetSpriteY(animacao1sprite))
		if(animaa = 0)
			animaa = 1
			animaw = 0
			animas = 0
			animad = 0
			SetSpriteImage(animacao1Sprite,animacaoEsquerdaImagem) 
			SetSpriteAnimation(animacao1Sprite, 223, 223, 4)
			PlaySprite(animacao1sprite, 4)
		endif
	endif
		
	if(GetRawKeyState(68))//d
		
		SetSpritePosition(animacao1Sprite, GetSpriteX(animacao1Sprite) + velocityPerso, GetSpriteY(animacao1Sprite))
		if(animad = 0)
			animad = 1
			animaw = 0
			animas = 0
			animaa = 0
			SetSpriteImage(animacao1Sprite,movdireita) 
			SetSpriteAnimation(animacao1Sprite, 223, 223, 4)
			PlaySprite(animacao1sprite, 4)
		endif
		endif
	endfunction

function borda()
	if(GetSpriteX(animacao1Sprite) < 150)
		SetSpritePosition(animacao1Sprite, 150, GetSpriteY(animacao1Sprite))
		endif
		if(GetSpriteX(animacao1Sprite) > 800)
		SetSpritePosition(animacao1Sprite, 800, GetSpriteY(animacao1Sprite))
		endif
		if(GetSpriteY(animacao1Sprite) < 100)
		SetSpritePosition(animacao1Sprite, GetSpriteX(animacao1Sprite), 100)
		endif
		if(GetSpriteY(animacao1Sprite) > 600)
		SetSpritePosition(animacao1Sprite, GetSpriteX(animacao1Sprite), 600)
		endif
	endfunction

function tiro()
	if(GetPointerPressed())
		if (tiroC = 1)
			PlaySound(4, 50)
			xTiro = getPointerX()
			yTiro = getPointerY()
			xPerso = GetSpriteX(animacao1Sprite)
			yPerso = GetSpriteY(animacao1Sprite)
			
			SetSpritePosition(tiroSprite, GetSpriteX(animacao1Sprite) + 42, GetSpriteY(animacao1Sprite) + 42)
			tiroC = 0
			endif
		endif
		if(tiroC = 0)
			
			if(xPerso = xTiro)
				direcaoX = 0
				direcao = 0
				xPerso = 1
				endif
				
			if(yPerso = yTiro)
				direcaoY = 0
				direcao = 0
				endif
				
			direcao = (yPerso - yTiro) / (xPerso - xTiro)
			direcaoX = -((yPerso - yTiro + 45) / 50) * velociyGun
			direcaoY = -((xPerso - xTiro + 45) / 50) * velociyGun

			SetSpriteVisible(tiroSprite, 1)
			
			if(direcaoX = 0 and direcaoY = 0)
				SetSpriteVisible(tiroSprite, 0) 
				tiroC = 1
				endif
			
			if(xTiro >=  512 and xTiro <= 1024 and yTiro <= 384 and yTiro >= 0) // direita
				SetSpritePosition(tiroSprite, getSpriteX(tiroSprite) + direcaoY , getSpriteY(tiroSprite) + direcaoX)
				endif
			if(xTiro >=  0 and xTiro <= 512 and yTiro <= 384 and yTiro >= 0)
				SetSpritePosition(tiroSprite, getSpriteX(tiroSprite) + direcaoY, getSpriteY(tiroSprite) + direcaoX)
				endif
			if(xTiro >=  0 and xTiro <= 512 and yTiro <= 768 and yTiro >= 384)
				SetSpritePosition(tiroSprite, getSpriteX(tiroSprite) + direcaoY, getSpriteY(tiroSprite) + direcaoX)
				endif
			if(xTiro >=  512 and xTiro <= 1024 and yTiro <= 768 and yTiro >= 384)
				SetSpritePosition(tiroSprite, getSpriteX(tiroSprite) + direcaoY, getSpriteY(tiroSprite) + direcaoX)
				endif
			if(getSpriteX(tiroSprite) > 1024 or GetSpriteX(tiroSprite) < 0 or getSpriteY(tiroSprite) < 0  or getSpriteY(tiroSprite) > 768)
					SetSpriteVisible(tiroSprite, 0)
					tiroC = 1
					endif
			
			if(GetRawKeyState(82))
				SetSpriteVisible(tiroSprite, 0)
				TiroC = 1
				endif
				
			endif 
	endfunction

function Spawn(enemy, x, y)
	SetSpritePosition(enemy, x, y)
	endfunction

function Collision()
    
    if(GetSpriteCollision(enemy1, animacao1Sprite))
        SetSpritePosition(enemy1, 1600, 1600)
        tempoInimigo1 = tempo
        tempoTiro1 = 0
        vidas = vidas - 1
    endif
    
     if(GetSpriteCollision(enemy2, animacao1Sprite))
        SetSpritePosition(enemy2, 1600, 1600)
        tempoInimigo2 = tempo
        tempoTiro1 = 0
        vidas = vidas - 1
    endif
    
    if(GetSpriteCollision(enemy3, animacao1Sprite))
        SetSpritePosition(enemy3, 1600, 1600)
        tempoInimigo3 = tempo
        tempoTiro1 = 0
        vidas = vidas - 1
    endif
    
    if(GetSpriteCollision(enemy4, animacao1Sprite))
        SetSpritePosition(enemy4, 1600, 1600)
        tempoInimigo4 = tempo
        tempoTiro1 = 0
        vidas = vidas - 1
    endif
endfunction

function KillTiro()
	
	if(GetSpriteCollision(tiroSprite, enemy1))
		pontos = pontos + 1
        SetSpritePosition(enemy1, 1600, 1600)
        tempoInimigo1 = tempo
        SetSpritePosition(tiroSprite, 2000, 2000)
        PlaySound(6, 50)
    endif
    
    if(GetSpriteCollision(tiroSprite, enemy2))
		pontos = pontos + 1
        SetSpritePosition(enemy2, 1600, 1600)
        tempoInimigo2 = tempo
        SetSpritePosition(tiroSprite, 2000, 2000)
        PlaySound(6, 50)
    endif
    
    if(GetSpriteCollision(tiroSprite, enemy3))
		pontos = pontos + 1
        SetSpritePosition(enemy3, 1600, 1600)
        tempoInimigo3 = tempo
        SetSpritePosition(tiroSprite, 2000, 2000)
        PlaySound(6, 50)
    endif
    
    if(GetSpriteCollision(tiroSprite, enemy4))
		pontos = pontos + 1
        SetSpritePosition(enemy4, 1600, 1600)
        tempoInimigo4 = tempo
        SetSpritePosition(tiroSprite, 2000, 2000)
        PlaySound(6, 50)
    endif
    
	endfunction
	
function respawn()
	if(tempo > 3 and tempo = tempoInimigo1 + 3)  
        SetSpritePosition(enemy1, random(400,600), 140)
        tempoInimigo1 = 0
    endif
    
    if(tempo > 3 and tempo = tempoInimigo2 + 3)  
        SetSpritePosition(enemy2, 150, random(300, 400))
        tempoInimigo2 = 0
    endif
    

    if(tempo > 3 and tempo = tempoInimigo3 + 3)  
        SetSpritePosition(enemy3, 800, random(400, 500))
        tempoInimigo3 = 0
    endif
   
    
    if(tempo > 3 and tempo = tempoInimigo4 + 3)  
        SetSpritePosition(enemy4, random(400, 500), 620)
        tempoInimigo4 = 0
    endif
	endfunction

function mov(enemy)
	if(tempo = 15)
		velocity = 3
		endif
	if(tempo = 30)
		velocity = 5
		endif
	if(tempo > 30)
	    velocity = 6
		endif
		
	if(getSpriteX(animacao1Sprite) > getSpriteX(enemy))
		SetSpritePosition(enemy, getSpriteX(enemy) + velocity, getSpriteY(enemy))
		endif
	if(getSpriteX(animacao1Sprite) < getSpriteX(enemy))
		SetSpritePosition(enemy, getSpriteX(enemy) - velocity, getSpriteY(enemy))
		endif
		
	if(getSpriteY(animacao1Sprite) > getSpriteY(enemy))
		SetSpritePosition(enemy, getSpriteX(enemy), getSpriteY(enemy) + velocity)
		endif
	if(getSpriteY(animacao1Sprite) < getSpriteY(enemy))
		SetSpritePosition(enemy, getSpriteX(enemy), getSpriteY(enemy) - velocity)
		endif
	endfunction

function play()
	if((GetPointerX() < 500 and GetPointerX() > 300) and (GetPointerY() < 600 and GetPointerY() > 450))
		if(GetPointerPressed())
			menu = 1
			endif
		endif
	endfunction

function help()
	if((GetPointerX() < 700 and GetPointerX() > 400) and (GetPointerY() < 600 and GetPointerY() > 450))
		if(GetPointerPressed())
			menu = 2
			endif
		endif
	endfunction
	
function playHelp()
	if((GetPointerX() < 600 and GetPointerX() > 300) and (GetPointerY() < 700 and GetPointerY() > 450))
		if(GetPointerPressed())
			menu = 1
			endif
		endif
	endfunction

function quit()
	if((GetPointerX() < 600 and GetPointerX() > 400) and (GetPointerY() < 800 and GetPointerY() > 600))
		if(GetPointerPressed())
			end
			endif
		endif
	endfunction
	
function life()
	SetSpriteVisible(lifeSprite1, 1)
	SetSpriteVisible(lifeSprite2, 1)
	SetSpriteVisible(lifeSprite3, 1)
	if(vidas = 3)
		SetSpritePosition(lifeSprite1, 0, 0)
		SetSpritePosition(lifeSprite2, 50, 0)
		SetSpritePosition(lifeSprite3, 100, 0)
		endif
	if(vidas = 2)
		SetSpriteVisible(lifeSprite3, 0)
		SetSpritePosition(lifeSprite1, 0, 0)
		SetSpritePosition(lifeSprite2, 50, 0)
		endif
	if(vidas = 1)
		SetSpriteVisible(lifeSprite3, 0)
		SetSpriteVisible(lifeSprite1, 0)
		SetSpritePosition(lifeSprite2, 0, 0)
		endif
	if(vidas = 0)
		SetSpriteVisible(lifeSprite3, 0)
		SetSpriteVisible(lifeSprite2, 0)
		SetSpriteVisible(lifeSprite1, 0)
		FundoF = 0
		endif
endfunction

function SpawnLife()
	if(mod(tempo, 10) = 0 and auxLife = 0 and tempo > 0)
		SetSpriteVisible(lifeSpawnSprite, 1)
		SetSpritePosition(lifeSpawnSprite, random(300, 600), random(300,500))
		auxLife = 1
		endif
	if(GetSpriteCollision(lifeSpawnSprite, animacao1Sprite))
		PlaySound(5, 20)
		SetSpritePosition(lifeSpawnSprite, 2000, 2000)
		SetSpriteVisible(lifeSpawnSprite, 0)
		if(vidas = 3)
			vidas = 3
		else
			vidas = vidas + 1
		endif
	endif
	if(mod(tempo, 11) = 0)
		auxLife = 0
		endif
	endfunction


function SpawnBoots()
if(tempo = 15)
		SetSpriteVisible(bootsSprite, 1)
		SetSpritePosition(bootsSprite, 512, 320)
		auxBoots = 1
		endif
if(GetSpriteCollision(animacao1Sprite, bootsSprite))
	velocityPerso = 10
	PlaySound(7)
	SetSpritePosition(bootsSprite, 2000, 2000)
	endif
endfunction

function SpawnGun()
if(tempo = 30)
	SetSpriteVisible(gunSprite, 1)
	SetSpritePosition(gunSprite, 512, 324)
	auxGun = 1
	endif
if(GetSpriteCollision(animacao1Sprite, gunSprite))
	velociyGun = 10
	PlaySound(7)
	SetSpritePosition(gunSprite, 2000, 2000)
	endif
	endfunction

