//
//  DetalhesRefeicaoViewController.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class DetalhesRefeicaoViewController: UITableViewController {
    
    var refeicao: Refeicao!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = DetalhesRefeicaoTableHeaderView.build(from: refeicao)
        
        tableView.register(DefaultTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: DefaultTableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = DefaultTableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }

}

// MARK: UITableViewDataSource implementations
extension DetalhesRefeicaoViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicao.ingredientes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "IngredienteTableViewCell", for: indexPath) as? IngredienteTableViewCell else {
            fatalError("Não foi possível obter célula para a lista de ingredientes em DetalhesRefeicao")
        }
        
        celula.ingrediente = refeicao.ingredientes[indexPath.row]
        return celula
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DefaultTableSectionHeaderView.reuseId) as? DefaultTableSectionHeaderView else {
            fatalError("Não foi possível recuperar header view para o titulo de seção em DetalherRefeicao")
        }
        
        header.titulo = "Ingredientes"
        return header
    }

}
