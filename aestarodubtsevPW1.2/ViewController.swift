//
//  ViewController.swift
//  aestarodubtsevPW1.2
//
//  Created by Andrew on 27.09.2022.
//
//hello

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var views: [UIView]!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        
        let button = sender as? UIButton
        button?.isEnabled = false
        
        self.result.text = ""
        
        self.loading.isHidden = false
        
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        
        
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = Double.random(in: 0 ... 40)
                view.backgroundColor = set.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
            self.loading.isHidden = true
            if(Bool.random()){
                self.result.text = "The First Team won!"
            }
            else{
                self.result.text = "The Second Team won!"
            }
        }
        
        
        
        
    }
    
}

