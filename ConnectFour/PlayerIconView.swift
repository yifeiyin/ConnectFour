//
//  PlayerIconView.swift
//  ConnectFour
//
//  Created by YinYifei on 2018-02-23.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import UIKit

class PlayerIconView: UIImageView {

    var currentState: State = .selected
    
    func CrossDissolveImage(toImage image: UIImage, toState: State) {
        var factor: CGFloat
        switch (self.currentState, toState) {
        case (.selected, .selected): factor = 1
        case (.unselected, .unselected): factor = 1
        case (.selected, .unselected): factor = AnimationConstants.zoomFactor
        case (.unselected, .selected): factor = 1.0 / AnimationConstants.zoomFactor
        }
        print(currentState, toState, factor, terminator: "")
        print(self.frame, terminator: "")
        currentState = toState
        UIView.transition(with: self,
                          duration: AnimationConstants.duration,
                          options: [UIViewAnimationOptions.transitionCrossDissolve, .allowUserInteraction,],
                          animations: {
                            self.image = image;
                            self.frame = self.frame.zoom(by: factor)
        }
        )
        print(self.frame)
        
    }
    
    enum State {
        case selected
        case unselected
    }
    
    struct AnimationConstants {
        static let duration: TimeInterval = 1
        static let zoomFactor: CGFloat = 0.4
    }
}
