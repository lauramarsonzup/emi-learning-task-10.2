//
//  RefeicaoTableViewCell.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class RefeicaoTableViewCell: UITableViewCell {

    @IBOutlet private weak var simboloLabel: UILabel!
    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var horarioLabel: UILabel!
    
    var refeicao: Refeicao? {
        didSet {
            guard let refeicao = refeicao else { return }

            simboloLabel.text = refeicao.simbolo
            tituloLabel.text = refeicao.titulo
            horarioLabel.text = refeicao.horario
        }
    }
}
