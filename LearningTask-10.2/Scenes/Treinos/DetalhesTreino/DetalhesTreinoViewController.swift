//
//  DetalhesTreinoViewController.swift
//  LearningTask-10.2
//
//  Created by Laura Pinheiro Marson on 30/11/22.
//

import UIKit

class DetalhesTreinoViewController: UITableViewController {

    var treino: Treino!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = DetailsTableHeaderView.build(from: treino)
        
        tableView.register(DefaultTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: DefaultTableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = DefaultTableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }

}

// MARK: - UITableViewDataSource related code
extension DetalhesTreinoViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treino.exercicios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "ExercicioTableViewCell", for: indexPath) as? ExercicioTableViewCell else {
            fatalError("Não foi possível obter célula para a lista de ingredientes em DetalhesRefeicao")
        }
        
        celula.exercicio = treino.exercicios[indexPath.row]
        return celula
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DefaultTableSectionHeaderView.reuseId) as? DefaultTableSectionHeaderView else {
            fatalError("Não foi possível recuperar header view para o titulo de seção em DetalhesRefeicao")
        }
        
        header.titulo = "Exercícios"
        return header
    }

}

