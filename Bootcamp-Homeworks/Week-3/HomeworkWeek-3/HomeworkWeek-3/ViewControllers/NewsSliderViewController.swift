//
//  NewsSliderViewController.swift
//  HomeworkWeek-3
//
//  Created by Ali Kose on 16.09.2021.
//

import UIKit

class NewsSliderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let news : [News] = [
//        News(imageView: UIImage(named: "rick"), title: "Rick and Morty 0."),
//        News(imageView: UIImage(named: ""), title: "Breaking Bad."),
//        News(imageView: UIImage(named: "rick"), title: "Rick and Morty 3."),
//        News(imageView: UIImage(named: "deadpool"), title: "DeadPool")
        News(imageView: UIImage(named: "new0"), title: "BBC NEWS"),
        News(imageView: UIImage(named: "new1"), title: "LIVE COVERAGE"),
        News(imageView: UIImage(named: "new2"), title: "LIVE UPDATE!"),
        News(imageView: UIImage(named: "new3"), title: "BBC NEWS"),
        News(imageView: UIImage(named: "new4"), title: "LIVE REPORT")
    ]
    
    var presentIndexPath : IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 }

extension NewsSliderViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let item = news[presentIndexPath.row]
        cell.imageView.image = item.imageView
        cell.titleLabel.text = item.title
        cell.titleLabel.textColor = .black
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("Ekranin genisligi : \(scrollView.frame.size.width)")
        print("Verinin genisligi : \(scrollView.contentSize.width)")
        print("bulunan x konumu: \(scrollView.contentOffset.x)")
        
            presentIndexPath.row += 1
        print(scrollView.contentOffset.x > scrollView.contentSize.width - scrollView.frame.size.width)
        if scrollView.contentOffset.x > scrollView.contentSize.width - scrollView.frame.size.width {
            presentIndexPath.row = 0
            collectionView.reloadData()
            
        }
    }
}





