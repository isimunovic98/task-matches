//
//  ViewController.swift
//  TaskMatches
//
//  Created by Ivan Simunovic on 13/10/2020.
//

import UIKit

class InputScreenViewController: UIViewController {
    
    //MARk: Properties
    let highestResultTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBottomBorder()
        textField.keyboardType = .numberPad
        textField.placeholder = "Highest Result Number"
        return textField
    }()
    
    let matchesTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBottomBorder()
        textField.keyboardType = .numberPad
        textField.placeholder = "Number of matches"
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 15
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
    //MARK: Methods
    fileprivate func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(highestResultTextField)
        view.addSubview(matchesTextField)
        view.addSubview(calculateButton)
                
        calculateButton.addTarget(self, action: #selector(self.showResultScreen), for: .touchUpInside)
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            highestResultTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            highestResultTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            highestResultTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            matchesTextField.topAnchor.constraint(equalTo: highestResultTextField.bottomAnchor, constant: 50),
            matchesTextField.trailingAnchor.constraint(equalTo: highestResultTextField.trailingAnchor),
            matchesTextField.leadingAnchor.constraint(equalTo: highestResultTextField.leadingAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: matchesTextField.bottomAnchor, constant: 50),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //MARK: Actions
    @objc func showResultScreen(){
        
        guard let highestNumberText = highestResultTextField.text, !highestResultTextField.text!.isEmpty else {
            return
        }
        
        guard let numberOfMatchesText = matchesTextField.text, !matchesTextField.text!.isEmpty else {
            return
        }
        
        let highestNumber = Int(highestNumberText)!
        let numberOfMatches = Int(numberOfMatchesText)!
        
        navigationController?.pushViewController(ResultScreenViewController(highestNumber : highestNumber, numberOfMatches: numberOfMatches), animated: false)
    }

}

