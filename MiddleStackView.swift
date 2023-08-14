//
//  CustomViews.swift
//  StackViewsTask
//
//  Created by prasad-8709 on 16/08/22.
//

import UIKit

class MiddleStackView: UIView{
    
    let firstLabel = UILabel.init()
    let secondLabel = UILabel.init()
    
    lazy var startDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(doneStartDatePicker), for: .valueChanged)
        return picker
    }()
    
    var startDateField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 226.0 / 255.0, green: 226.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        textField.rightViewMode = .always
        return textField
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpViews()
        setUpPickerViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.text = "Create an artist’s portfolio and develop your own universe of pictorial resources. "
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
        
        secondLabel.text = "Please! check out for different wallpapers and do download it."
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
    
    func setUpPickerViews(){
        startDateField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(startDateField)
        startDateField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive = true
        startDateField.topAnchor.constraint(equalTo: secondLabel.bottomAnchor,constant: 20).isActive = true
        startDateField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        startDateField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let startContainerView = UIView()
        let frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        startContainerView.frame = frame
        let datePickerButton = UIButton()
        startContainerView.addSubview(startDatePicker)
        startContainerView.addSubview(datePickerButton)
        datePickerButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        datePickerButton.setImage(UIImage.init(named: "ckdate"), for: .normal)
        datePickerButton.isUserInteractionEnabled = false
        startDatePicker.frame = frame
        startDatePicker.layer.masksToBounds = true
        
        datePickerButton.translatesAutoresizingMaskIntoConstraints = false
        datePickerButton.leadingAnchor.constraint(equalTo: startContainerView.leadingAnchor).isActive = true
        datePickerButton.topAnchor.constraint(equalTo: startContainerView.topAnchor).isActive = true
        datePickerButton.trailingAnchor.constraint(equalTo: startContainerView.trailingAnchor).isActive = true
        datePickerButton.bottomAnchor.constraint(equalTo: startContainerView.bottomAnchor).isActive = true
        startDateField.rightView = startContainerView
    }
    
    @objc func doneStartDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        startDateField.text = formatter.string(from: startDatePicker.date)
        self.endEditing(true)
    }
    
}
