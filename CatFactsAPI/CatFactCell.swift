//
//  CatFactCell.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import UIKit

class CatFactCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    func configureCell(catFact: CatFact) {
        label.text = catFact.fact
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
}
