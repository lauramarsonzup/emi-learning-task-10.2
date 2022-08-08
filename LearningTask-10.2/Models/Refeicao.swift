//
//  Refeicao.swift
//  LearningTask-10.2
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

extension Refeicao: Detailable {
    var symbol: String {
        return simbolo
    }
    
    var title: String {
        return titulo
    }
    
    var subtitle: String {
        return horario
    }
}
