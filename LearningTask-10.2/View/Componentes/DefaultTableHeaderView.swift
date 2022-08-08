//
//  DefaultTableHeaderView.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class DefaultTableHeaderView: UIView {
    
    static func build(with title: String) -> DefaultTableHeaderView {
        let frame = CGRect(origin: .zero, size: .init(width: 0, height: 144))
        let headerView = DefaultTableHeaderView(with: title, and: frame)
        return headerView
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = .systemFont(ofSize: 32, weight: .light)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var containerWrapperView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
        return stackView
    }()
    
    private var title: String
    
    private init(with title: String, and frame: CGRect) {
        self.title = title
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(containerWrapperView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerWrapperView.topAnchor.constraint(equalTo: self.topAnchor),
            containerWrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerWrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerWrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}
