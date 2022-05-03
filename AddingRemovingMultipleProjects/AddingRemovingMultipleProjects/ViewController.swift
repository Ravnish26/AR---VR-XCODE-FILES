//
//  ViewController.swift
//  AddingRemovingMultipleProjects
//
//  Created by Ravnish Singh on 26/02/22.
//
import UIKit
import SceneKit
import ARKit
class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    @IBOutlet weak var Xslider: UISlider!
    @IBOutlet weak var Yslider: UISlider!
    @IBOutlet weak var Zslider: UISlider!
    @IBAction func AddButton(_ sender: UIButton) {
        showShape() }
    @IBAction func IBAction(_ sender: UIButton) {
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in if node.name == "shape" {
                  node.removeFromParentNode()
                }
            node.name = "shape"
            }
            sceneView.session.run(configuration, options:
            [.resetTracking])
    }
    func showShape() {
    let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.05); node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
    node.position = SCNVector3(Xslider.value, Yslider.value,Zslider.value)
    node.name = "sphere"
        // node.geometry = SCNSphere(radius: 0.05)
        node.geometry = SCNBox(width: 0.1, height: 0.2,
               length: 0.1, chamferRadius: 0)
            sceneView.scene.rootNode.addChildNode(node)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        // Set the scene to the view
        sceneView.scene = scene
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // Run the view's session
        sceneView.session.run(configuration)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
}
