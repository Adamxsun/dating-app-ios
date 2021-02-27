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
    var user = [1:["name" : "Spider","age" : "23", "gender" : "man","fMovie" : "Spider Man"],
                2: ["name" : "Lily","age" : "19", "gender" : "woman","fMovie" : "Truman"],
                3: ["name" : "Adam","age" : "19", "gender" : "man","fMovie" : "HarryPotter"],
                4: ["name" : "Lucy","age" : "23", "gender" : "woman","fMovie" : "Truman"],
                5 :["name" : "Emily","age" : "19", "gender" : "woman","fMovie" : "Truman"],
                6: ["name" : "David","age" : "19", "gender" : "man","fMovie" : "Truman"],
                7: ["name" : "Zac","age" : "19", "gender" : "man","fMovie" : "Truman"],
                8: ["name" : "Joey","age" : "19", "gender" : "man","fMovie" : "Truman"]]
    
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
            }
        updateUserView()
        // Do any additional setup after loading the view.
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    // Set the shouldAutorotate to False
    override open var shouldAutorotate: Bool {
       return false
    }
    @IBAction func LikeButton(_ sender: Any) {
        userOrder += 1
        updateUserView()
    }
    @IBAction func DislikeButton(_ sender: Any) {
        userOrder += 1
        updateUserView()
    }
    func updateUserView (){
        photoView.image = UIImage(named: String(userOrder))
        nameView.text = user[userOrder]?["name"]
        ageView.text = user[userOrder]?["age"]
    }
    // Specify the orientation.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
