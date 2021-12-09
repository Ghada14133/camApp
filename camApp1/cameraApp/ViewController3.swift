//
//  ViewController3.swift
//  cameraApp
//
//  Created by Ghada Fahad on 01/05/1443 AH.
//

import UIKit

class ViewController3: UIViewController {

   

        var receivedName = ""
        let myButton = UIButton()
        let mylable = UILabel()
        let myImag = UIImageView()
        

        
    
    //Saving Image
    // Convert to Data
//    if let data = myImag?.pngData() {
//        // Create URL
//        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let url = documents.appendingPathComponent(myImag)
//
//        do {
//            // Write to Disk
//            try data.write(to: url)
//
//            // Store URL in User Defaults
//            UserDefaults.standard.set(url, forKey: "background")
//
//        } catch {
//            print("Unable to Write Data to Disk (\(error))")
//        }
//    }
   
//        func getDocumentsDirectory() -> URL {
//            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            return paths[0]
//        }
    
    
        override var prefersStatusBarHidden: Bool{
            true
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
           view.backgroundColor = .white
            
            print(receivedName)
            bgImagey()
           
            view.addSubview(mylable)
            mylable.frame = CGRect(x:10, y: 120, width: 350, height: 59)
            mylable.text = "              "
            mylable.font = UIFont.systemFont(ofSize: 30)
            mylable.textAlignment = .center
            mylable.textColor = .orange
            mylable.text = receivedName
            
            view.addSubview(myButton)
            myButton.setTitle("Take a Picture", for: .normal)
            myButton.frame = CGRect(x:100, y: 600, width: 200, height: 60)
            myButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
            myButton.setTitleColor(.white, for: .normal)
            myButton.backgroundColor = .lightGray
            myButton.layer.cornerRadius = 20
            myButton.clipsToBounds = true
            myButton.addTarget(self, action: #selector (foo), for: .touchDown)
           
           
            myImag.frame = CGRect(x: 35, y: 150, width: 350, height: 400)
            myImag.image = UIImage(named: "not yet")
            myImag.contentMode = .scaleToFill
            myImag.layer.cornerRadius = 10
            myImag.clipsToBounds = true
            view.addSubview(myImag)
           
        }
        private let backgroundImage : UIImageView = {
            let background = UIImageView()
            background.image = UIImage(named: "image_2")
            return background
        }()
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            myImag.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
        
        func bgImagey(){
            view.addSubview(backgroundImage)
            backgroundImage.translatesAutoresizingMaskIntoConstraints = false
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               
        }

        @objc func foo(){
            
            let camera = UIImagePickerController()
            camera.sourceType = .camera
            camera.delegate = self
            present(camera, animated: true)
            
        }

    }

    extension ViewController3: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        private func ImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            picker.dismiss(animated: true, completion: nil)

            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return
            }
            myImag.image = image
        }
    }    
    

