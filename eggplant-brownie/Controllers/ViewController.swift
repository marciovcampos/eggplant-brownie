//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 27/04/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

protocol AddRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      
    // MARK: - Atributos
    
    var delegate: AddRefeicaoDelegate?
    var itens: [String] = ["Molho de Tomate", "Queijo", "Pimenta", "Manjerição"]
    
    // MARK: - IBOutlets

    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item
        return celula
      }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
        }else {
            celula.accessoryType = .none
        }
        
    }
    
    // MARK: - IBActions
        
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
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    
}

