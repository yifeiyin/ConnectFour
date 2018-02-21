//
//  ViewController.swift
//  ConnectFour
//
//  Created by YinYifei on 2018-02-16.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TubeViews: [TubeView]!
        {
        didSet {
            print(TubeViews.count)
            if TubeViews.count == 7 {
                for index in 0..<TubeViews.count {
                    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(HandleLongPress))
                    longPress.allowableMovement = 5
                    longPress.minimumPressDuration = 0.0
                    longPress.numberOfTapsRequired = 0
                    longPress.numberOfTouchesRequired = 1
                    TubeViews[index].addGestureRecognizer(longPress)
                }
            }
            
        }
    }
    
    @objc func HandleLongPress(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .began:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("began\(index)")
            }
        case .changed:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("changed\(index)")
            }
        case .failed:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("failed\(index)")
            }
        case .cancelled:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("cancelled\(index)")
            }
        case .ended:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("ended\(index)")
            }
        case .possible:
            if let theTube = sender.view as? TubeView,
                let index = TubeViews.index(of: theTube) {
                print("possible\(index)")
            }
        default: break
        }
    }
    
    func UpdateViewFromModel() {
        
    }
    
    var game = ConnectFour()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(game)
        game.Push(at: 0)
        game.Push(at: 0)
        game.Push(at: 0)
        game.Push(at: 0)
        print(game)
    }

}

