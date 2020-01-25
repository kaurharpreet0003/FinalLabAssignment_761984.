//
//  ProViewController.swift
//  FinalLabAssignment_761984
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ProViewController: UIViewController {

    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var idLbl: UITextField!
    @IBOutlet weak var descriptionLbl: UITextField!
    @IBOutlet weak var priceLbl: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()
        saveCoreData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func saveCoreData(){
        
        clearCoreData()
           
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                     
            let context = appDelegate.persistentContainer.viewContext
                         
                     
        let p1 = NSEntityDescription.insertNewObject(forEntityName: "Prod", into: context)
                         
        p1.setValue("Table", forKey: "proN")
        
        p1.setValue("p11", forKey: "proI")
        
        p1.setValue("Table....", forKey: "proD")
        
        p1.setValue(100, forKey: "proP")

                         do{
                             try context.save()
                             print(p1, "is saved")
                         }
                         catch{
                             print(error)
                         }
       }
       
       
    
    
       
       func loadCoreData(){
           
           let app_Delegate = UIApplication.shared.delegate as! AppDelegate
               
           let managed_Context = app_Delegate.persistentContainer.viewContext
           
           let fetch_Request = NSFetchRequest<NSFetchRequestResult>(entityName: "Prod")
           
           do{
               let results = try managed_Context.fetch(fetch_Request)
               if results is [NSManagedObject]{
                
                   for result in results as! [NSManagedObject]{
                    
                       let productName = result.value(forKey: "proN") as! String
                    
                       let productId = result.value(forKey: "proI") as! String
                    
                       let productDescription = result.value(forKey: "proD") as! String
                    
                       let productPrice = result.value(forKey: "proP") as! Int
                    
                       nameLbl.text = productName
                       idLbl.text = productId
                       priceLbl.text = String(productPrice)
                       descriptionLbl.text = productDescription
                   }
               }
           }
           catch{
               print(error)
           }
           
           
       }
       
    
    
    
    
       func clearCoreData(){
           
           //create an instance of app delegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
         
           let managedContext = appDelegate.persistentContainer.viewContext
           
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Prod")
           
           fetchRequest.returnsObjectsAsFaults = false
           
           do{
            
               let results = try managedContext.fetch(fetchRequest)
               for managedObjects in results{
                
                   if let managedObjectData = managedObjects as? NSManagedObject{
                       managedContext.delete(managedObjectData)
                   }
               }
           }
            
           catch{
               print(error)
           }
       }


}
