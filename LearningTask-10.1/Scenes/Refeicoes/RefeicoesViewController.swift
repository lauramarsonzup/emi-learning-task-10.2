//
//  RefeicoesViewController.swift
//  LearningTask-10.1

//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class RefeicoesViewController: UITableViewController {
    
    private enum Segues: String {
        case verDetalhesRefeicao = "verDetalhesRefeicaoSegue"
        case verFormNovaRefeicao = "verFormRefeicaoSegue"
    }
    
    var refeicoesAPI: RefeicoesAPI?
    
    var refeicoes: [Refeicao] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
        carregaRefeicoes()
    }
    
    func setupViews() {
        tableView.tableHeaderView = RefeicoesTableHeaderView.build()
    }
    
    func carregaRefeicoes() {
        guard let refeicoesAPI = refeicoesAPI else { return }
        refeicoes = refeicoesAPI.carregaTodas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier,
            let segueEsperada = RefeicoesViewController.Segues(rawValue: segueId) else { return }
        
        switch segueEsperada {
        case .verDetalhesRefeicao:
            prepareForDetalhesRefeicao(segue, sender)
        case .verFormNovaRefeicao:
            prepareForFormNovaRefeicao(segue, sender)
        }
    }
    
    private func prepareForDetalhesRefeicao(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let celula = sender as? RefeicaoTableViewCell,
              let controllerDestino = segue.destination as? DetalhesRefeicaoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.refeicao = celula.refeicao
    }
    
    private func prepareForFormNovaRefeicao(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let controllerDestino = segue.destination as? NovaRefeicaoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.delegate = self
    }
    
}

// MARK: NovaRefeicaoViewController related code
extension RefeicoesViewController: NovaRefeicaoViewControllerDelegate {
    func novaRefeicaoViewController(_ controller: NovaRefeicaoViewController, adicionou refeicao: Refeicao) {
        refeicoes.append(refeicao)
    }
}

// MARK: UITableViewDataSource implementations
extension RefeicoesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "RefeicaoTableViewCell", for: indexPath) as? RefeicaoTableViewCell else {
            fatalError("Não foi possível obter célula para a lista de refeições")
        }
        
        celula.refeicao = refeicoes[indexPath.row]
        return celula
    }

}
