//
//  ViewController.swift
//  ARSliderApp1
//
//  Created by Ravnish Singh on 27/02/22.
//
import UIKit
import ARKit
import SceneKit
class ViewController: UIViewController, ARSCNViewDelegate{
    @IBOutlet weak var sceneView : ARSCNView!
    @IBOutlet weak var Xslider : UISlider!
    @IBOutlet weak var Yslider : UISlider!
    @IBOutlet weak var Zslider : UISlider!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.session.run(configuration)
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        // Do any additional setup after loading the view.
    }
    @IBAction func addButton(_ sender: Any){
        showShape()
    }
    @IBAction func resetButtton(_ sender: Any){
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes{
            (node, _) in
            if node.name == "Sphere"  {
                node.removeFromParentNode()
            }
        }
        sceneView.session.run(configuration, options: [.resetTracking])
    }
    func showShape(){
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.06)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        node.position = SCNVector3(Xslider.value, Yslider.value, Zslider.value)
        node.name = "Sphere"
        sceneView.scene.rootNode.addChildNode(node)
    }
}

