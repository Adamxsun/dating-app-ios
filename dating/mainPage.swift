//
//  mainPage.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-23.
//


import UIKit
import CoreLocation
import UserNotifications
import MapKit
class mainPage: UIViewController, CLLocationManagerDelegate {
    
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
    
    var userOrder = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            }//if
        updateUserView()
        // Do any additional setup after loading the view.
    }
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
        if mainPage.user[userOrder]?["match"] == "true"{
            getMarched()
        }
        userOrder += 1
        updateUserView()
    }//LikeButton
    @IBAction func DislikeButton(_ sender: Any) {
        userOrder += 1
        updateUserView()
    }//DislikeButton
    
    func getMarched(){
        mainPage.matchedUser = (mainPage.user[userOrder]?["name"])!
        mainPage.matchedUserImage = String(userOrder)
    }
    func updateUserView (){
        if mainPage.user[userOrder] != nil{
            if SignUp.UserGender == mainPage.user[userOrder]?["gender"]!{
                photoView.image = UIImage(named: String(userOrder))
                nameView.text = mainPage.user[userOrder]?["name"]
                ageView.text = mainPage.user[userOrder]?["age"]
            }//if
            else{
                userOrder += 1
                updateUserView()
            }//else
        }//if
        else{
            photoView.image = UIImage(named: "clipart1831124")
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
}//mainPage
