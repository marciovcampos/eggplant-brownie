//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 10/06/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Beringela", felicidade: 1),
                     Refeicao(nome: "Pizza", felicidade: 5),
                     Refeicao(nome: "Macarrão", felicidade: 3)]

     // MARK: - UITableViewDataSource
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return refeicoes.count
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let linha = indexPath.row

         let refeicao = refeicoes[linha]

         let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
         cell.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_ :)))
        cell.addGestureRecognizer(longPress)

         return cell
     }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            print(refeicao.nome)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionarRefeicao" {
            if let viewController =  segue.destination as? ViewController{
                viewController.delegate = self
                   }
        }
    }
    
}
