//
//  NovoTreinoViewController.swift
//  LearningTask-10.2
//
//  Created by Laura Pinheiro Marson on 30/11/22.
//

import UIKit

protocol NovoTreinoViewControllerDelegate: AnyObject {
    func novoTreinoViewController(_ controller: NovoTreinoViewController,
                                    adicionou treino: Treino)
}

class NovoTreinoViewController: UIViewController {
    
    typealias MensagemDeValidacao = String

    @IBOutlet var perfilButtons: [UIButton]!
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextField!
    @IBOutlet weak var exerciciosTableView: UITableView!
    
    
    weak var delegate: NovoTreinoViewControllerDelegate?
    
    var perfilSelecionado: Int = 1 {
        didSet {
            atualizaViews()
        }
    }
    
    var exercicios: [Exercicio] = [] {
        didSet {
            exerciciosTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaViews()
    }

    private func atualizaViews() {
        perfilButtons.forEach { button in
            button.isEnabled = button.tag != perfilSelecionado
        }
    }
    
    @IBAction func selecionaPerfilDeRefeicao(_ sender: UIButton) {
        perfilSelecionado = sender.tag
    }
    
    @IBAction func botaoAdicionarPressionado(_ sender: Any) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaTreino()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let titulo = tituloTextField.text, titulo.isEmpty {
            return (false, "Informe um título para o treino.")
        }
        
        if let descricao = descricaoTextField.text, descricao.isEmpty {
            return (false, "Informe a descrição para o treino.")
        }
        
        if exercicios.isEmpty {
            return (false, "Adicione ao menos um exercício para o treino.")
        }
        
        return (true, nil)
    }

    func adicionaTreino() {
        let simbolo = perfilButtons.filter({ button in
            button.tag == perfilSelecionado
        }).first!.titleLabel!.text!
        
        let treino = Treino(simbolo: simbolo, titulo: tituloTextField.text!, descricao: descricaoTextField.text!, exercicios: exercicios)
        
        delegate?.novoTreinoViewController(self, adicionou: treino)
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "verFormExercicioSegue" else { return }
        
        guard let controllerDestino = segue.destination as? NovoExercicioViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.delegate = self
    }
    
}

// MARK: - NovoExercicioViewController delegation implementation
extension NovoTreinoViewController: NovoExercicioViewControllerDelegate {
    func novoExercicioViewController(_ controller: NovoExercicioViewController,
                                       adicionou exercicio: Exercicio) {
        exercicios.append(exercicio)
    }
}

// MARK: - UITableViewDataSource related implementation
extension NovoTreinoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "ExercicioTableViewCell", for: indexPath) as? ExercicioTableViewCell else {
            fatalError("Não foi possível recuperar uma célula para o ingrediente em NovaRefeicao")
        }
        
        celula.exercicio = exercicios[indexPath.row]
        return celula
    }
    
}
