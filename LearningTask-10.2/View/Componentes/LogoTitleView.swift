//
//  LogoTitleView.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class LogoTitleView: UIStackView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "fit"
        label.font = UIFont(name: "Noteworthy", size: 20)
        return label
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addTheme()
        addViews()
        addConstraints()
    }
    
    private func addTheme() {
        axis = .horizontal
        distribution = .fill
        alignment = .firstBaseline
        spacing = 2
    }
    
    private func addViews() {
        addArrangedSubview(logoImageView)
        addArrangedSubview(titleLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 24),
            logoImageView.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
}
