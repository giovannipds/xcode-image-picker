//
//  ViewController.swift
//  Image Picker
//
//  Created by Giovanni Pires da Silva on 16/07/2018.
//  Copyright © 2018 Ezoom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    var i = 0
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.g
    }

    @IBAction func selectImage(_ sender: UIButton) {
        self.imagePicker.allowsEditing = false
        // sourceType .camera crashs
        if self.i == 0 {
            self.imagePicker.sourceType = .photoLibrary
            self.i = 1
        } else {
            self.imagePicker.sourceType = .savedPhotosAlbum
            self.i = 0
        }
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // available options:
        /*
        UIImagePickerControllerMediaType
        UIImagePickerControllerOriginalImage
        UIImagePickerControllerEditedImage
        UIImagePickerControllerCropRect
        UIImagePickerControllerMediaURL
        UIImagePickerControllerReferenceURL
        UIImagePickerControllerMediaMetadata
        */
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

