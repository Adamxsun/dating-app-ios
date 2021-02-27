//
//  File.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-22.
//

import UIKit

class SignUp: UIViewController {
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var UpText: UILabel!
    @IBOutlet weak var Blank: UITextField!
    @IBOutlet weak var bottombutton: UIButton!
    @IBOutlet weak var Upbutton: UIButton!
    
    var step = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad
    @IBAction func continuebutton(_ sender: UIButton) {
        if step == 1 {
            step = step + 1
            UpText.text = "What is your name?"
            let UserEmail = Blank.text
            Blank.text = "First Name"
            ProgressBar.progress = 0.3
            print(UserEmail)
        }
        else if step == 2 {
            step = step + 1
            UpText.text = "What is your age?"
            let UserName = Blank.text
            Blank.text = "Your age"
            ProgressBar.progress = 0.5
            print(UserName)
        }
        else if step == 3 {
            step = step + 1
            let UserAge = Blank.text
            UpText.text = "I am looking for"
            Blank.isHidden = true
            Upbutton.isHidden = false
            ProgressBar.progress = 0.8
            bottombutton.setTitle("Woman", for: .normal)
        }
        else if step == 4 {
            //let UserGender = ""
            endFunction()
        }
        else if step == 5 {
            let UserMoive = Blank.text
            self.performSegue(withIdentifier: "ThridSegue", sender: self)
        }
    }//continuebutton
    @IBAction func manButton(_ sender: Any) {
        endFunction()
    }
    //this function is used for step 4
    func endFunction(){
        step = step + 1
        UpText.text = "My favorite Movie"
        bottombutton.setTitle("continue", for: .normal)
        Upbutton.isHidden = true
        ProgressBar.progress = 1
        Blank.text = "Movie name"
        Blank.isHidden = false
    }
    
    override open var shouldAutorotate: Bool {
       return false
    }

}

