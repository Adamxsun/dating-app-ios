//
//  File.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-24.
//

import UIKit

class SignUp: UIViewController {
    
    @IBOutlet weak var genderBar: UISegmentedControl!
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var UpText: UILabel!
    @IBOutlet weak var Blank: UITextField!
    @IBOutlet weak var bottombutton: UIButton!
    @IBOutlet weak var Upbutton: UIButton!
    @IBOutlet weak var genderText: UILabel!
    
    static var UserGender = ""
    static var UserMovie = ""
    static var UserEmail = ""
    static var UserName = ""
    static var UserAge = ""
    static var UserSelfGender = ""
    var step = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad
    @IBAction func continuebutton(_ sender: UIButton) {
        if step == 1 {
            if Blank.text!.isEmail == true {
                step = step + 1
                UpText.text = "What is your name?"
                SignUp.UserEmail = Blank.text!
                Blank.text = "First Name"
                ProgressBar.progress = 0.3
                warningText.isHidden = true
            }
            else
            {
                warningText.isHidden = false
            }
        }//1
        else if step == 2 {
            step = step + 1
            UpText.text = "What is your age?"
            SignUp.UserName = Blank.text!
            Blank.text = "Your age"
            ProgressBar.progress = 0.5
        }//2
        else if step == 3 {
            if Blank.text?.isNumeric == true {
                step = step + 1
                SignUp.UserAge = Blank.text!
                UpText.text = "I am looking for"
                Blank.isHidden = true
                Upbutton.isHidden = false
                ProgressBar.progress = 0.8
                
                genderBar.isHidden = false
                genderText.isHidden = false
                warningText.isHidden = true
                bottombutton.setTitle("Woman", for: .normal)}
            else{
                warningText.text = "Please check if age is correct"
                warningText.isHidden = false
            }
        }//3
        else if step == 4 {
            SignUp.UserGender = "woman"
            endFunction()
        }//4
        else if step == 5 {
            SignUp.UserMovie = Blank.text!
            self.performSegue(withIdentifier: "ThridSegue", sender: self)
        }//5
    }//continuebutton
    @IBAction func manButton(_ sender: Any) {
        SignUp.UserGender = "man"
        endFunction()
    }//4

    func endFunction(){
        step = step + 1
        UpText.text = "My favorite Movie"
        bottombutton.setTitle("continue", for: .normal)
        Upbutton.isHidden = true
        ProgressBar.progress = 1
        Blank.text = "Movie name"
        Blank.isHidden = false
        if genderBar.numberOfSegments == 0{
            SignUp.UserSelfGender = "man"
        }
        else if genderBar.numberOfSegments == 1 {
            SignUp.UserSelfGender = "LGBTQ"
        }
        else
        {
            SignUp.UserSelfGender = "woman"
        }
        genderBar.isHidden = true
        genderText.isHidden = true
    }//endFunction
    
    override open var shouldAutorotate: Bool {
       return false
    }//shouldAutorotate

}//SignUp

extension String {
        var isEmail: Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
           let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }

        var isNumeric: Bool {
            guard self.count > 0 else { return false }
            let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            return Set(self).isSubset(of: nums)
        }
}//string
