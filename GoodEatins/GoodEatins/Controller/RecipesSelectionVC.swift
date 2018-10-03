//
//  RecipesSelectionVC.swift
//  GoodEatins
//
//  Created by David E Bratton on 10/2/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //VARIABLE TO HOLD VALUE OF WHAT WAS SELECTED FROM PREVIOUS VC
    var selectedCategory: String!
    //VARIABLE TO GRAB THE DATA
    var recipes: [Recipe]!
    //THIS REFERS TO DATASET SWIFT FILE IN MODEL FOLDER WHICH HAS ALL THE DATA
    let data = DataSet()
    //THIS SET VARIABLE TO PASS TO DETAILS
    var recipeToPass: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)
        print(selectedCategory)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    //RecipeCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell {
            let recipe = recipes[indexPath.item]
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailVC {
            detailsVC.selectedRecipe = recipeToPass
        }
    }
}
