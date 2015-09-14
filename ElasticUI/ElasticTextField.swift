//
//  ElasticTextField.swift
//  ElasticUI
//
//  Created by 二六三 on 14/9/15.
//  Copyright (c) 2015年 Daniel Tavares. All rights reserved.
//

import UIKit

class ElasticTextField: UITextField {
    // 1
    var elasticView : ElasticView!
    
    // 2
    @IBInspectable var overshootAmount: CGFloat = 10 {
        didSet {
            elasticView.overshootAmount = overshootAmount
        }
    }
    
    // 3
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // 4
    func setupView() {
        // A
        clipsToBounds = false
        borderStyle = .None
        
        // B
        elasticView = ElasticView(frame: bounds)
        elasticView.backgroundColor = backgroundColor
        addSubview(elasticView)
        
        // C
        backgroundColor = UIColor.clearColor()
        
        // D
        elasticView.userInteractionEnabled = false
    }
    
    // 5
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        elasticView.touchesBegan(touches, withEvent: event)
    }
    
    // Add some padding to the text and editing bounds
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
   
}
