//
//  Theme.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

protocol ThemeConfigurable: UIViewController {
    func applyTheme()
}

extension ThemeConfigurable {
    func applyTheme() {
        configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let titleView = LogoTitleView()
        titleView.isLayoutMarginsRelativeArrangement = true
        titleView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
        
        navigationItem.titleView = titleView
    }
}

extension UIViewController: ThemeConfigurable {}

extension UIColor {
    static let linkWater: UIColor = .init(named: "Link Water") ?? .systemBackground
    static let whiteLilac: UIColor = .init(named: "White Lilac") ?? .secondarySystemBackground
    static let downriver: UIColor = .init(named: "Downriver") ?? .systemIndigo
}
