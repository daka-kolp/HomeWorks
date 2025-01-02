//
//  ViewController.swift
//  HomeWork12UK
//
//  Created by Daria Kolpakova on 02.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let screenWidth = view.frame.width
        let columnCount: CGFloat = 2.0
        let itemWidth: CGFloat = screenWidth / columnCount
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: 162.5)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell
        else {
            assertionFailure("Unable to dequeue cell")
            return UICollectionViewCell()
        }
        
        cell.cardTextView.text = "Item \(indexPath.row)"
        cell.cardImageView.image = UIImage(named: "image")
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
