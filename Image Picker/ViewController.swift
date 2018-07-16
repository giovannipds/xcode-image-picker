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
        switch self.i {
        case 0:
            self.imagePicker.sourceType = .photoLibrary
        case 1:
            self.imagePicker.sourceType = .savedPhotosAlbum
        default:
            // self.imagePicker.sourceType = .camera
            print("crashs")
        }
        self.i = self.i == 2 ? 0 : self.i + 1
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

