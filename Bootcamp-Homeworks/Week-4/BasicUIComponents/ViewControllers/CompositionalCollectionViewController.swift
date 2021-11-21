//
//  CompositionalCollectionViewController.swift
//  BasicUIComponents
//
//  Created by Ali Kose on 25.09.2021.
//

import UIKit
/*
 1 -) 2 tane section olustur.
 2-) Butona Basildiginda biri tekrar basildiginda digeri gelsin. Observer ekleyip ya da reloadCollection view ile bir flag control yapacagim.
 */
class CompositionalCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let data : [compositionalCVModel] = [
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 1"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 2"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 3"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 4"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 5"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 6"),
    compositionalCVModel(imageView: UIImage(named: "pikachu"), title: "Pikachu 7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
        
    }
//    MARK: - CREATE COMPOSITIONAL SECTIONS
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets (top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50),
                                              heightDimension: .fractionalHeight(0.50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .absolute(100),
                                                                          heightDimension: .fractionalHeight(1.0)), elementKind: "leading",
                                                        alignment: .leading)
        ]
        return section
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (section, enviroment) -> NSCollectionLayoutSection in
            switch section {
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            default: return self.firstLayoutSection()
            }
        }
    }
}

extension CompositionalCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compositionalCell", for: indexPath) as! CompositionalCollectionViewCell
        let item = data[indexPath.item]
        cell.imageView.image = item.imageView
        cell.titleLabel.text = item.title
        return cell
    }
    
    
}
