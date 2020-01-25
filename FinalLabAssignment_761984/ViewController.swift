//
//  ViewController.swift
//  FinalLabAssignment_761984
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func loadCoreData(){
           
           //create an instance of app delegate
           let app_delegate = UIApplication.shared.delegate as! AppDelegate
           let managed_context = app_delegate.persistentContainer.viewContext
           let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Prod")
           
           do{
            
               let results = try managed_context.fetch(fetchReq)
            
               if results is [NSManagedObject]{
                
                
                   for result in results as! [NSManagedObject]{
                    
                       let pro_Name = result.value(forKey: "name") as! String
                    
                       let pro_Id = result.value(forKey: "id") as! String
                    
                       let pro_Description = result.value(forKey: "descrip") as! String
                    
                       let pro_Price = result.value(forKey: "price") as! Int
                       
                   }
               }
           }
           catch{
               print(error)
           }
           
           
       }
       

}

