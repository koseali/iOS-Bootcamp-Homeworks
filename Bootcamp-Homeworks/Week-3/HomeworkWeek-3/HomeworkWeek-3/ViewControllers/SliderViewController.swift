//
//  SliderViewController.swift
//  HomeworkWeek-3
//
//  Created by Ali Kose on 17.09.2021.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var presentNew : Int = 0
    
   private let news : [News] = [
        News(imageView: UIImage(named: "new0"), title: "BBC NEWS"),
        News(imageView: UIImage(named: "new1"), title: "LIVE COVERAGE"),
        News(imageView: UIImage(named: "new2"), title: "LIVE UPDATE!"),
        News(imageView: UIImage(named: "new3"), title: "BBC NEWS"),
        News(imageView: UIImage(named: "new4"), title: "LIVE REPORT")
    ]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func leftSwipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        
        if presentNew < news.count-1 {
            presentNew += 1
            setNew(new: news[presentNew])
        } else {
            presentNew = 0
            setNew(new: news[presentNew])
        }
    }
    
    @IBAction func rightSwipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        if presentNew == 0 {
            presentNew = news.count-1
            setNew(new: news[presentNew])
        } else {
            presentNew -= 1
            setNew(new: news[presentNew])
        }
    }
    
    func setNew(new : News){
        titleLabel.text = new.title
        imageView.image = new.imageView
        pageControl.currentPage = presentNew
    }
    
    func setupView(){
        setNew(new: news[0])
        pageControl.numberOfPages = news.count
    }

    
}
