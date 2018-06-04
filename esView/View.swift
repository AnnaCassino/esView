//
//  View.swift
//  esView
//
//  Created by Anna Cassino on 31/05/18.
//  Copyright © 2018 Anna Cassino. All rights reserved.
//

import UIKit

class View: UIView {

    var backAction: (() -> Void)?
    var continueAction: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        setupConstraints()
        addActions()
        addActionsTwo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addActions(){
        firstButton.addTarget(self, action: #selector(self.onBackButton), for: .touchUpInside)
    }
    
    func addActionsTwo(){
        secondButton.addTarget(self, action: #selector(self.onContinueButton), for: .touchUpInside)
    }
    
    @objc func onContinueButton(){
        continueAction?()
    }
    
    @objc func onBackButton(){
        backAction?()
    }
//    SETUP DEI CONSTRAINTS
    
    func setupConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        setupViewContents()
        setupFirstButton()
        setupSecondButton()
    }

//    SOTTOFUNZIONI SETUP DEI CONSTRAINTS(TASTO DESTRO, REFACTOR,EXTRACT METHOD)
    fileprivate func setupViewContents() {
        viewContents.translatesAutoresizingMaskIntoConstraints = false
        viewContents.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        viewContents.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        viewContents.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        viewContents.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupFirstButton() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.leftAnchor.constraint(equalTo: viewContents.leftAnchor, constant: 0).isActive = true
        firstButton.topAnchor.constraint(equalTo: viewContents.bottomAnchor, constant: 10).isActive = true
    }
    
    fileprivate func setupSecondButton() {
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.rightAnchor.constraint(equalTo: viewContents.rightAnchor, constant: 0).isActive = true
        secondButton.topAnchor.constraint(equalTo: viewContents.bottomAnchor, constant: 10).isActive = true
    }
    
//  FUNZIONE CHE AGGIUNGE LA VIEW E I BOTTONI
    func setupView() {
        self.addSubview(viewContents)
        self.addSubview(firstButton)
        self.addSubview(secondButton)
    }
    
//  CREA VIEW (DIMENSIONI, LARGHEZZA BORDO E COLORE)
//    let viewContents: UIView = {
//        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100) )
//        mainView.layer.borderWidth = 1.0
//        mainView.layer.borderColor = UIColor.blue.cgColor
//        return mainView
//    }()
    
    let viewContents: UIImageView = {
        let mainView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mainView.image = #imageLiteral(resourceName: "one")
        mainView.layer.borderWidth = 1.0
        mainView.layer.borderColor = UIColor.black.cgColor
        return mainView
        }()
    
//  CREA BUTTON, TIPO E TESTO
    let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("INDIETRO", for: .normal)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AVANTI", for: .normal)
        return button
    }()
}
