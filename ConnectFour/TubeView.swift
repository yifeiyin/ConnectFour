//
//  TubeView.swift
//  ConnectFour
//
//  Created by YinYifei on 2018-02-19.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import UIKit

class TubeView: UIView {
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    var identifier = getUniqueIdentifier()
    
//    init(){
//        let tap = UITapGestureRecognizer(target: ViewController, action: #selector(HandleTap))
//        tap.numberOfTapsRequired = 1
//        tap.numberOfTouchesRequired = 1
//        addGestureRecognizer(tap)
//    }
    
    override func draw(_ rect: CGRect) {
        for altitude in 0..<7 {
            let center1 = CGPoint(x: bounds.maxX / 2.0, y: bounds.maxY / 6.0 * CGFloat(altitude) + (bounds.maxY / 6.0 / 2))
            let path = UIBezierPath()
            path.addArc(withCenter: center1, radius: bounds.maxX*0.35, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            path.lineWidth = 6.0
            UIColor.white.setFill()
            UIColor.gray.setStroke()
            path.stroke()
            path.fill()
        }
    }


}
