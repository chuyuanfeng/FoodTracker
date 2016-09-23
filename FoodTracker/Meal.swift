//
//  Meal.swift
//  FoodTracker
//
//  Created by Xu Lei on 9/2/16.
//  Copyright © 2016 LEANSOFT. All rights reserved.
//

import UIKit

class Meal {
    // MARK: properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
        // initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
