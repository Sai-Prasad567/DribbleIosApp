//
//  ViewController.swift
//  StackViewsTask
//
//  Created by prasad-8709 on 16/08/22.
//

import UIKit

class StackViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let customImageCell = "customImageCell"
    private var listOfViews : [ImageType] = [ ImageType(title: "The Art of Sketching ", imageCourse: UIImage(named: "caro1" )!) ,
                                              ImageType(title: " Watercolor Techniques", imageCourse: UIImage(named: "caro2" )!) ,
                                              ImageType(title: "llustration Techniques ", imageCourse: UIImage(named: "caro3" )!)]
    var stackViewsExpandAndCollapsedController =  StackViewsExpandAndCollapsedController()
    var closeButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 24, height: 24))
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.isUserInteractionEnabled = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.register(CarouselImageCell.self, forCellWithReuseIdentifier: customImageCell)
        setUpViews()
    }
    
    func setUpViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            collectionView.heightAnchor.constraint(equalToConstant: 360),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customImageCell, for: indexPath) as! CarouselImageCell
       customCell.imgType  = self.listOfViews[indexPath.item]
       return customCell
   }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return listOfViews.count
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 350, height: 320)
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        stackViewsExpandAndCollapsedController.imageview.image = listOfViews[indexPath.item].imageCourse
//        carouselViewController.modalPresentationStyle = .formSheet
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: closeButton)
        closeButton.setImage(UIImage.init(named: "iconBack"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeNavigationController), for: .touchUpInside)
        if let preview = stackViewsExpandAndCollapsedController.view {
            self.view.addSubview(preview)
            preview.translatesAutoresizingMaskIntoConstraints = false
            var newConstraints = [NSLayoutConstraint]()
            newConstraints.append(preview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
            newConstraints.append(preview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
            newConstraints.append(preview.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 25))
            newConstraints.append(preview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
            NSLayoutConstraint.activate(newConstraints)
        }
//        self.present(carouselViewController, animated: true, completion: nil)
    }
    
    @objc func closeNavigationController() {
        self.stackViewsExpandAndCollapsedController.closeNavigationController()
        self.navigationItem.leftBarButtonItem = nil
    }
    
}

class CarouselImageCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imgType: ImageType!{
        didSet{
            updateView()
        }
    }
    
    lazy var imageview: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.layer.cornerRadius = 12
        imageV.layer.masksToBounds = true
        imageV.layer.borderWidth = 1
        imageV.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        return imageV
    }()
    
    lazy var blurEffect: UIVisualEffectView = {
        let eff = UIBlurEffect(style: .extraLight)
        let blurE = UIVisualEffectView(effect: eff)
        blurE.translatesAutoresizingMaskIntoConstraints = false
    
        return blurE
    }()
    
    lazy var courseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkText
        return label
    }()
    
    func setUpCell(){
        self.backgroundColor = .clear
        let outerView = UIView()
        self.addSubview(outerView)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageview)
        imageview.addSubview(blurEffect)
        blurEffect.contentView.addSubview(courseLabel)
        outerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        outerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        outerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        outerView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        imageview.topAnchor.constraint(equalTo: outerView.topAnchor, constant: 30).isActive = true
        imageview.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: 10).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 290).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        blurEffect.bottomAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        blurEffect.leadingAnchor.constraint(equalTo: imageview.leadingAnchor).isActive = true
        blurEffect.widthAnchor.constraint(equalToConstant: 340).isActive = true
        blurEffect.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        courseLabel.bottomAnchor.constraint(equalTo: blurEffect.bottomAnchor).isActive = true
        courseLabel.leadingAnchor.constraint(equalTo: blurEffect.leadingAnchor).isActive = true
        courseLabel.widthAnchor.constraint(equalToConstant: 340).isActive = true
        courseLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func updateView(){
        courseLabel.text = imgType.title
        imageview.image = imgType.imageCourse
    }
}


