//
//  ResultScreenViewController.swift
//  TaskMatches
//
//  Created by Ivan Simunovic on 13/10/2020.
//

import UIKit

class ResultScreenViewController: UIViewController {
     
    //MARK: Properties
    let totalMatchesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = label.font.withSize(13)
        label.text = "The total number of matches required to \n display all the numbers is: "
        return label
    }()
    
    let largestNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(13)
        label.text = "The largest natural number is: "
        return label
    }()
    
    let numberDisplayContainer: NumberDisplay = {
        let view = NumberDisplay()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Init
    init(highestNumber: Int, numberOfMatches: Int){
        totalMatchesLabel.text?.append(String(ResultCalculator.calculateRequiredMatchesToDisplayNumbers(highestNumber: highestNumber)))
        numberDisplayContainer.displayNumber(numberToDisplay: ResultCalculator.calculateHighestNumberPossibleToDisplay(highestNumber: highestNumber, matchesAvailable: numberOfMatches))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
    }
    
    //MARK: Methods
    fileprivate func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(totalMatchesLabel)
        view.addSubview(largestNumberLabel)
        view.addSubview(numberDisplayContainer)
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            totalMatchesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            totalMatchesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalMatchesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            largestNumberLabel.topAnchor.constraint(equalTo: totalMatchesLabel.bottomAnchor, constant: 50),
            largestNumberLabel.leadingAnchor.constraint(equalTo: totalMatchesLabel.leadingAnchor),
            
            numberDisplayContainer.topAnchor.constraint(equalTo: largestNumberLabel.bottomAnchor, constant: 30),
            numberDisplayContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            numberDisplayContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            numberDisplayContainer.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
