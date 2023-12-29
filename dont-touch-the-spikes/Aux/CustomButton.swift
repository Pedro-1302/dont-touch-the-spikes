//
//  CustomButton.swift
//  dont-touch-the-spikes
//
//  Created by Pedro Franco on 28/12/23.
//

import Foundation
import SpriteKit

class CustomButton : SKSpriteNode {
    let onButtonPress: () -> ()

    init(iconName: String, text: String, onButtonPress: @escaping () -> ()) {
        
        self.onButtonPress = onButtonPress
        
        let texture = SKTexture(imageNamed: iconName)
        super.init(texture: texture, color: SKColor.white, size: texture.size())
        
        let label = SKLabelNode()
        label.fontName = "Jura"
        label.fontSize = 26
        label.fontColor = SKColor.black
        label.zPosition = 1
        label.verticalAlignmentMode = .center
        label.text = text
        self.addChild(label)
        
        isUserInteractionEnabled = true
    }
    
    init(iconName: String, text: String, onButtonPress: @escaping () -> (), fontSize: CGFloat, fontColor: UIColor) {
        
        self.onButtonPress = onButtonPress
        
        let texture = SKTexture(imageNamed: iconName)
        super.init(texture: texture, color: SKColor.white, size: texture.size())
        
        let label = SKLabelNode()
        label.fontName = "Jura"
        label.fontSize = fontSize
        label.fontColor = fontColor
        label.zPosition = 1
        label.verticalAlignmentMode = .center
        label.text = text
        self.addChild(label)
        
        isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        onButtonPress()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
