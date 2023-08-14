//
//  CarouselZoomViewController.swift
//  StackViewsTask
//
//  Created by prasad-8709 on 16/08/22.
//

import UIKit

class StackViewsExpandAndCollapsedController: UIViewController{
    
    var topViewStatus = ViewExpandedType.minimize
    var midddleViewStatus = ViewExpandedType.minimize
    var bottomViewStatus = ViewExpandedType.minimize
    
    var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 19
        stackView.backgroundColor = UIColor(red: 79.0 / 255.0, green: 129.0 / 255.0, blue: 189.0 / 255.0, alpha: 1.0)
        return stackView
    }()
    
    var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 19
        stackView.backgroundColor = UIColor(white: 177.0 / 255.0, alpha: 1.0)
        return stackView
    }()
    
    var thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 19
        stackView.backgroundColor = UIColor(red: 255.0 / 255.0, green: 242.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
        return stackView
    }()
    
    lazy var imageview: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.layer.cornerRadius = 12
        imageV.layer.masksToBounds = true
        imageV.layer.borderWidth = 1
        imageV.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        return imageV
    }()
    
    
    var button = UIButton(frame: CGRect(x: 140, y: 500, width: 150, height: 60))
    
    let firstLabel = UILabel.init()
    let secondLabel = UILabel.init()
    var categoryView = UIView()
    var categoryButton = UIButton()
    
    var middleView = MiddleStackView()
    var topView = TopStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setFirstStackViews()
        self.setSecondStackViews()
        self.setThirdStackViews()
    }
    
    func setUpViews(){
        self.view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        self.view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        imageview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = imageview.bounds
        view.addSubview(blurredEffectView)
        
        self.view.addSubview(button)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Subscribe", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(firstStackView)
        self.view.addSubview(secondStackView)
        self.view.addSubview(thirdStackView)
    }
    
    func setFirstStackViews(){
        let outerView = UIView()
        firstStackView.isHidden = true
        firstStackView.addArrangedSubview(outerView)
        outerView.addSubview(categoryView)
        outerView.addSubview(firstLabel)
        outerView.addSubview(secondLabel)
        
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        categoryView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 10).isActive = true
        categoryView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -10).isActive = true
        categoryView.topAnchor.constraint(equalTo: outerView.topAnchor,constant: 10).isActive = true
        categoryView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        categoryButton.setImage(UIImage.init(named: "dropdown"), for: .normal)
        categoryView.addSubview(categoryButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(submitButtonTapped))
        categoryView.addGestureRecognizer(tap)
        categoryButton.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -20).isActive = true
        categoryButton.topAnchor.constraint(equalTo: categoryView.topAnchor,constant: 5).isActive = true
        
        firstLabel.text = "Hey! do you like this background wallpapaer?"
        firstLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        firstLabel.textColor = UIColor(red: 7.0 / 255.0, green: 173.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
        firstLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        firstLabel.numberOfLines = 0
        firstLabel.textAlignment = .left
        firstLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 10).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 20).isActive = true
        
        secondLabel.text = "Please! check out for different wallpapers and do download it."
        secondLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        secondLabel.textColor = UIColor(white: 1.0, alpha: 1.0)
        secondLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        secondLabel.numberOfLines = 0
        secondLabel.textAlignment = .left
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 18).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 10).isActive = true
    }
    
    func setSecondStackViews(){
        secondStackView.isHidden = true
        let outerView = UIView()
        let button = UIButton()
        button.setImage(UIImage.init(named: "dropdown"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.view.frame.width - 85, bottom: 20, right: 0)
        secondStackView.addArrangedSubview(outerView)
        outerView.addSubview(button)
        outerView.addSubview(middleView)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: outerView.leadingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: outerView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: outerView.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(secondViewButtonTapped), for: .touchUpInside)
        
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.topAnchor.constraint(equalTo: button.topAnchor, constant: 35).isActive = true
        middleView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor,constant: 10).isActive = true
        middleView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor,constant: -10).isActive = true
    }
    
    func setThirdStackViews(){
        let outerView = UIView()
        let button = UIButton()
        button.setImage(UIImage.init(named: "dropdown"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.view.frame.width - 85, bottom: 20, right: 0)
        thirdStackView.addArrangedSubview(outerView)
        outerView.addSubview(button)
        outerView.addSubview(topView)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: outerView.leadingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: outerView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: outerView.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(thirdViewButtonTapped), for: .touchUpInside)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: button.topAnchor, constant: 35).isActive = true
        topView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor,constant: 10).isActive = true
        topView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor,constant: -10).isActive = true
    }
    
    
    
    @objc func closeNavigationController() {
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @objc func submitButtonTapped(){
        firstStackView.isHidden = false
        secondStackView.isHidden = false
        if topViewStatus == .minimize{
            self.button.isHidden = true
            imageview.isHidden = true
            firstStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.85)
            secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.65)
            UIView.animate(withDuration: 1, animations: {
                self.firstStackView.frame = CGRect(x: 0, y: self.view.frame.size.height * 0.15, width: self.view.frame.width, height: self.view.frame.height * 0.85)
            }) {
                complete in
                self.topViewStatus = (self.topViewStatus == .minimize ? .maximize : .minimize)
            }
            UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [], animations: {
                self.secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            }){
                complete in
            }
        }
        else{
            UIView.animate(withDuration: 0.6, animations: {
                self.firstStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.85)
                self.secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            }) {
                complete in
                self.topViewStatus = (self.topViewStatus == .minimize ? .maximize : .minimize)
                self.button.isHidden = false
                self.imageview.isHidden = false
            }
        }
    }
    
    @objc func secondViewButtonTapped(){
        if midddleViewStatus == .minimize{
            secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            UIView.animate(withDuration: 1, animations: {
                self.secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height * 0.25, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            }) {
                complete in
                self.midddleViewStatus = (self.midddleViewStatus == .minimize ? .maximize : .minimize)
            }
            UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [], animations: {
                self.thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.65)
            }){
                complete in
            }
        }
        else{
            UIView.animate(withDuration: 0.6, animations: {
                self.secondStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.75)
                self.thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height: self.view.frame.height * 0.75)
            }) {
                complete in
                self.midddleViewStatus = (self.midddleViewStatus == .minimize ? .maximize : .minimize)
            }
        }
    }
    
    @objc func thirdViewButtonTapped(){
        if bottomViewStatus == .minimize{
            thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.65)
            UIView.animate(withDuration: 1, animations: {
                self.thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height * 0.35, width: self.view.frame.width, height: self.view.frame.height * 0.65)
            }) {
                complete in
                self.bottomViewStatus = (self.bottomViewStatus == .minimize ? .maximize : .minimize)
            }
        }
        else{
            UIView.animate(withDuration: 0.6, animations: {
                self.thirdStackView.frame = CGRect(x: 0, y: self.view.frame.size.height - 80, width: self.view.frame.width, height: self.view.frame.height * 0.65)
            }) {
                complete in
                self.bottomViewStatus = (self.bottomViewStatus == .minimize ? .maximize : .minimize)
            }
        }
    }
    
    
}
