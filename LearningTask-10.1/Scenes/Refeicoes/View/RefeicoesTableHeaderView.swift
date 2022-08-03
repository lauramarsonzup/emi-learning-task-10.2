//
//  RefeicoesTableHeaderView.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class RefeicoesTableHeaderView: UIView {
    
    static func build() -> RefeicoesTableHeaderView {
        let frame = CGRect(origin: .zero, size: .init(width: 0, height: 144))
        let headerView = RefeicoesTableHeaderView(frame: frame)
        return headerView
    }
    
    private lazy var titleLabel: UILabel = {
        let text = "Qual sua∙próxima refeição?"
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text.replacingOccurrences(of: "∙", with: "\n")
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
    
    override init(frame: CGRect) {
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
