//
//  DetalhesRefeicaoTableViewHeader.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class DetalhesRefeicaoTableHeaderView: UIView {
    
    static func build(from refeicao: Refeicao) -> DetalhesRefeicaoTableHeaderView {
        let frame = CGRect(origin: .zero, size: .init(width: 0, height: UIScreen.main.bounds.width * 0.6))
        
        let headerView = DetalhesRefeicaoTableHeaderView.init(with: frame, and: refeicao)
        return headerView
    }
    
    private lazy var symbolView: UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = refeicao.simbolo
        label.font = .systemFont(ofSize: 52)
        label.textAlignment = .center
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 78),
            view.heightAnchor.constraint(equalToConstant: 78),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = refeicao.titulo
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = refeicao.horario
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            hoursLabel,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var containerWrapperView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            symbolView,
            titlesStackView,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    var refeicao: Refeicao
    
    private init(with frame: CGRect, and refeicao: Refeicao) {
        self.refeicao = refeicao
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addTheme()
        addViews()
        addConstraints()
    }
    
    private func addTheme() {
        backgroundColor = .whiteLilac
    }
    
    private func addViews() {
        addSubview(containerWrapperView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerWrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerWrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerWrapperView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

}
