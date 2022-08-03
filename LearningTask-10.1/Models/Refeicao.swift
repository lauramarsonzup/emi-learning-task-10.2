//
//  Refeicao.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

struct Ingrediente {
    let simbolo: String
    let nome: String
    let quantidade: String
}

struct Refeicao {
    let simbolo: String
    let titulo: String
    let horario: String
    let ingredientes: [Ingrediente]
}
