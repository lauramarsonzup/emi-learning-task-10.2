//
//  TreinoTableViewCell.swift
//  LearningTask-10.2
//
//  Created by Laura Pinheiro Marson on 30/11/22.
//

import UIKit

class TreinoTableViewCell: UITableViewCell {

    @IBOutlet weak var simboloLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var treino: Treino? {
        didSet {
            guard let treino = treino else { return }

            simboloLabel.text = treino.simbolo
            tituloLabel.text = treino.titulo
            descricaoLabel.text = treino.descricao
        }
    }
}
