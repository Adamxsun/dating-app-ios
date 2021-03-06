//
//  profile.swift
//  dating
//
//  Created by Xiao Sun on 2021-03-05.
//

import UIKit
class profile: UIViewController {
    
    @IBOutlet weak var numberLike: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var targetGender: UILabel!
    @IBOutlet weak var fMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fMovie.text = "Favorite Movie : \(SignUp.UserMovie)"
        targetGender.text = "Looking For :  \(SignUp.UserGender)"
        email.text = "Email : \(SignUp.UserEmail)"
        profilePhoto.image = UploadView.userImage
        age.text = "Age : \(SignUp.UserAge)"
        userName.text = SignUp.UserName
        gender.text = "Gender : \(SignUp.UserSelfGender)"
        numberLike.text = "\(countLike())"
    }//viewDidlOAD
    override open var shouldAutorotate: Bool {
       return false
    }//shoudaUTOrotate
    
    func countLike() -> Int {
        var sum = 0
        for (_,value) in mainPage.user{
            if value["match"] == "true" {
                sum += 1
            }//if
        }//for
        return sum
    }//countLike
    
}//UploadView
