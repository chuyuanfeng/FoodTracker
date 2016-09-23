//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Xu Lei on 9/2/16.
//  Copyright © 2016 LEANSOFT. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    let spacing = 5
    let starCount = 5
    var ratingButtons = [UIButton]()

    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        
        for _ in 0..<starCount{
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            
        }
        
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y:0, width: buttonSize, height: buttonSize)
        
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing*(starCount-1))
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: button action
    
    func ratingButtonTapped(button: UIButton){
        
        rating = ratingButtons.indexOf(button)! + 1
    }
    
    func updateButtonSelectionStates(){
        // if the index of the button is less than the rating, that button is selected.
        for (index, button) in ratingButtons.enumerate(){
            button.selected = index < rating
        }
    }

}
