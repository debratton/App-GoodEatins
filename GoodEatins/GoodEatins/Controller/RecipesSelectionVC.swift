//
//  RecipesSelectionVC.swift
//  GoodEatins
//
//  Created by David E Bratton on 10/2/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //VARIABLE TO HOLD VALUE OF WHAT WAS SELECTED FROM PREVIOUS VC
    var selectedCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(selectedCategory)
    }
    

}
