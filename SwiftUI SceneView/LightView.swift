//
//  LightView.swift
//  SwiftUI SceneView
//
//  Created by Kyle Lei on 2024/1/27.
//

import SwiftUI
import SceneKit


struct LightView: View {
    let background: UIColor
    
    var body: some View {
        
        ZStack {
            Color.clear
            
            SceneView(scene: {
                let scene = SCNScene(named: "Sun.usdz")
                scene?.background.contents = background
                
                let node = scene?.rootNode.childNode(withName: "scene", recursively: true)!
                node!.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 4)))
                
                return scene
            }(),
                      options: [
                        .allowsCameraControl,
                        .autoenablesDefaultLighting,
                        .temporalAntialiasingEnabled
                      ])
            .mask(
                Rectangle()
                    .fill(RadialGradient(colors: [.black, .black.opacity(0)], center: .center, startRadius: 50, endRadius: 175))
            )
            .padding()
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height / 2
                   , alignment: .center)
        }
    }
}

#Preview {
    LightView(background: UIColor.white)
}
