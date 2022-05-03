//
//  ViewController.swift
//  relativePositionARApp
//
//  Created by Ravnish Singh on 12/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
    let configuration = ARWorldTrackingConfiguration()

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.session.run(configuration)
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let sphere = SCNNode()
        sphere.geometry = SCNSphere(radius: 0.2)
        sphere.geometry?.firstMaterial?.diffuse.contents =
        
        UIImage(named: "vincent.jpg")
        sphere.position = SCNVector3(0,-0.2,0)
        
        let cone = SCNNode()
        cone.geometry = SCNCone(topRadius: 0, bottomRadius: 0.5, height: 0.25)
        cone.geometry?.firstMaterial?.diffuse
            .contents = UIColor.black
        cone.position = SCNVector3(0, 0.7, 0)
        sphere.addChildNode(cone)
        sceneView.scene.rootNode.addChildNode(sphere)
    }
}

