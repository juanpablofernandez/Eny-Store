//
//  SerialViewController.swift
//  Eny Store
//
//  Created by Jay on 1/21/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SerialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var quitButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSetup()
        self.textField.delegate = self
    }
    
    @IBAction func quitPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            print("Quit")
        })
    }
    
    @IBAction func pairClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            print("Quit")
        })
    }
    
//    func networkRequest() {
//        print("making Request")
//        let parameters: [String: String] = ["mode": "belkin_switch"]
//        
//        Alamofire.request("http://bddc5add.ngrok.io/v1/eny/mode", method: .post, parameters: parameters)
//            .responseJSON { response in
//                print(response)
//        }
//    }
    
    func navBarSetup() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 87/255.0, green: 188/255.0, blue: 203/255.0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
}
