//
//  UIKitCollectionViewController.swift
//  fourth_project
//
//  Created by Денис Громачихин on 14.02.2026.
//


import UIKit

class UIKitListViewController: UIViewController,
                                UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    // 30 элементов
    var items = Array(repeating: false, count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: layout)
        
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
    }
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        
        cell.backgroundColor = items[indexPath.item] ? .systemBlue : .systemGray
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
    // MARK: - Layout (делаем как список)
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 20,
                      height: 60)
    }
    
    // MARK: - Tap
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        items[indexPath.item].toggle()
        collectionView.reloadItems(at: [indexPath])
    }
}
