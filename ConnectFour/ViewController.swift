//
//  ViewController.swift
//  ConnectFour
//
//  Created by YinYifei on 2018-02-16.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = ConnectFour()
    
    override func viewDidLoad() {
        print(game)
        game.Push(at: 0)
        game.Push(at: 0)
        game.Push(at: 0)
        game.Push(at: 0)
        print(game)
    }

}

