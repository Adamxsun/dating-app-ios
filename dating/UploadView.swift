//
//  uploadPhoto.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-22.
//
		
import UIKit

class UploadView: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    static var userImage :UIImage?
    @IBAction func SkipButton(_ sender: Any) {
        self.performSegue(withIdentifier: "FourthSegue", sender: self)
    }//SkipButton
    @IBAction func uploadButton(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        imagePicker.sourceType  = .photoLibrary
        
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true){}
  
    }//uploadButto
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]as! UIImage?
        UploadView.userImage = image
        myImageView.image = image
        dismiss(animated: true, completion: nil)
    }//imagePickerController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidlOAD
    override open var shouldAutorotate: Bool {
       return false
    }//shoudaUTOrotate
}//UploadView
