//
//  mainPage.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-25.
//


import UIKit
import CoreLocation
import UserNotifications
import MapKit
class mainPage: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var popupView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBOutlet weak var movieText: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var matchedText: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var ageView: UITextField!
    let locationManager = CLLocationManager()
    @IBOutlet weak var likebutton: UIButton!
    
    static var user = [1:["name" : "Spider","age" : "23", "gender" : "man","fMovie" : "Spider Man","match":"true"],
                2: ["name" : "Lily","age" : "19", "gender" : "woman","fMovie" : "Truman","match":"false"],
                3: ["name" : "Adam","age" : "19", "gender" : "man","fMovie" : "HarryPotter","match":"false"],
                4: ["name" : "Lucy","age" : "23", "gender" : "woman","fMovie" : "Truman","match":"true"],
                5 :["name" : "Emily","age" : "19", "gender" : "woman","fMovie" : "Truman","match":"false"],
                6: ["name" : "David","age" : "19", "gender" : "man","fMovie" : "Truman","match":"false"],
                7: ["name" : "Zac","age" : "19", "gender" : "man","fMovie" : "Truman","match":"false"],
                8: ["name" : "Joey","age" : "19", "gender" : "man","fMovie" : "Truman","match":"false"]]
    
    static var matchedUser = ""
    static var matchedUserImage = ""
    static var matched = false
    var userOrder = 1
    var genderEmoji = "♂︎"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        //
        blurView.bounds = self.view.bounds
        popupView.bounds = CGRect(x:0,y:0,width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
        
        //
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            }//if
        updateUserView()
        // Do any additional setup after loading the view.
    }//viewdidload
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        }//if
        else {
            return .all
        }//else
    }//supportedInterfaceOrientations
    // Set the shouldAutorotate to False
    override open var shouldAutorotate: Bool {
       return false
    }//shouldAutorotate
    @IBAction func LikeButton(_ sender: Any) {
        movieText.isHidden = true
        if mainPage.user[userOrder]?["match"] == "true"{
            getMarched()
        }
        userOrder += 1
        updateUserView()
    }//LikeButton
    @IBAction func DislikeButton(_ sender: Any) {
        movieText.isHidden = true
        userOrder += 1
        updateUserView()
    }//DislikeButton
    
    func getMarched(){
        mainPage.matchedUser = (mainPage.user[userOrder]?["name"])!
        mainPage.matchedUserImage = String(userOrder)
        animateIn(desiredView: blurView)
        animateIn(desiredView: popupView)
        matchedText.text = "You get matched with \(mainPage.matchedUser)"
        leftImage.image = UIImage(named: mainPage.matchedUserImage)
        rightImage.image = UploadView.userImage
        mainPage.matched = true
    }
    func updateUserView (){
        if mainPage.user[userOrder] != nil{
            
            if SignUp.UserGender == mainPage.user[userOrder]?["gender"]!{
                if SignUp.UserGender == "man"{
                    genderEmoji = "♂︎"
                    ageView.textColor = UIColor.blue
                }
                else{
                    genderEmoji = "♂︎"
                    ageView.textColor = UIColor.systemPink
                }
                photoView.image = UIImage(named: String(userOrder))
                nameView.text = mainPage.user[userOrder]?["name"]
                ageView.text = "\(genderEmoji) \(mainPage.user[userOrder]?["age"] ?? "")"
                
                
                var movieName = mainPage.user[userOrder]?["fMovie"]
                if mainPage.user[userOrder]!["fMovie"] == SignUp.UserMovie {
                    movieText.text = "\(mainPage.user[userOrder]?["name"] ?? "") also likes \(movieName ?? "")"
                    movieText.isHidden = false
                }//
                else
                {
                    movieText.isHidden = true
                }//else
            }//if
            else{
                userOrder += 1
                updateUserView()
            }//else
        }//if
        else{
            photoView.image = UploadView.userImage
            nameView.text = "we are searching ....."
            ageView.text = mainPage.user[userOrder]?[""]
        }//else
    }//updateUserView
    // Specify the orientation.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }//loacationManager
    
    @IBAction func chatButton(_ sender: Any) {
        self.performSegue(withIdentifier: "chatSegue", sender: self)
    }//chatButton
    
    @IBAction func doneButton(_ sender: Any) {
        animateOut(desiredView: blurView)
        animateOut(desiredView: popupView)
    }
    func animateIn(desiredView: UIView){
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        });
        
        desiredView.removeFromSuperview()
    }//animateOut
}//mainPage
