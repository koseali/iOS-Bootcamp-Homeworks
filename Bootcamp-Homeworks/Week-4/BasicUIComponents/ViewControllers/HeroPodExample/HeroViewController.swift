//
//  HeroViewController.swift
//  BasicUIComponents
//
//  Created by Ali Kose on 24.09.2021.
//

import UIKit
import Hero
class HeroViewController: UIViewController {

    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackView.heroID = "viewid"
        continueButton.heroID = "buttonid"
        
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        hero.dismissViewController(completion: nil)
    }
    
}
