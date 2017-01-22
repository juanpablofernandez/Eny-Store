//
//  AppView.swift
//  Eny Store
//
//  Created by Jay on 1/21/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AppView: UIViewController {
    
    var appInfo: [String]?
    var index: Int?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let app = appInfo {
            print("Test")
            self.titleLabel.text = app[0]
            self.authorLabel.text = app[4]
            self.imageView.image = UIImage(named: "appIcon" + (app[3]))
            print("appIcon\(app[3])")
            self.ratingLabel.text = app[2]
        }
    }
    
    @IBAction func getButtonClicked(_ sender: Any) {
        if let row = index {
            print(row)
            makeAPICall(id: row)
        }
    }
    
    func makeAPICall(id: Int) {
        var type: String = ""
        
        if id == 0 {
            type = "belkin_switch"
        } else if id == 4 {
            type = "hue"
        }
        
        let parameters: [String: String] = ["mode": type]
        
        Alamofire.request("http://bddc5add.ngrok.io/v1/eny/mode", method: .post, parameters: parameters)
            .responseJSON { response in
                print(response)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
