//
//  ViewController.swift
//  TextARApp
//
//  Created by Ravnish Singh on 26/02/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.session
            .run(configuration)
        sceneView.showsStatistics = true
        
        let text = SCNNode()
        text.geometry = SCNText(string: "SINGH_RAVNISH", extrusionDepth: 0.7)
        text.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        text.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(text)
        
    }
}
