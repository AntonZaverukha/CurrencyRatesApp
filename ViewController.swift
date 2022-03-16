//
//  ViewController.swift
//  API train
//
//  Created by Антон Заверуха on 06.03.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var USDlabel: UILabel!
    @IBOutlet weak var CurrencyNameLabel: UILabel!
    @IBOutlet weak var CurrencyText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func SubmitButton(_ sender: Any) {
//        isEditing = true
        
        crr()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    func crr(){
        if let cname = CurrencyText.text {
            
                self.CurrencySearch(name: "\(cname.uppercased())")
            
        }
    }
            
    func CurrencySearch(name: String){
                fethPostData { (posts) in
                            for post in posts{
                                
                                if post.cc == name {
                                    let Rate: String = String(format: "%.2f", post.rate)
                                    DispatchQueue.main.async {
                                            self.USDlabel.text = Rate
                                            self.CurrencyNameLabel.text = name
                                                   }
                                   
                //                print(post.rate!)
                //                print(post.cc!)
    //                            print(post.rate!)
                //                print(post.txt!)
                //                print(post.exchangedata!)
                                print("\n")
                                }
                            }
                        }
            }
    
    
    func fethPostData(completionHandler: @escaping ([Post]) -> Void){

        let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in

            guard let data = data else {return}
            do {
                let postData = try JSONDecoder().decode([Post].self, from: data)
                completionHandler(postData)
//                let result = postData.filter({ $0.cc == "USD"})
//                print(result)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()


    }
       
}



