//
//  GameScene.swift
//  AvaiableFonts
//
//  Created by Bernardo Sarto de Lucena on 2/9/18.
//  Copyright © 2018 Bernardo Sarto de Lucena. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var familyIndex: Int = -1
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        showNextFamily()
        
    }
    
    func showCurrentFamily() -> Bool {
        // You remove all of the children from the scene so that you start with a blank slate.
        removeAllChildren()
        
        // You get the current family name based on the familyIndex that you increment with each tap.
        let familyName = UIFont.familyNames[familyIndex]
        
        // UIFont has another helper method to get the names of the fonts within a family, named fontNames(forFamilyName:). You call this here and store the results. If the results array is empty, do not show this font family. You also log out the family name, in case you’re curious about it.
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        
        if fontNames.count == 0 {
            return false
        }
        
        print("Family: \(familyName)")
        
        // You then loop through fontNames and create a label using each font; the text of each label displays the name of the corresponding font. Since labels are the subject of this chapter, you’ll review them in more detail next.
        for (idx, fontName) in fontNames.enumerated() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.fontSize = 50
            label.position = CGPoint(
                x: size.width / 2,
                y: (size.height * (CGFloat(idx+1))) /
                    (CGFloat(fontNames.count)+1))
            label.verticalAlignmentMode = .center
            addChild(label)
        }
        
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        showNextFamily()
        
    }
    
    func showNextFamily() {
        var familyShown = false
    
        repeat {
            familyIndex += 1
            if familyIndex >= UIFont.familyNames.count {
                familyIndex = 0
            
        }
            
        familyShown = showCurrentFamily()
        
        } while !familyShown
        
    }
    
}
