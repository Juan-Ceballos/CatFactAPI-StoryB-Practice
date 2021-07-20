//
//  ViewController.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var catFacts = [CatFact]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateCollectionView() {
        CatFactAPI.fetchCatFact { (result) in
            switch result {
            case .failure(let error):
                print("error fetching cat fact \(error)")
            case .success(let catFact):
                self.catFacts.append(catFact)
            }
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        CatFactAPI.fetchCatFact { (result) in
            switch result {
            case .failure(let error):
                print("error fetching cat fact \(error)")
            case .success(let catFact):
                self.catFacts.append(catFact)
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        catFacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catFact", for: indexPath) as? CatFactCell else {
            fatalError("Could not load reuse cell datasource")
        }
        
        let catFact = catFacts[indexPath.row]
        if catFacts.count > 3 {
            catFacts.remove(at: 0)
        }
        cell.configureCell(catFact: catFact)
        cell.backgroundColor = .green
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}

