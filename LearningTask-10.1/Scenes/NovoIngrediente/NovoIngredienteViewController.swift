//
//  NovoIngredienteViewController.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 21/07/2022.
//

import UIKit

protocol NovoIngredienteViewControllerDelegate: AnyObject {
    func novoIngredienteViewController(_ controller: NovoIngredienteViewController,
                                       adicionou ingrediente: Ingrediente)
}

class NovoIngredienteViewController: UIViewController {

    typealias MensagemDeValidacao = String
    
    @IBOutlet private weak var nomeTextField: UITextField!
    @IBOutlet private weak var simboloTextField: UITextField!
    @IBOutlet private weak var quantidadeTextField: UITextField!
    
    weak var delegate: NovoIngredienteViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoAdicionarPressionado(_ sender: UIButton) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaIngrediente()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Informe um nome para o ingrediente.")
        }
        
        if let simbolo = simboloTextField.text, simbolo.isEmpty {
            return (false, "Informe o emoji símbolo para o ingrediente.")
        }
        
        if let quantidade = quantidadeTextField.text, quantidade.isEmpty {
            return (false, "Informe a descrição da quantidade para o item.")
        }
        
        return (true, nil)
    }

    func adicionaIngrediente() {
        let ingrediente = Ingrediente(simbolo: simboloTextField.text!,
                                      nome: nomeTextField.text!,
                                      quantidade: quantidadeTextField.text!)
                
        delegate?.novoIngredienteViewController(self, adicionou: ingrediente)
        self.dismiss(animated: true)
    }
    
}

extension NovoIngredienteViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let currentText = textField.text,
              currentText.isEmpty || string.isEmpty else { return false }
        
        return true
    }
    
}
