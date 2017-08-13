//
//  ChekkiViewController.swift
//  ChekkiCollector
//
//  Created by Armani on 13/08/2017.
//  Copyright © 2017 Armani Cesar. All rights reserved.
//

import UIKit

class ChekkiViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var chekkiImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    
    var imagePicker = UIImagePickerController()
    var chekki : Chekki? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if (chekki != nil) {
            chekkiImageView.image = UIImage(data: chekki!.image as! Data)
            titleTextField.text = chekki!.title
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            //If the game doesnt exist
            deleteButton.isHidden = true
        }
    }

   
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        chekkiImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker,animated: true , completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
//        if chekki != nil {
//            chekki!.title = titleTextField.text
//            chekki!.image = UIImagePNGRepresentation(chekkiImageView.image!) as NSData?
//        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let chekki = Chekki(context: context)
            chekki.title = titleTextField.text
            chekki.image = UIImagePNGRepresentation(chekkiImageView.image!) as NSData?
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
            //Pop the current view to send us back
            navigationController!.popViewController(animated: true)
        //}
    
    }


}
