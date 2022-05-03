//
//  ViewController.swift
//  AddVariousNodesAR
//
//  Created by Ravnish Singh on 27/02/22.
//
import UIKit
import ARKit
class ViewController: UIViewController, ARSCNViewDelegate{
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    var nodes: [SCNNode] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.showsStatistics = true
        let scene = SCNScene()
        self.sceneView.scene = scene
        // Do any additional setup after loading the view.
    }
    @IBAction func addCone(_ sender: Any) {
        let cone = SCNNode()
        nodes.append(cone)
        cone.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0, height: 0.3)
        cone.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        cone.geometry?.firstMaterial?.specular.contents = UIColor.white
        cone.position = SCNVector3(0,0,0)
        cone.name = "Cone"
        self.sceneView.scene.rootNode.addChildNode(cone)
    }
    @IBAction func addSphere(_ sender: Any) {
        let sphere = SCNNode()
        nodes.append(sphere)
        sphere.geometry = SCNSphere(radius: 0.3)
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.white
        sphere.position = SCNVector3(0,0,0)
        sphere.name = "Sphere"
        self.sceneView.scene.rootNode.addChildNode(sphere)
    }
    @IBAction func addCylinder(_ sender: Any) {
        let cylinder = SCNNode()
        nodes.append(cylinder)
        cylinder.geometry = SCNCylinder(radius: 0.2, height: 0.3)
        cylinder.geometry?.firstMaterial?.specular.contents = UIColor.white
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        cylinder.position = SCNVector3(0,0,0)
        cylinder.name = "Cylinder"
        self.sceneView.scene.rootNode.addChildNode(cylinder)
    }
    @IBAction func addBox(_ sender: Any) {
        let box = SCNNode()
        nodes.append(box)
        box.geometry = SCNBox(width: 0.1, height: 0.1, length:0.2, chamferRadius: 0.05)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.magenta
        box.geometry?.firstMaterial?.specular.contents = UIColor.white
        box.position = SCNVector3(0,0,0)
        box.name = "Box"
        self.sceneView.scene.rootNode.addChildNode(box)
    }
    @IBAction func resetView(_ sender: Any) {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            for node in nodes {
                node.removeFromParentNode()
            }
        }
        self.sceneView.session.run(configuration, options: [.removeExistingAnchors,.resetTracking])
    }
}
