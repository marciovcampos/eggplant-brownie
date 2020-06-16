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
    
    override func viewDidLoad() {
        guard let caminho = recuperaCaminho() else { return }
        
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return }
            refeicoes = refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
    }

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

        guard let caminho = recuperaCaminho() else { return }
        
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {
                    alerta in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
            })
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
