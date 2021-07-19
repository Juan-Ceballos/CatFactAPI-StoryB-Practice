//
//  ViewController.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        CatFactAPI.fetchCatFact { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let catFact):
                DispatchQueue.main.async {
                    self.catLabel.text = catFact.fact
                }
            }
        }
    }
    
}

