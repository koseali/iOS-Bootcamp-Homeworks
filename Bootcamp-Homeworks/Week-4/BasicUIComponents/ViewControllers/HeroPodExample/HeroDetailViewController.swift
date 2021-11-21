//
//  HeroDetailViewController.swift
//  BasicUIComponents
//
//  Created by Ali Kose on 24.09.2021.
//

import UIKit
import Hero
class HeroDetailViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var secondView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.heroID = "buttonid"
        secondView.heroID = "viewid"
        
    }
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        hero.dismissViewController(completion: nil)
    }
}
