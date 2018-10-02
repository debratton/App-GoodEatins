//
//  ViewController.swift
//  GoodEatins
//
//  Created by David E Bratton on 10/1/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //WHEN WE CREATED THE OUTLET IT WAS LIKE DECLARING THE VARIABLE IN THE SIMPLE EXAMPLE
    @IBOutlet weak var tableView: UITableView!
    
    //THIS REFERS TO DATASET SWIFT FILE IN MODEL FOLDER WHICH HAS ALL THE DATA
    let data = DataSet()
    //SET VARIABLE TO PASS
    var categoryToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NEED TO ADD THESE
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //HOW DID WE GET THIS?
        //WE ASSIGNED let date = DataSet() above which references the DataSet.swift file
        //which has an array of categories
        return data.categories.count
    }
    //categoryCell is value you enter in Main.storyboard on the cell for Identifier
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //TELLS VC WHICH ITEM WAS SELECTED
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipeSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionVC {
            //GRAB VARIABLE FROM RecipesSelectionVC
            recipesVC.selectedCategory = categoryToPass
        }
    }

}

