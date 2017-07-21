//
//  ViewController.swift
//  Art
//
//  Created by Diya Jolie Mohan on 7/19/17.
//  Copyright © 2017 Diya Jolie Mohan. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    var length: Int = 10
    var hCount: Int = 0
    var wCount: Int = 0
    var currentColor: UIColor = .black
    var buttonArr: [UIButton] = []
    var buttonArr2: [UIButton] = []
//    var buttonCenter: [UIButton: CGPoint] = [:]
    
    let screenSize = UIScreen.main.bounds
    let picView = UIView(frame: CGRect(x: 7, y: 130, width: 400, height: 490))
    let toolView = UIView(frame: CGRect(x: 7, y: 630, width: 400, height: 100))
    let toolView2 = UIView(frame: CGRect(x: 7, y: 20, width: 400, height: 100))
    let drawView = UIView(frame: CGRect(x: 15, y: 15, width: 25, height: 25))
    
    let buttonRed = UIButton(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
    let buttonBlue = UIButton(frame: CGRect(x: 85, y: 25, width: 50, height: 50))
    let buttonGreen = UIButton(frame: CGRect(x: 145, y: 25, width: 50, height: 50))
    let buttonYellow = UIButton(frame: CGRect(x: 205, y: 25, width: 50, height: 50))
    let buttonBlack = UIButton(frame: CGRect(x: 265, y: 25, width: 50, height: 50))
    let buttonBrown = UIButton(frame: CGRect(x: 325, y: 25, width: 50, height: 50))
    
    let buttonClear = UIButton(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
    let buttonUndo = UIButton(frame: CGRect(x: 85, y: 25, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(picView)
        view.addSubview(toolView)
        view.addSubview(toolView2)
        
        toolView.addSubview(buttonRed)
        toolView.addSubview(buttonBlue)
        toolView.addSubview(buttonGreen)
        toolView.addSubview(buttonYellow)
        toolView.addSubview(buttonBlack)
        toolView.addSubview(buttonBrown)
        
        toolView2.addSubview(buttonClear)
        toolView2.addSubview(buttonUndo)
        
        buttonRed.backgroundColor = .red
        buttonBlue.backgroundColor = .blue
        buttonGreen.backgroundColor = .green
        buttonYellow.backgroundColor = .yellow
        buttonBlack.backgroundColor = .black
        buttonBrown.backgroundColor = .brown
        
        buttonClear.backgroundColor = .black
        buttonUndo.backgroundColor = .black
        
        buttonClear.setTitle("Clear", for: .normal)
        buttonUndo.setTitle("Undo", for: .normal)
        
        buttonRed.addTarget(self, action: #selector(buttonRedP), for: .touchDown)
        buttonBlue.addTarget(self, action: #selector(buttonBlueP), for: .touchDown)
        buttonGreen.addTarget(self, action: #selector(buttonGreenP), for: .touchDown)
        buttonYellow.addTarget(self, action: #selector(buttonYellowP), for: .touchDown)
        buttonBlack.addTarget(self, action: #selector(buttonBlackP), for: .touchDown)
        buttonBrown.addTarget(self, action: #selector(buttonBrownP), for: .touchDown)
        
        buttonClear.addTarget(self, action: #selector(buttonClearP), for: .touchDown)
        buttonUndo.addTarget(self, action: #selector(buttonUndoP), for: .touchDown)
        
        create()
        view.backgroundColor = UIColor.cyan
        picView.backgroundColor = UIColor.white
        toolView.backgroundColor = UIColor.white
        toolView2.backgroundColor = UIColor.white
        drawView.backgroundColor = UIColor.black
        
        picView.addSubview(drawView)
        drawView.layer.cornerRadius = 12
        drawView.layer.masksToBounds = true
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.drawView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func create() {
        while (CGFloat(hCount) < picView.frame.height) {
            while (CGFloat(wCount) < picView.frame.width) {
                let button = UIButton(frame: CGRect(x: wCount, y: hCount, width: length, height: length))
                button.addTarget(self, action: #selector(buttonP), for: .touchDown)
                
                
                picView.addSubview(button)
                wCount +=  length
                
                buttonArr2.append(button)
                
//                for button in buttonArr2 {
//                    buttonCenter[button] = button.center
//                }
                
            }
            wCount = 0
            hCount += length
        }
    }
    
    func buttonP(button: UIButton) {
        button.backgroundColor = currentColor
        buttonArr.append(button)
    }
    func buttonRedP(sender: UIButton) {
        currentColor = .red
    }
    func buttonBlueP(sender: UIButton) {
        currentColor = .blue
    }
    func buttonGreenP(sender: UIButton) {
        currentColor = .green
    }
    func buttonYellowP(sender: UIButton) {
        currentColor = .yellow
    }
    func buttonBlackP(sender: UIButton) {
        currentColor = .black
    }
    func buttonBrownP(sender: UIButton) {
        currentColor = .brown
    }
    
    func buttonClearP(sender: UIButton) {
        for button in buttonArr {
            button.backgroundColor = UIColor.white
        }
    }
    
    func buttonUndoP(sender: UIButton) {
        if buttonArr != [] {
            buttonArr.last!.backgroundColor = UIColor.white
            buttonArr.popLast()
        }
    }
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
            
            
//            for (button, center) in buttonCenter {
//                print("button center: \(center), drawView center: \(drawView.center)")
//                if center == drawView.center {
//                    
//                    buttonP(button: button)
//                    print("it works")
//                }
//            }
            
        }
        
       // func sizer(button: UIButton) {
            
            for button in buttonArr2 {
                let rangeX = (((button.frame.size.width / 2) - button.center.x)...((button.frame.size.width / 2) + button.center.x))
                let rangeY = (((button.frame.size.height / 2) - button.center.y)...((button.frame.size.height / 2) + button.center.y))
                
                if rangeX.contains(drawView.center.x) && rangeY.contains(drawView.center.y) {
                    self.buttonP(button: button)
                    print("it works")
                }
            }
            
    //}
    
    }
}










