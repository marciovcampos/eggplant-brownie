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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView!
    
    // MARK: - Atributos
    
    var delegate: AddRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets

    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: View life cycle
    
    override func viewDidLoad(){
        
        let botaoAdicionarItem = UIBarButtonItem(title: "Add Item",
                                                 style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        itens = ItemDao().recupera()
        
    }
    
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(titulo: "Desculpe", mensagem: "Não foi possível atualizar a tabela")
        }
        
     }
     
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        return celula
      }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela =  indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else{
            Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo nome")
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
            let felicidade = Int(felicidadeDaRefeicao) else {
                Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo felicidade")
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: - IBActions
        
    @IBAction func adicionar(_ sender: Any) {
        guard let refeicao = recuperaRefeicaoDoFormulario() else {
            return
        }
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
}

