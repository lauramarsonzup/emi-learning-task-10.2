//
//  ExercicioTableViewCell.swift
//  LearningTask-10.2
//
//  Created by Laura Pinheiro Marson on 30/11/22.
//

import UIKit

class ExercicioTableViewCell: UITableViewCell {

    @IBOutlet weak var simboloLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var exercicio: Exercicio? {
        didSet {
            guard let exercicio = exercicio else { return }

            simboloLabel.text = exercicio.simbolo
            tituloLabel.text = exercicio.nome
            descricaoLabel.text = exercicio.descricao
        }
    }
}
