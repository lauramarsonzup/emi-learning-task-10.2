//
//  DefaultTableSectionHeaderView.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

@IBDesignable class DefaultTableSectionHeaderView: UITableViewHeaderFooterView {

    static var reuseId: String {
        return String(describing: self)
    }
    
    static let alturaBase: CGFloat = 64
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: .zero, height: Self.alturaBase)
    }
    
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    @IBInspectable var titulo: String? {
        didSet {
            tituloLabel.text = titulo
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(tituloLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: Self.alturaBase)
        ])
        
        NSLayoutConstraint.activate([
            tituloLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            tituloLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            tituloLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
}
