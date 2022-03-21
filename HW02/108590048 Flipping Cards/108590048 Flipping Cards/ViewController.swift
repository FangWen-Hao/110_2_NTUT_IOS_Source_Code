//
//  ViewController.swift
//  108590048 Flipping Cards
//
//  Created by student on 2022/3/14.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipLabel: UILabel!
    var flipCount = 0
    let flippedCardsColor = UIColor.yellow
    let unflippedCardsColor = UIColor.orange
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func flipCard(_ sender: UIButton) {
        if sender.backgroundColor == flippedCardsColor {
            sender.setTitle("", for: UIControlState.normal)
            sender.backgroundColor = unflippedCardsColor
        }
    else {
        switch sender.tag {
            
        case 1:
            sender.setTitle("😈", for: UIControlState.normal)
            
        case 2:
            sender.setTitle("👻", for: UIControlState.normal)
            
        case 3:
            sender.setTitle("🎃", for: UIControlState.normal)
            
        case 4:
            sender.setTitle("🙀", for: UIControlState.normal)
            
        default:
            break
        }
        sender.backgroundColor = flippedCardsColor
        sender.titleLabel?.font = UIFont(name: "System", size: 46)
    
    }

        flipCount += 1
        flipLabel.text = "Flips: \(flipCount)"
    }
    
}

