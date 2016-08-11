//
//  GameScene.swift
//  Core
//
//  Created by Kai Drayton-Yee on 7/18/16.
//  Copyright (c) 2016 Kai Drayton-Yee. All rights reserved.
//

import SpriteKit
import AVFoundation

/////////////////////////// START! ///////////////////////////

enum GameSceneState {
    case PlayGame, CheckingWinOrLose, GameOver, CheckingLevels, Pause, Home, Intro
}

class GameScene: SKScene {
    
    var counter = 0
    var numRingCounterForLevel = 0
    var circleOneIsSpinning = true
    var circleTwoIsSpinning = true
    var theCircleIsSpinning = true
    
    
    var timer = 200
    var yourLabel: UILabel = UILabel()
   
    
    var ringsLeftSpinning = 0
    
    
    //level detection aids
    var levelClicked = 0
    var forba = 1
    var ALBTouch = 0
    
    //win aids
    var ARRO = 0
    var ARRT = 0
    var winCount = 0
    
    
    //tutorial aids
    let fingerOne = SKSpriteNode(texture: SKTexture(imageNamed: "fing0"), color: UIColor.blueColor(), size: CGSize(width: 60, height: 60))
    let fingerTwo = SKSpriteNode(texture: SKTexture(imageNamed: "fing1"), color: UIColor.blueColor(), size: CGSize(width: 60, height: 60))
    let tutorialBlockOne = SKSpriteNode(texture: SKTexture(imageNamed: "PButton"), color: UIColor.blueColor(), size: CGSize(width: 200, height: 100))
    let tutorialBlockTwo = SKSpriteNode(texture: SKTexture(imageNamed: "PLButton"), color: UIColor.blueColor(), size: CGSize(width: 200, height: 100))
    
    
    //rotation counter aid
    let const = CGFloat(12)
    
    //win lose aids
    let youWinScreen = SKSpriteNode(texture: SKTexture(imageNamed: "winla"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    let youLoseScreen = SKSpriteNode(texture: SKTexture(imageNamed: "losela"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    var whatsGoing = false
    
    //test aids
    var circleOne: SKSpriteNode!
    var circleTwo: SKSpriteNode!
    var theCircle: SKSpriteNode!
    
    //blackout aids
   var blackOutScreen = SKSpriteNode!.self
    
    //win lose aids
    var circSi = 500
    var wantToEnd = false
    let bCircYea = SKSpriteNode(color: UIColor.clearColor(), size: CGSize(width: 0, height: 0))
    
    
    //menu aids
    let menu0 =  SKSpriteNode(texture: SKTexture(imageNamed: "pau0"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    let menu1 =  SKSpriteNode(texture: SKTexture(imageNamed: "pau1"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    let menu2 =  SKSpriteNode(texture: SKTexture(imageNamed: "pau2"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    let menu3 =  SKSpriteNode(texture: SKTexture(imageNamed: "pau3"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    let menu4 =  SKSpriteNode(texture: SKTexture(imageNamed: "pau4"), color: UIColor.blueColor(), size: CGSize(width: 500, height: 170))
    
    
    
    var pixmove: SKAction!
    
    //rotation aids
    var rotateForever: SKAction!
    var rotatecircleTwoForever: SKAction!
    
    
    //pause screen aids
    var loaderScreen: SKSpriteNode!
    var backgroundScreen: SKSpriteNode!
    
    
    //audio aids
    var backgroundSFX: AVAudioPlayer!
    let clickSound = SKAction.playSoundFileNamed("lockMeTwo", waitForCompletion: false)
    
    
    //button aids
    let pauseButton = SKSpriteNode(texture: SKTexture(imageNamed: "PButton"), color: UIColor.blueColor(), size: CGSize(width: 100, height: 50))
    let homeButton = SKSpriteNode(texture: SKTexture(imageNamed: "HButton"), color: UIColor.blueColor(), size: CGSize(width: 100, height: 50))
    let playButton = SKSpriteNode(texture: SKTexture(imageNamed: "PLButton"), color: UIColor.blueColor(), size: CGSize(width: 100, height: 50))
    let levelButton = SKSpriteNode(texture: SKTexture(imageNamed: "LButton"), color: UIColor.blueColor(), size: CGSize(width: 100, height: 50))
    let anotherLevelButton = SKSpriteNode(texture: SKTexture(imageNamed: "AnoB"), color: UIColor.blueColor(), size: CGSize(width: 60, height: 350))
    let skipButton = SKSpriteNode(texture: SKTexture(imageNamed: "SButton"), color: UIColor.blueColor(), size: CGSize(width: 100, height: 50))
    
    
    let pickMe = SKSpriteNode(texture: SKTexture(imageNamed: "pick"), color: UIColor.blueColor(), size: CGSize(width: 60, height: 20))
    
    
    
    //msc aids
    let titleTXT = SKSpriteNode(texture: SKTexture(imageNamed: "titleYea"), color: UIColor.blueColor(), size: CGSize(width: 300, height: 180))
    var theArrow: SKSpriteNode!
    
    
    
    //lists aids
    let arrayOfCircleImages = ["blackRingSetOne", "blackRingSetTwo", "blackRingSetThree", "blackRingSetFour", "blackRingSetFive"]
    let arrayOfNibImages = ["blackNibSetOne", "blackNibSetTwo", "blackNibSetThree", "blackNibSetFour", "blackNibSetFive"]
    
    var RotationDict = [String: Int]()
    var CurrentSpriteData = [String: SKSpriteNode]()
    
    
    var gameState: GameSceneState = .Intro
    
    /////////////////////////////////////////////////////////////////////////////////
    /////////////////////////// basic functions start here //////////////////////////
    /////////////////////////////////////////////////////////////////////////////////
    
    func runCheckState() {
        print("weAreHere")
        switch gameState {
        case .Home:
            weAreOnTheHomePage()
        case .PlayGame:
            weAreOnThePlayGamePage()
        case .CheckingWinOrLose:
            weAreOntheCheckingWinOrLosePage()
        case .GameOver:
            weAreOnTheGameOverPage()
        case .CheckingLevels:
            weAreOnTheCheckingLevelsPage()
        case .Pause:
            weAreOnThePausePage()
        case .Intro:
            weAreOnTheIntroPage()
        }
    }
    
    override func didMoveToView(view: SKView) {
        print("startup")
      // asdf
        
        yourLabel.frame = CGRectMake(50, 150, 200, 21)
        yourLabel.backgroundColor = UIColor.clearColor()
        yourLabel.textColor = UIColor.whiteColor()
        yourLabel.textAlignment = NSTextAlignment.Center
        var theSec = String(format: "%02d", timer % 60)
        var unformatSec = timer % 60
        var unformatMin = (timer - unformatSec) / 60
        var theMin = String(format: "%02d", unformatMin)
        yourLabel.text = "00:\(theMin):\(theSec)"
        yourLabel.font = UIFont(name: "Menlo", size: 20.0)
        self.view!.addSubview(yourLabel)
        
        
        pickMe.position.x = self.frame.height / 2 - 200
        pickMe.position.y = self.frame.height / 2 - 150
        
        addChild(youWinScreen)
        addChild(youLoseScreen)
        youWinScreen.position.x = view.frame.width / 2 - 30
        youWinScreen.position.y = view.frame.height * 2
        youWinScreen.zPosition = 6
        
        youLoseScreen.position.x = view.frame.width / 2
        youLoseScreen.position.y = view.frame.height * 2
        youLoseScreen.zPosition = 6
        
        addChild(menu0)
        addChild(menu2)
        addChild(menu3)
        addChild(menu4)
        
        menu0.position.x = view.frame.width / 2
        menu0.position.y = view.frame.height * 2
        //menu1 gets added each time to become visible
        menu2.position.x = view.frame.width * 2
        menu2.position.y = view.frame.height / 2
        menu3.position.x = view.frame.width * (0 - 2)
        menu3.position.y = view.frame.height / 2
        menu4.position.x = view.frame.width / 2
        menu4.position.y = view.frame.height * (0 - 2)
        
        menu0.zPosition = 5
        menu1.zPosition = 5
        menu2.zPosition = 5
        menu3.zPosition = 5
        menu4.zPosition = 5
        
        menu0.alpha = 0.8
        menu1.alpha = 0.8
        menu2.alpha = 0.8
        menu3.alpha = 0.8
        menu4.alpha = 0.8
        
        
        
        audioSetUp()
        backgroundSetup()
        
        levelButton.position.x = view.frame.width * (4 / 5)
        levelButton.position.y = view.frame.height * (1 / 8)
        levelButton.zPosition = 4
        anotherLevelButton.position.x = view.frame.width / 5
        anotherLevelButton.position.y = view.frame.height / 2
        anotherLevelButton.zPosition = 2
        pauseButton.position.x = view.frame.width * (4 / 5)
        pauseButton.position.y = view.frame.height * (7 / 8)
        pauseButton.zPosition = 4
        playButton.position.x = view.frame.width / 2
        playButton.position.y = view.frame.height * (7 / 12)
        playButton.zPosition = 4
        homeButton.position.x = view.frame.width / 5
        homeButton.position.y = view.frame.height * (1 / 8)
        homeButton.zPosition = 4
        skipButton.position.x = view.frame.width * (4 / 5)
        skipButton.position.y = view.frame.height * (1 / 8)
        skipButton.zPosition = 7
        
        
        titleTXT.position.x = view.frame.width / 2
        titleTXT.position.y = view.frame.height * (7 / 8)
        titleTXT.zPosition = 4
        runCheckState()
    }
    
    func loadGameLevelSelected(){
        let arrayOfLevelToPlay = Levels.infoForLevels[levelClicked]
        //print("\(arrayOfLevelToPlay) is the different circles (with their perameters) for this level")
        self.numRingCounterForLevel = arrayOfLevelToPlay.count - 1
        self.ringsLeftSpinning = numRingCounterForLevel
        theArrow = SKSpriteNode(texture: SKTexture(imageNamed: "daArrow"), color: UIColor.blueColor(), size: CGSize(width: 350, height: 350))
        
        
        let theLight = SKSpriteNode(texture: SKTexture(imageNamed: "blackLight"), color: UIColor.blueColor(), size: CGSize(width: 50, height: 50))
        theLight.position.x = self.frame.width / 2
        theLight.position.y = self.frame.height / 2
        theLight.zPosition = 1
        theLight.alpha = 1.0
        addChild(theLight)
        
        if levelClicked == 0 || levelClicked == 1{
          tutorialOneStart()
        }
        
        
        for circleNumber in 0...numRingCounterForLevel {
            let arrayOfCircleToCreate = arrayOfLevelToPlay[circleNumber]
            //print("\(arrayOfCircleToCreate) is the perameters for the circle # \(circleNumber) being created")
            let currentCircleNum = "currentCircleNum_\(circleNumber)"
            //print("\(label)!")
            
            let rSpeedIs = arrayOfCircleToCreate.sSpeed
            let rSpeed = Double(rSpeedIs)
            
            //gotohere
            let rotate = SKAction.rotateByAngle(CGFloat(M_PI) * 2 / const, duration: rSpeed / 16)
            let rotateBack = SKAction.rotateByAngle(CGFloat(M_PI) * 2 / -const, duration: rSpeed / 16)
            
            
            if circleNumber == 0 {
                theArrow.position.x = self.frame.width / 2
                theArrow.position.y = self.frame.height / 2
                theArrow.zPosition = 1
                theArrow.alpha = 1.0
                addChild(theArrow)
                print("arrow to the knee")
            }
            
            let theCircle = SKSpriteNode(texture: SKTexture(imageNamed: arrayOfCircleImages[circleNumber]), color: UIColor.blueColor(), size: CGSize(width: 350, height: 350))
            let theNib = SKSpriteNode(texture: SKTexture(imageNamed:arrayOfNibImages[circleNumber]), color: UIColor.blueColor(), size: CGSize(width: 350, height: 350))
            
            if self.RotationDict[currentCircleNum] != nil{
                self.RotationDict[currentCircleNum]! += 1
            }else{
                self.RotationDict[currentCircleNum] = 0
            }
            let sprite = theCircle
            sprite.name = "theCircle\(circleNumber)"
            
            
            self.addChild(sprite)
            
            CurrentSpriteData[sprite.name!] = theCircle
            
            sprite.position.x = self.frame.width / 2
            sprite.position.y = self.frame.height / 2
            sprite.zPosition = 0.75
            sprite.alpha = 1.0
            ///////////////////////////////////////////
            //  NIB ROTATION AND DUPLICATION NEEDED  //
            ///////////////////////////////////////////
            sprite.addChild(theNib)
            theNib.position.x = sprite.frame.width / 2
            theNib.position.y = sprite.frame.height / 2
            theNib.zPosition = 1
            theNib.anchorPoint = CGPointMake(1.0,1.0)
            
            let updateDegreeCounter = SKAction.runBlock{
                self.incrementCircle(currentCircleNum)
            }
            
            let seqOne = SKAction.sequence([rotate, updateDegreeCounter])
            let repeatLoopOne = SKAction.repeatActionForever(seqOne)
            let seqTwo = SKAction.sequence([rotateBack, updateDegreeCounter])
            let repeatLoopTwo = SKAction.repeatActionForever(seqTwo)
            let anotherLoopOne = SKAction.repeatActionForever(rotate)
            let anotherLoopTwo = SKAction.repeatActionForever(rotateBack)
            
            
            if arrayOfCircleToCreate.sMoves == 1{
                sprite.runAction(repeatLoopOne)
                if sprite.name == "theCircle0"{
                    theArrow.runAction(anotherLoopOne)
                }
            }else{
                sprite.runAction(repeatLoopTwo)
                if sprite.name == "theCircle0"{
                    theArrow.runAction(anotherLoopTwo)
                }
            }
        }
    }
    
    func checkWinOrLose(){
        //easy wintest code
        // normalizeRotationDict()
        if levelClicked != 0 {
            for ring in 0...numRingCounterForLevel - 1{
                let ringRotOne = self.RotationDict["currentCircleNum_\(ring)"]
                let ringRotTwo = self.RotationDict["currentCircleNum_\(ring + 1)"]
                
                let arrayOfCircles = Levels.infoForLevels[levelClicked]
                let currentCircle = arrayOfCircles[ring]
                let nextCircle = arrayOfCircles[ring + 1]
                
                let pMoveOne = currentCircle.sMoves
                let pMoveTwo = nextCircle.sMoves
                // print("\(ringRotOne) next \(ringRotTwo)")
    ////////////////////////////////////////////////////////////////////////////////////////
                
                if pMoveOne == 1{
                    self.ARRO = ringRotOne! % Int(const)
                    
                }else{
                    self.ARRO = Int(const) - ringRotOne! % Int(const)
                }
                if pMoveTwo == 1{
                    self.ARRT = ringRotTwo! % Int(const)
                }else{
                    self.ARRT = Int(const) - ringRotTwo! % Int(const)
                }
                // print(RotationDict)
                
                print(" does \(ARRO) almost == \(ARRT) ?")
                if ARRO == ARRT || ARRO + 1 == ARRT || ARRO - 1 == ARRT {
                    print("YES")
                    winCount += 1
                }else{
                    print("NO")
                }
                
            }
            
            if levelClicked == 1 {
                tutorialOneEnd()
            }
            
            if numRingCounterForLevel - winCount == 0 {
                print("\(winCount) won out of \(numRingCounterForLevel)")
                print("WE WON!!!")
                whatsGoing = true
                winCount = 0
                winLoseAnims()
                gameIsEnded()
            }else{
                print("\(winCount) won out of \(numRingCounterForLevel)")
                print("better luck next time")
                whatsGoing = false
                winLoseAnims()
                winCount = 0
                gameState = .GameOver
                runCheckState()
            }
            
        }else{
            tutorialOneEnd()
            whatsGoing = true
            //cannot lose tutorial level 0
            winLoseAnims()
            gameIsEnded()
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////
    //////////////////////  what to do per gamestate.......  //////////////////
    ///////////////////////////////////////////////////////////////////////////
    func weAreOnTheIntroPage(){
        print("we are on the \(gameState) page")
        addChild(skipButton)
        createIntroAnimation()
        createBackgroundAnimation()
        
    }
    
    func weAreLeavingTheIntroPage(){
        skipButton.removeFromParent()
        fadeTransitionOut()
    }
    
    func weAreOnTheHomePage(){
        print("we are on the \(gameState) page")
        addChild(levelButton)
        addChild(titleTXT)
        createBackgroundAnimation()
        countdown()
        var clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(GameScene.countdown), userInfo: nil, repeats: true)
        
        
        
    }
    
    func weAreLeavingTheHomePage(){
        levelButton.removeFromParent()
        titleTXT.removeFromParent()
        
        
    }
    
    func weAreOnThePlayGamePage(){
        print("we are on the \(gameState) page")
        //testLevel()
        loadGameLevelSelected()
        addChild(pauseButton)
        createBackgroundAnimation()
    }
    
    func weAreLeavingThePlayGamePage(){
        pauseButton.removeFromParent()
    }
    
    func weAreOnTheCheckingLevelsPage(){
        print("we are on the \(gameState) page")
        if levelClicked > 14{
            levelClicked = 0
        }
        print("You Are On Level \(levelClicked + 1)")
        
     
        
        
        addChild(homeButton)
        addChild(playButton)
        addChild(anotherLevelButton)
        createBackgroundAnimation()
        levelPix()
        pickMe.zPosition = 2
        
        addChild(pickMe)
        // theLight.alpha = 1.0
        
    }
    
    func weAreLeavingtheCheckingLevelsPage(){
        homeButton.removeFromParent()
        playButton.removeFromParent()
        anotherLevelButton.removeFromParent()
        pickMe.removeFromParent()
    }
    
    func weAreOnTheGameOverPage(){
        print("we are on the \(gameState) page")
        weAreLeavingThePlayGamePage()
        quitCurrentLevel()
        addChild(playButton)
        addChild(homeButton)
        addChild(levelButton)
        createBackgroundAnimation()
        
    }
    
    func weAreLeavingTheGameOverPage(){
        playButton.removeFromParent()
        levelButton.removeFromParent()
        homeButton.removeFromParent()
    }
    
    func weAreOnThePausePage(){
        print("we are on the \(gameState) page")
        menuCreation()
        loaderScreen = SKSpriteNode(color: UIColor.whiteColor().colorWithAlphaComponent(0.5), size: CGSize(width: view!.frame.width, height: view!.frame.height))
        loaderScreen.position.x = view!.frame.width / 2
        loaderScreen.position.y = view!.frame.height / 2
        loaderScreen.zPosition = 3
        addChild(loaderScreen)
        
        addChild(playButton)
        addChild(levelButton)
        addChild(homeButton)
        createBackgroundAnimation()
        
        //////////////////////////////////////////
        // data needed to also check win state  //
        //////////////////////////////////////////
        
    }
    
    func weAreLeavingThePausePage(){
        homeButton.removeFromParent()
        playButton.removeFromParent()
        levelButton.removeFromParent()
        menuDeletion()
    }
    
    func weAreOntheCheckingWinOrLosePage(){
        print("we are on the \(gameState) page")
        checkWinOrLose()
        
        
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////  test functions ////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    
    func testLevel(){
        let rotate = SKAction.rotateByAngle(CGFloat(M_PI) * 2, duration: 6)
        rotateForever = SKAction.repeatActionForever(rotate)
        let rotatecircleTwo = SKAction.rotateByAngle(CGFloat(M_PI) * 2, duration: 4)
        rotatecircleTwoForever = SKAction.repeatActionForever(rotatecircleTwo)
        
        circleOne = SKSpriteNode(texture: SKTexture(imageNamed:"blackRingSetOne"), color: UIColor.blueColor(), size: CGSize(width: 400, height: 400))
        addChild(circleOne)
        circleOne.position.x = view!.frame.width / 2
        circleOne.position.y = view!.frame.height / 2
        circleOne.runAction(rotateForever)
        
        circleTwo = SKSpriteNode(texture: SKTexture(imageNamed:"blackRingSetTwo"), color: UIColor.blueColor(), size: CGSize(width: 400, height: 400))
        addChild(circleTwo)
        circleTwo.position.x = view!.frame.width / 2
        circleTwo.position.y = view!.frame.height / 2
        circleTwo.runAction(rotatecircleTwoForever)
        print("both the circleOne and the circleTwo have started moving")
        
        let nibOne = SKSpriteNode(texture: SKTexture(imageNamed:"blackNibSetFive"), color: UIColor.blueColor(), size: CGSize(width: 400, height: 400))
        let nibTwo = SKSpriteNode(texture: SKTexture(imageNamed:"blackNibSetFour"), color: UIColor.blueColor(), size: CGSize(width: 400, height: 400))
        
        circleOne.addChild(nibOne)
        nibOne.anchorPoint = CGPointMake(1.0,1.0)
        nibOne.position.x = circleOne.frame.width / 2
        nibOne.position.y = circleOne.frame.height / 2
        
        circleTwo.addChild(nibTwo)
        nibTwo.anchorPoint = CGPointMake(1.0,1.0)
        nibTwo.position.x = circleTwo.frame.width / 2
        nibTwo.position.y = circleTwo.frame.height / 2
    }
    func testAllLevels(){
        ALBTouch += 1
        if forba == 1{
            levelClicked += 1
            print("You Are On Level \(levelClicked + 1)")
            if levelClicked >= 14{
                forba = 2
            }
        }else{
            levelClicked = 0
            ALBTouch = 0
            print("You Are On Level \(levelClicked + 1)")
            forba = 1
        }
        levelPix()
    }
    
    func testTouch(){
        //////////
        let touch = 1
        //////////
        
        if touch != pauseButton && counter < 1 && counter >= 0 {
            circleOne.removeAllActions()
            counter += 1
            self.runAction(clickSound)
            circleOneIsSpinning = false
            print("the circleOne has stopped moving and the counter's count is \(counter)")
            
        }else if counter < 2 && counter >= 1 {
            circleTwo.removeAllActions()
            counter += 1
            self.runAction(clickSound)
            circleTwoIsSpinning = false
            print("the circleTwo has stopped moving and the counter's count is \(counter)")
            
        }else if counter < 3 &&  counter >= 2 && circleTwoIsSpinning == false && circleOneIsSpinning == false{
            
            print("check win/lose states here")
            //if state = playgame and #of rings/#of rings (all) are stopped proceed to chekingwinorlose
            //if state = checkingwinorlose call checkwinorlose function
            
            counter = 0
            
            
            circleOne.runAction(rotateForever)
            circleTwo.runAction(rotatecircleTwoForever)
            print("both the circleOne and the circleTwo have started moving again and the counter's count is \(counter)")
        }
    }
    
    func testTouchTwo(){
        
        for eachChild in children {
            var theActualChildName: String
            if let childName = eachChild.name {
                theActualChildName = childName
            } else {
                theActualChildName = "Undefined"
            }
            print("NODE NAME = \(theActualChildName)")
        }
        for anum in 0...CurrentSpriteData.count{
            print("\(CurrentSpriteData["theCircle\(anum + 1)"])")
        }
        
        print("\(CurrentSpriteData)")
        
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////  helper functions ///////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////
    
    func countdown() {
        timer -= 1
        print("\(timer)")
        var theSec = String(format: "%02d", timer % 60)
        var unformatSec = timer % 60
        var unformatMin = (timer - unformatSec) / 60
        var theMin = String(format: "%02d", unformatMin)
        yourLabel.text = "00:\(theMin):\(theSec)"
        if timer == 0{
            print("youFailed")
        }
    }
    
    func createIntroAnimation(){
        blackOut()
    }

    
    func blackOut(){
        
       let blackOutScreen = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: view!.frame.width * 2, height: view!.frame.height * 2))
        blackOutScreen.zPosition = 5
        blackOutScreen.alpha = 0.0
        addChild(blackOutScreen)
        
        tutorialBlockOne.position.x = self.frame.width * (1 / 32)
        tutorialBlockOne.position.y = self.frame.height * (31 / 32)
        tutorialBlockOne.anchorPoint = CGPointMake(0.0, 1.0)
        tutorialBlockOne.zPosition = 6
        
        tutorialBlockTwo.position.x = self.frame.width * (31 / 32)
        tutorialBlockTwo.position.y = self.frame.height * (1 / 32)
        tutorialBlockTwo.anchorPoint = CGPointMake(1.0, 0.0)
        tutorialBlockTwo.zPosition = 6
        
        blackOutScreen.runAction(SKAction.fadeInWithDuration(2)) {
            self.runAction(SKAction.waitForDuration(6))
            self.addChild(self.tutorialBlockOne)
            self.addChild(self.tutorialBlockTwo)
            self.runAction(SKAction.waitForDuration(6))
        }
        self.runAction(SKAction.waitForDuration(8)){
            self.tutorialBlockOne.removeFromParent()
             self.tutorialBlockTwo.removeFromParent()
             self.runAction(SKAction.waitForDuration(6))
            blackOutScreen.runAction(SKAction.fadeOutWithDuration(2))
        }
    }
    func fadeTransitionIn(){
        
        let blackOutScreen = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: view!.frame.width * 2, height: view!.frame.height * 2))
        blackOutScreen.zPosition = 5
        blackOutScreen.alpha = 0.0
        addChild(blackOutScreen)
        
        
        let One = SKAction.fadeInWithDuration(0.25)
        let Two = SKAction.waitForDuration(0.5)
 
        let sequence = SKAction.sequence([One, Two])
        blackOutScreen.runAction(sequence)
        
    }
    func fadeTransitionOut(){
        
        let blackOutScreen = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: view!.frame.width * 2, height: view!.frame.height * 2))
        blackOutScreen.alpha = 1.0
        blackOutScreen.zPosition = 5
       // blackOutScreen.alpha = 0.0
        addChild(blackOutScreen)
        
        
        let Two = SKAction.waitForDuration(0.5)
        
        let Three = SKAction.fadeOutWithDuration(0.25)
        let sequence = SKAction.sequence([Two, Three])
        blackOutScreen.runAction(sequence)
    }
    
   
    func tutorialOneStart(){
        fingerOne.position.x = self.frame.width * ( 3 / 4)
        fingerOne.position.y = self.frame.height * (3 / 5)
        fingerOne.zPosition = 5
        
        addChild(fingerOne)
        let clickyFinger = SKAction.animateWithTextures([SKTexture(imageNamed: "fing0"), SKTexture(imageNamed: "fing1")], timePerFrame: 0.5)
        let clickyFingerForever = SKAction.repeatActionForever(clickyFinger)
        fingerOne.runAction(clickyFingerForever)
    }
    
    func tutorialOneEnd(){
        fingerOne.removeAllActions()
        fingerOne.removeFromParent()
    }
    
    func levelPix(){
        //to find location of the level picker counter and animate it to move to the next level
        if levelClicked == 0{
            let pixmove = SKAction.moveToY(self.frame.height / 2 - 150, duration: 0.1)
        }else if levelClicked <= 14{
            let numbPixUp = CGFloat(20 * (levelClicked + 1))
            let  pixmove = SKAction.moveToY(self.frame.height / 2 - 150 + numbPixUp, duration: 2)
            pickMe.runAction(pixmove)
        }else{
            levelClicked = 0
            let numbPix = 0
            let pixmove = SKAction.moveToY(self.frame.height / 2 - 150, duration: 2)
        }
        
    }
    
    func menuCreation(){
        let menuMove0 = SKAction.moveToX(view!.frame.width / 2, duration: 1 / 2)
        let menuMove1 = SKAction.moveToY(view!.frame.height * (7 / 12), duration: 1 / 2)
        menu0.runAction(menuMove0)
        addChild(menu1)
        menu2.runAction(menuMove0)
        menu3.runAction(menuMove0)
        menu4.runAction(menuMove0)
        menu0.runAction(menuMove1)
        menu2.runAction(menuMove1)
        menu3.runAction(menuMove1)
        menu4.runAction(menuMove1)
    }
    
    func menuDeletion(){
        menu0.position.x = view!.frame.width / 2
        menu0.position.y = view!.frame.height * 2
        menu1.removeFromParent()
        menu2.position.x = view!.frame.width * 2
        menu2.position.y = view!.frame.height / 2
        menu3.position.x = view!.frame.width * (0 - 2)
        menu3.position.y = view!.frame.height / 2
        menu4.position.x = view!.frame.width / 2
        menu4.position.y = view!.frame.height * (0 - 2)
        
        
    }
    
    func quitCurrentLevel(){
        
        
        let arrayOfLevelToPlay = Levels.infoForLevels[levelClicked]
        self.numRingCounterForLevel = arrayOfLevelToPlay.count - 1
        self.ringsLeftSpinning = numRingCounterForLevel
        
        for circleNumber in 0...numRingCounterForLevel {
            
            let sprite = CurrentSpriteData["theCircle\(circleNumber)"]
            sprite!.removeFromParent()
            if sprite == CurrentSpriteData["theCircle0"] {
                theArrow.removeFromParent()
            }
        }
        //circleOne.removeFromParent()
        //circleTwo.removeFromParent()
        counter = 0
        RotationDict = [:]
        print("game progress deleted")
    }
    
    func winLoseAnims(){
        menuCreation()
        
        let wait4me = SKAction.waitForDuration(0.5)
        let move2 = SKAction.moveToY(self.view!.frame.height * (7 / 12), duration: 1)
        let moveBack2 = SKAction.moveToY(self.view!.frame.height * 2, duration: 0.7)
        let deleteMenu = SKAction.runBlock{
            self.menuDeletion()
        }
        let endCheckAnim = SKAction.sequence([ move2, wait4me, moveBack2, deleteMenu])
        if whatsGoing == true{
            youWinScreen.runAction(endCheckAnim)
            print("timetowin")
            blackOut()
    ///////////////////////////////////////////////////////////
           
        }else{
            youLoseScreen.runAction(endCheckAnim)
            print("timetolose")
            
        }
        
        //let arrowForward = SKAction.resizeToHeight(500, duration: 8.0)
        //theArrow.runAction(arrowForward)
    }
    
    func gameIsEnded(){
        //for if winstate
        print("game is ended")
        weAreLeavingThePlayGamePage()
        quitCurrentLevel()
        
        ///////////////////////////////////////////////////////////
        if 0 <= levelClicked && levelClicked <= 14{
            levelClicked += 1
        }else{
            levelClicked = 0
        }
        gameState = .CheckingLevels
        runCheckState()
    }
    
    func pickLevel(touches: Set<UITouch>, withEvent event: UIEvent?){
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if anotherLevelButton.containsPoint(location){
                //put code here
            }
        }
    }
    
    func audioSetUp(){
        let path = NSBundle.mainBundle().pathForResource("fromInside", ofType:".caf")!
        let url = NSURL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            backgroundSFX = sound
            sound.play()
        } catch {
            print("failedtoload")
        }
        backgroundSFX.numberOfLoops = -1
        backgroundSFX.volume = 1.0
    }
    
    func resetValues(){
        //for when we exit out of a playing game
        backgroundSFX.volume = 1.0
        loaderScreen.removeFromParent()
        print("values are reset")
        
        //bc pause does not recheck gamestate and background anim needs to be relocated (createbackgroundanimation)
        bCircYea.position.x = self.frame.width / 2
        bCircYea.position.y =  0
    }
    
    func incrementCircle(currentCircleNum : String) {
        if let v = self.RotationDict[currentCircleNum] {
            self.RotationDict[currentCircleNum]! += 1
        } else {
            self.RotationDict[currentCircleNum] = 1
        }
   // print("\(currentCircleNum) and \(RotationDict)")
       //print("   ")
    }
    
    
    func backgroundSetup(){
        backgroundScreen = SKSpriteNode(texture: SKTexture(imageNamed:"backgroundSetTwo"), color: UIColor.whiteColor().colorWithAlphaComponent(0.5), size: CGSize(width: view!.frame.width * 3.5, height: view!.frame.height * 2))
        backgroundScreen.alpha = 0.04
        backgroundScreen.position.x = view!.frame.width / 2
        backgroundScreen.position.y = view!.frame.height / 2
        backgroundScreen.zPosition = -4
        addChild(backgroundScreen)
        morebackset()
        
    }
    
    func morebackset(){
        addChild(self.bCircYea)
        
        self.bCircYea.zPosition =  0 - 1
        
        for numyea in 1...5{
            let rotateyea = SKAction.rotateByAngle(CGFloat(M_PI) / 2, duration: Double(numyea) )
            let foreveryea = SKAction.repeatActionForever(rotateyea)
            let circYea = SKSpriteNode(texture: SKTexture(imageNamed: "backCirc_\(numyea)"), color: UIColor.blueColor(), size: CGSize(width: circSi, height: circSi))
            circYea.position.x = bCircYea.frame.width / 2
            circYea.position.y = bCircYea.frame.height / 2
            
            circYea.anchorPoint = CGPointMake(0.5,0.5)
            
            circYea.zPosition =  0 - 1
            circYea.alpha = 0.22
            
            print("background \(numyea)")
            bCircYea.addChild(circYea)
            circYea.runAction(foreveryea)
        }
        
    }
    
    func createBackgroundAnimation(){
        
        if gameState == .Home{
            bCircYea.position.x = self.frame.width / 2
            bCircYea.position.y = self.frame.height / 2
        }else if gameState == .PlayGame || gameState == .GameOver{
            bCircYea.position.x = self.frame.width / 2
            bCircYea.position.y =  0
        }else if gameState == .Pause {
            bCircYea.position.x = self.frame.width / 2
            bCircYea.position.y =  self.frame.height
        }else if gameState == .CheckingLevels{
            bCircYea.position.x = self.frame.width * (5 / 6)
            bCircYea.position.y =  self.frame.height * (5 / 6)
        }else{
            bCircYea.position.x = self.frame.width * 2
            bCircYea.position.y =  self.frame.height * 2
        }
        
        
    }
    
    func NeverRunThis(){
        //
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// user touch functions ////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        if gameState == .Home{
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                }
            }
        }
        else if gameState == .Intro{
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if skipButton.containsPoint(location) {
                    skipButton.texture = SKTexture(imageNamed:"SButtonx")
                }else{
                    
                }
            }
        }
        else if gameState == .PlayGame{
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if pauseButton.containsPoint(location) {
                    pauseButton.texture = SKTexture(imageNamed:"PButtonx")
                }else{
                    
                }
            }
        }
        else if gameState == .CheckingWinOrLose {
            return
            
        }
        else if gameState == .GameOver {
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                }else if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                } else if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                }
            }
        }
        else if gameState == .CheckingLevels{
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                }else if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                }else if anotherLevelButton.containsPoint(location) {
                    ///////////////////////////////////////////////////////////////////////////////////////////asdfasdf
                }else{
                    
                }
            }
        }
        else if gameState == .Pause{
            
            //fix bug with circleOne stopping--pause--circleOne moving again
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                }else if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                }else if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                    
                }
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //apologies for such redunant code :'(
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if gameState == .Home{
                if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                } else{
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                }
            }
            else if gameState == .Intro{
                if skipButton.containsPoint(location) {
                    skipButton.texture = SKTexture(imageNamed:"SButtonx")
                } else{
                    skipButton.texture = SKTexture(imageNamed:"SButton")
                }
            }
            else if gameState == .PlayGame{
                if pauseButton.containsPoint(location) {
                    pauseButton.texture = SKTexture(imageNamed:"PButtonx")
                } else{
                    pauseButton.texture = SKTexture(imageNamed:"PButton")
                }
            }
            else if gameState == .CheckingWinOrLose {
                return
                
            }
            else if gameState == .GameOver {
                if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                } else if homeButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                } else if levelButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                } else{
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                }
            }
            else if gameState == .CheckingLevels{
                if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                } else if homeButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                } else if anotherLevelButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                } else{
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                }
            }
            else if gameState == .Pause{
                
                if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButtonx")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                } else if homeButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButtonx")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                } else if levelButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButtonx")
                } else{
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                }
            }
            
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if gameState == .Home{
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                    
                    weAreLeavingTheHomePage()
                    
                    gameState = .CheckingLevels
                    runCheckState()
                }
            }
        }
        else if gameState == .Intro {
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if skipButton.containsPoint(location) {
                    skipButton.texture = SKTexture(imageNamed:"SButton")
                    weAreLeavingTheIntroPage()
                    
                    gameState = .Home
                    runCheckState()
                    
                }
            }
        }
       else if gameState == .PlayGame{
            
            
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if pauseButton.containsPoint(location) {
                    
                    let arrayOfLevelToPlay = Levels.infoForLevels[levelClicked]
                    self.numRingCounterForLevel = arrayOfLevelToPlay.count - 1
                    self.ringsLeftSpinning = numRingCounterForLevel
                    
                    for circleNumber in 0...numRingCounterForLevel {
                        
                        let sprite = CurrentSpriteData["theCircle\(circleNumber)"]
                        
                        sprite!.removeAllActions()
                    }
                    theArrow.removeAllActions()
                    
                    //circleOne.removeAllActions()
                    //circleTwo.removeAllActions()
                    backgroundSFX.volume = 0.2
                    pauseButton.texture = SKTexture(imageNamed:"PButton")
                    
                    weAreLeavingThePlayGamePage()
                    
                    gameState = .Pause
                    runCheckState()
                }else{
                    self.runAction(clickSound)
                    // testTouch()
                    // testTouchTwo()
                    
                    print("\(numRingCounterForLevel - ringsLeftSpinning) out of \(numRingCounterForLevel)")
                    
                    CurrentSpriteData["theCircle\(numRingCounterForLevel - ringsLeftSpinning)"]!.removeAllActions()
                    
                    
                    if numRingCounterForLevel == ringsLeftSpinning {
                        theArrow.removeAllActions()
                    }
                    ringsLeftSpinning -= 1
                    if ringsLeftSpinning <= -1 {
                        gameState = .CheckingWinOrLose
                        runCheckState()
                    }
                    
                }
            }
        }
        else if gameState == .CheckingWinOrLose {
            return
        }
        else if gameState == .GameOver {
            
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    
                    weAreLeavingTheGameOverPage()
                    
                    gameState = .Home
                    runCheckState()
                    
                }else if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                    
                    weAreLeavingTheGameOverPage()
                    
                    gameState = .CheckingLevels
                    runCheckState()
                    
                } else if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    
                    weAreLeavingTheGameOverPage()
                    
                    gameState = .PlayGame
                    runCheckState()
                }
            }
        }
        else if gameState == .CheckingLevels{
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    
                    weAreLeavingtheCheckingLevelsPage()
                    
                    gameState = .Home
                    runCheckState()
                    
                }else if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    
                    weAreLeavingtheCheckingLevelsPage()
                    
                    gameState = .PlayGame
                    runCheckState()
                }else if anotherLevelButton.containsPoint(location) {
                    //testAllLevels()
                }
            }
        }
        else if gameState == .Pause{
            
            //fix bug with circleOne stopping--pause--circleOne moving again
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if playButton.containsPoint(location) {
                    playButton.texture = SKTexture(imageNamed:"PLButton")
                    
                    let arrayOfLevelToPlay = Levels.infoForLevels[levelClicked]
                    self.numRingCounterForLevel = arrayOfLevelToPlay.count - 1
                    self.ringsLeftSpinning = numRingCounterForLevel
                    
                    for circleNumber in 0...numRingCounterForLevel {
                        
                        let arrayOfLevelToPlay = Levels.infoForLevels[levelClicked]
                        let arrayOfCircleToCreate = arrayOfLevelToPlay[circleNumber]
                        
                        let sprite = CurrentSpriteData["theCircle\(circleNumber)"]
                        let rSpeedIs = arrayOfCircleToCreate.sSpeed
                        let rSpeed = Double(rSpeedIs)
                        
        //////////////////////////////////////////////////////////////////////////////////
                        let rotate = SKAction.rotateByAngle(CGFloat(M_PI) * 2 / const, duration: rSpeed / 16)
                        let rotateBack = SKAction.rotateByAngle(CGFloat(M_PI) * 2 / -const, duration: rSpeed / 16)
                        let currentCircleNum = "currentCircleNum_\(circleNumber)"
                        
                        let updateDegreeCounter = SKAction.runBlock{
                            self.incrementCircle(currentCircleNum)
                        }
                        let seqOne = SKAction.sequence([rotate, updateDegreeCounter])
                        let repeatLoopOne = SKAction.repeatActionForever(seqOne)
                        let seqTwo = SKAction.sequence([rotateBack, updateDegreeCounter])
                        let repeatLoopTwo = SKAction.repeatActionForever(seqTwo)
                        let anotherLoopOne = SKAction.repeatActionForever(rotate)
                        let anotherLoopTwo = SKAction.repeatActionForever(rotateBack)
                        
                        
                        if arrayOfCircleToCreate.sMoves == 1{
                            sprite!.runAction(repeatLoopOne)
                            if sprite!.name == "theCircle0"{
                                theArrow.runAction(anotherLoopOne)
                            }
                        }else{
                            sprite!.runAction(repeatLoopTwo)
                            if sprite!.name == "theCircle0"{
                                theArrow.runAction(anotherLoopTwo)
                            }
                        }
                    }
                    
                    // circleOne.runAction(rotateForever)
                    // circleTwo.runAction(rotatecircleTwoForever)
                    counter = 0
                    
                    addChild(pauseButton)
                    
                    weAreLeavingThePausePage()
                    
                    resetValues()
                    
                    gameState = .PlayGame
                    //runCheckState()
                    
                }else if homeButton.containsPoint(location) {
                    homeButton.texture = SKTexture(imageNamed:"HButton")
                    weAreLeavingThePausePage()
                    
                    quitCurrentLevel()
                    resetValues()
                    
                    gameState = .Home
                    runCheckState()
                    
                }else if levelButton.containsPoint(location) {
                    levelButton.texture = SKTexture(imageNamed:"LButton")
                    weAreLeavingThePausePage()
                    
                    quitCurrentLevel()
                    resetValues()
                    
                    gameState = .CheckingLevels
                    runCheckState()
                }
            }
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        //
    }
    
    ///////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////// Update Functions ////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}