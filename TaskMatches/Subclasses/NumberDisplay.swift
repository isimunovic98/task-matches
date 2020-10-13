//
//  NumberDisplay.swift
//  TaskMatches
//
//  Created by Ivan Simunovic on 13/10/2020.
//

import UIKit

class NumberDisplay: UIView {
    
    //MARK: Properties
    let numberDisplayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let thousandsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "0")
        return imageView
    }()
    
    let hundredsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    let tensImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "4")
        return imageView
    }()
    
    let unistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "5")
        return imageView
    }()
    
    
    //MARK: Init
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Methods
    fileprivate func setupView() {
        self.addSubview(numberDisplayStackView)
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            numberDisplayStackView.topAnchor.constraint(equalTo: self.topAnchor),
            numberDisplayStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            numberDisplayStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            numberDisplayStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    fileprivate func configureStackView() {
        numberDisplayStackView.addArrangedSubview(thousandsImageView)
        numberDisplayStackView.addArrangedSubview(hundredsImageView)
        numberDisplayStackView.addArrangedSubview(tensImageView)
        numberDisplayStackView.addArrangedSubview(unistImageView)
    }
    
    func displayNumber(numberToDisplay: Int) {
        var display = numberToDisplay
        setUnits(number: display % 10)
        display /= 10
        setTens(number: display % 10)
        display /= 10
        setHundreds(number: display % 10)
        display /= 10
        setThousands(number: display % 10)
    }
    
    func setThousands(number: Int) {
        thousandsImageView.image = UIImage(named: String(number))
    }
    
    func setHundreds(number: Int) {
        hundredsImageView.image = UIImage(named: String(number))
    }

    func setTens(number: Int) {
        tensImageView.image = UIImage(named: String(number))
    }

    func setUnits(number: Int) {
        unistImageView.image = UIImage(named: String(number))
    }

}
