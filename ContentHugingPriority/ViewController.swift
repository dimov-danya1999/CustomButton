//
//  ViewController.swift
//  ContentHugingPriority
//
//  Created by mac on 02.08.2022.
//

import UIKit

class MyCustomButton: UIButton {
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var myImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    private var viewModel: ModelCustomButton?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel: ModelCustomButton) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addsubbView()
        configure(with: viewModel)
    }
    
    private func addsubbView() {
        guard !labelTitle.isDescendant(of: self) else {
            return
        }
        addSubview(myImage)
        addSubview(labelTitle)
        addSubview(subTitle)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: ModelCustomButton) {
         layer.masksToBounds = true
         layer.cornerRadius = 8
         layer.borderColor = UIColor.secondarySystemBackground.cgColor
         layer.borderWidth = 1.5
         
         addsubbView()
        labelTitle.text = viewModel.titleButton
        subTitle.text = viewModel.subTitleButton
        myImage.image = UIImage(systemName: viewModel.imageButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImage.frame = CGRect(x: 5, y: 5,
                               width: 25,
                               height: frame.height).integral
        
        labelTitle.frame = CGRect(x: 60, y: 5,
                                  width: frame.width-65,
                                  height: (frame.height-10)/2).integral
        
        subTitle.frame = CGRect(x: 60,
                                y: (frame.height+10)/2,
                                width: frame.width-65,
                                height: (frame.height-10)/2).integral
    }
}

struct ModelCustomButton {
    let titleButton: String
    let subTitleButton: String
    let imageButton: String
}

class ViewController: UIViewController {
    
    private let buttonCustom: MyCustomButton = {
        let button = MyCustomButton(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonCustom)
        buttonCustom.center = view.center
        let viewModel = ModelCustomButton(titleButton: "Главная название кнопки", subTitleButton: "Подназвание кнопки", imageButton: "cart")
        buttonCustom.configure(with: viewModel)
    }
    
}
