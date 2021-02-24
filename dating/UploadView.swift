//
//  uploadPhoto.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-22.
//
		
import UIKit

class UploadView: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!

    @IBAction func SkipButton(_ sender: Any) {
        self.performSegue(withIdentifier: "FourthSegue", sender: self)
    }
    @IBAction func uploadButton(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        imagePicker.sourceType  = .photoLibrary
        
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true){}
  
    }//uploadButto
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerController.InfoKey.originalImage.rawValue]as! UIImage?
        myImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override open var shouldAutorotate: Bool {
       return false
    }
}
