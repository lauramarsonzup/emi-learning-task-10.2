//
//  IngredienteTableViewCell.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class IngredienteTableViewCell: UITableViewCell {

    @IBOutlet weak var simboloLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    var ingrediente: Ingrediente? {
       didSet {
           guard let ingrediente = ingrediente else { return }
           
           simboloLabel.text = ingrediente.simbolo
           nomeLabel.text = ingrediente.nome
           quantidadeLabel.text = ingrediente.quantidade
        }
    }

}
