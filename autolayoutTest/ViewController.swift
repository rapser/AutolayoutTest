//
//  ViewController.swift
//  autolayoutTest
//
//  Created by miguel tomairo on 12/14/19.
//  Copyright © 2019 Rapser. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var secPink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

class ViewController: UIViewController {
    
    
    // Esto se refiere a un clousure
    let tutorialImageView: UIImageView = {
        let imageView = UIImageView(image:#imageLiteral(resourceName: "tutorial1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Unete hoy a nuestro divertido juego", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n Estas listo para cargar diversion? No esperes mas. Nosotros esperamos verte en nuestras historias proximamente", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        
//        textView.text = "Unete hoy a nuestro divertido juego"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .secPink
        return pc
    }()
    
    fileprivate func setupBottomControls(){
        
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
        let greenView = UIView()
        greenView.backgroundColor = .green

//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
//        bottomControlStackView.axis = .vertical
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    fileprivate func setupLayout() {
        
        let topImageContainerTopView = UIView()
        topImageContainerTopView.backgroundColor = .clear
        view.addSubview(topImageContainerTopView)
//        topImageContainerTopView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerTopView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerTopView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topImageContainerTopView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageContainerTopView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerTopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerTopView.addSubview(tutorialImageView)
        
        tutorialImageView.centerXAnchor.constraint(equalTo: topImageContainerTopView.centerXAnchor).isActive = true
        tutorialImageView.centerYAnchor.constraint(equalTo: topImageContainerTopView.centerYAnchor).isActive = true
        tutorialImageView.heightAnchor.constraint(equalTo: topImageContainerTopView.heightAnchor, multiplier: 0.5).isActive = true

//        tutorialImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        tutorialImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        tutorialImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        tutorialImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerTopView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tutorialImageView)
        view.addSubview(descriptionTextView)

        setupLayout()
        setupBottomControls()

    }


}

