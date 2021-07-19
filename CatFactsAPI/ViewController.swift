//
//  ViewController.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var catFacts = [CatFact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catFact", for: indexPath) as? CatFactCell else {
            fatalError("Could not load reuse cell datasource")
        }
        
        
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

