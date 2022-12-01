//
//  NovoExercicioViewController.swift
//  LearningTask-10.2
//
//  Created by Laura Pinheiro Marson on 30/11/22.
//

import UIKit

protocol NovoExercicioViewControllerDelegate: AnyObject {
    func novoExercicioViewController(_ controller: NovoExercicioViewController,
                                       adicionou exercicio: Exercicio)
}

class NovoExercicioViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var simboloTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextField!
    
    weak var delegate: NovoExercicioViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoAdicionarPressionado(_ sender: UIButton) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaExercicio()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Informe um nome para o exercício.")
        }
        
        if let simbolo = simboloTextField.text, simbolo.isEmpty {
            return (false, "Informe o emoji símbolo para o exercício.")
        }
        
        if let descricao = descricaoTextField.text, descricao.isEmpty {
            return (false, "Informe a descrição do exercício.")
        }
        
        return (true, nil)
    }

    func adicionaExercicio() {
        let exercicio = Exercicio(simbolo: simboloTextField.text!, nome: nomeTextField.text!, descricao: descricaoTextField.text!)
                
        delegate?.novoExercicioViewController(self, adicionou: exercicio)
        self.dismiss(animated: true)
    }
    
}

// MARK: - UITextField delegation related code
extension NovoExercicioViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let currentText = textField.text,
              currentText.isEmpty || string.isEmpty else { return false }
        
        return true
    }
    
}


