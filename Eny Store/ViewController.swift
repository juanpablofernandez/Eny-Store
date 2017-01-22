//
//  ViewController.swift
//  Eny Store
//
//  Created by Jay on 1/21/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class TopAppViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var index: Int?
    
    let apps: [[String]] = [["Wemo Switch", "Smart Plug", "★★★★★", "0", "Juan Pablo Fernandez", ""], ["Wemo Motion", "Smart Plug", "★★★★☆", "1", "Juan Pablo Fernandez", ""], ["August Lock", "Smart Lock", "★★★★☆", "2", "Juan Pablo Fernandez", ""], ["Home Speaker", "Sound", "★★★★☆", "3", "Juan Pablo Fernandez", ""], ["Hue", "Smart Home", "★★★★☆", "4", "Juan Pablo Fernandez", ""], ["Git Commits", "Productivity", "★★★☆☆", "5", "Juan Pablo Fernandez", ""], ["Twitter", "Social Media", "★★★★☆", "6", "Juan Pablo Fernandez", ""], ["Wemo Plug", "Smart Plug", "★★★★☆", "7", "Juan Pablo Fernandez", ""], ["WhatsMyFare", "Smart Car", "★★★★★", "8", "Juan Pablo Fernandez", ""]]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navBarSetup()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.tintColor = UIColor(red: 241/255.0, green: 125/255.0, blue: 55/255.0, alpha: 1)
        
//        self.tabBarController?.tabBar.selectedItem?.selectedImage.im = UITabBarItem(title: "Charts", image: UIImage(named: "chartSelected"), selectedImage: UIImage(named: "chartSelected"))

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let path: AppView = segue.destination as! AppView
        if let row = index {
            path.appInfo = apps[row]
            path.index = row
        }
    }
    
    func navBarSetup() {
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 87/255.0, green: 188/255.0, blue: 203/255.0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.black
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.black]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TopAppViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.index = indexPath.row
        performSegue(withIdentifier: "showApp", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = tableView.bounds.height
        return screenHeight*0.2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TopAppTableViewCell
        cell.AppIconImage.image = UIImage.init(named: "appIcon\(indexPath.row)")
        cell.titleLabel.text = apps[indexPath.row][0]
        cell.subTitleLabel.text = apps[indexPath.row][1]
        cell.ratingLabel.text = apps[indexPath.row][2]
        return cell
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

