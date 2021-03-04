//
//  ViewController.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }//viewDidLoad
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        }//if
        else {
            return .all
        }//else
    }//supportedInterfaceOrientations
    @IBAction func SignUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    // Set the shouldAutorotate to False
    override open var shouldAutorotate: Bool {
       return false
    }//shouldAutorotate

}//HomeViewController

