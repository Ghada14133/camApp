//
//  ViewController2.swift
//  cameraApp
//
//  Created by Ghada Fahad on 01/05/1443 AH.
//

import UIKit

class ViewController2: UIViewController {

  

        let myImag = UIImageView()
        let myName = UILabel()
        let myTextField = UITextField()
        let myTextField1 = UITextField()
        let myButton = UIButton()
        let myName1 = UILabel()
        var name = ""
        
        override var prefersStatusBarHidden: Bool{
           true
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            bgImagey()
            view.backgroundColor = .white
            view.addSubview(myName)
            myName.frame = CGRect(x:10, y: 120, width: 350, height: 59)
            myName.text = "Welcom to Your Camera App"
            myName.font = UIFont.systemFont(ofSize: 25)
            myName.textAlignment = .center
            myName.textColor = .orange
            
            myTextField.placeholder = "Please enter username"
            myTextField.frame = CGRect(x: 27, y: 200, width: 340, height: 30)
            myTextField.borderStyle = .roundedRect
            view.addSubview(myTextField)
        
            myTextField1.placeholder = "Please enter password"
            myTextField1.frame = CGRect(x: 28, y: 250, width: 340, height: 30)
            myTextField1.borderStyle = .roundedRect
            myTextField1.isSecureTextEntry = true
            view.addSubview(myTextField1)
            
            view.addSubview(myButton)
            myButton.setTitle("Login", for: .normal)
            myButton.frame = CGRect(x:150, y: 300, width: 100, height: 60)
            myButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 19, weight: .bold))
            myButton.setTitleColor(.white, for: .normal)
            myButton.backgroundColor = .systemOrange
            myButton.layer.cornerRadius = 20
            myButton.clipsToBounds = true
            myButton.addTarget(self, action: #selector (foo), for: .touchDown)
            
            
            view.addSubview(myName1)
            myName1.frame = CGRect(x: 37, y: 750, width: 341, height: 30)
            myName1.text = "You don not have an accunt? SignUP"
            myName1.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            myName1.textAlignment = .center
            myName1.textColor = .orange
            
            
        }
        private let backgroundImage : UIImageView = {
            let background = UIImageView()
            background.image = UIImage(named: "image_1")

            return background
        }()

        
        func bgImagey(){
            view.addSubview(backgroundImage)
            backgroundImage.translatesAutoresizingMaskIntoConstraints = false
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               
        }
        @objc func foo(){
            
         if myTextField.text == "MonaLisa" && myTextField1.text == ("12345"){
                     print("Successfully")
                         }else
                         {
                             
                             print("Try again")
                                  let secondV = ViewController3()
                                     secondV.receivedName = myTextField.text ?? "Mona"
                              present(secondV, animated: true, completion: nil)
                             }
                             }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


