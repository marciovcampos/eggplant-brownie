//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 27/04/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController?

    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet var felicidadeTextField: UITextField?
        
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
            let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        tableViewController?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    
}

