//
//  TableViewController.swift
//  API train
//
//  Created by Антон Заверуха on 16.03.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit

struct CurrencyInfo {
    
    var txt: String
    var cc: String
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currency = currencies[indexPath.row]
        cell.textLabel?.text = "\(currency.cc) : \(currency.txt)"
        
        
        return cell
    }
    
    func CreateTable(){
        
        self.mytableview = UITableView(frame: view.bounds, style: .plain)
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        self.mytableview.delegate = self
        self.mytableview.dataSource = self
        
        view.addSubview(mytableview)
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    var mytableview = UITableView()
    let identifire = "Cell"
    
    let currencies = [
        CurrencyInfo(txt: "Долар США", cc: "USD"),
        CurrencyInfo(txt: "Євро", cc: "EUR"),
        CurrencyInfo(txt: "Російський рубль", cc: "RUB"),
        CurrencyInfo(txt: "Фунт стерлінгів", cc: "GBP"),
        CurrencyInfo(txt: "Чеська крона", cc: "CZK"),
        CurrencyInfo(txt: "Японська єна", cc: "JPY"),
        CurrencyInfo(txt: "Польський злотий", cc: "PLN"),
        CurrencyInfo(txt: "Золото", cc: "XAU"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateTable()
        
    }
    
}
    

    

