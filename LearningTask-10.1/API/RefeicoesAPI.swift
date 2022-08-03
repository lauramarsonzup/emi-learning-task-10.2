//
//  RefeicaoAPI.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

class RefeicoesAPI {
    
    func carregaTodas() -> [Refeicao] {
        let ingredientes = [
            Ingrediente(simbolo: "🍚", nome: "Arroz branco", quantidade: "120g"),
            Ingrediente(simbolo: "🫘", nome: "Feijão", quantidade: "80g"),
            Ingrediente(simbolo: "🥩", nome: "Contra filé bovino", quantidade: "120g"),
            Ingrediente(simbolo: "🥗", nome: "Salada de folhas", quantidade: "à vontade"),
            Ingrediente(simbolo: "🥦", nome: "Brócolis", quantidade: "90g"),
        ]
    
        return [
            Refeicao(simbolo: "☕️", titulo: "Café da manhã", horario: "07:00", ingredientes: ingredientes),
            Refeicao(simbolo: "🥪", titulo: "Lanche 1", horario: "10:00", ingredientes: ingredientes),
            Refeicao(simbolo: "🍽", titulo: "Almoço", horario: "13:00", ingredientes: ingredientes),
            Refeicao(simbolo: "🥪", titulo: "Lanche 2", horario: "16:00", ingredientes: ingredientes),
            Refeicao(simbolo: "🍽", titulo: "Jantar", horario: "19:00", ingredientes: ingredientes),
            Refeicao(simbolo: "🍵", titulo: "Ceia", horario: "22:00", ingredientes: ingredientes),
        ]
    }
    
}
