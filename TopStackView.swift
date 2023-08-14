//
//  CustomView11.swift
//  StackViewsTask
//
//  Created by prasad-8709 on 17/08/22.
//

import UIKit

class TopStackView: UIView{
    
    let firstLabel = UILabel.init()
    let secondLabel = UILabel.init()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView(){
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.text = "Use your sketchbook to find your own drawing style and share it with others. "
        firstLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        firstLabel.textColor = UIColor(red: 7.0 / 255.0, green: 173.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
        firstLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        firstLabel.numberOfLines = 0
        firstLabel.textAlignment = .left
        self.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        secondLabel.text = "Paint with watercolors in a technical and creative way."
        secondLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        secondLabel.textColor = UIColor(red: 79.0 / 255.0, green: 129.0 / 255.0, blue: 189.0 / 255.0, alpha: 1.0)
        secondLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        secondLabel.numberOfLines = 0
        secondLabel.textAlignment = .left
        self.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant:20).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
}

