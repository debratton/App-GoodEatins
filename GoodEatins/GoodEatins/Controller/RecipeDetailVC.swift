//
//  RecipeDetailVC.swift
//  GoodEatins
//
//  Created by David E Bratton on 10/2/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitleTxt: UILabel!
    @IBOutlet weak var recipeInstructionsTxt: UILabel!
    
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImg.image = UIImage(named: selectedRecipe.imageName)
        recipeTitleTxt.text = selectedRecipe.title
        recipeInstructionsTxt.text = selectedRecipe.instructions
    }
    


}
