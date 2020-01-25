//
//  ProTableViewController.swift
//  FinalLabAssignment_761984
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ProTableViewController: UITableViewController {
    var product_array: [Product]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()
        saveCoreData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return product_array?.count ?? 00
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let productIndex = product_array![indexPath.row]
        
        
        cell.textLabel?.text = productIndex.P_name
        return cell
    }
    
    @objc func saveCoreData(){
        
        clearCoreData()
        
        let app_Delegate = UIApplication.shared.delegate as! AppDelegate
        let context = app_Delegate.persistentContainer.viewContext

        
        
        let pro1 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro1.setValue("book", forKey: "name")
        pro1.setValue("p1", forKey: "id")
        pro1.setValue("book for Data Structure", forKey: "descrip")
        pro1.setValue(100, forKey: "price")


        let pro2 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro2.setValue("pen", forKey: "name")
        pro2.setValue("p2", forKey: "id")
        pro2.setValue("pen...!", forKey: "descrip")
        pro2.setValue(50, forKey: "price")
        
        
        let pro3 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro3.setValue("Shampoo", forKey: "name")
        pro3.setValue("p3", forKey: "id")
        pro3.setValue("Shampoo...!", forKey: "descrip")
        pro3.setValue(200, forKey: "price")
        
        
        
        let pro4 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
        
        pro4.setValue("Bottle", forKey: "name")
        pro4.setValue("p4", forKey: "id")
        pro4.setValue("Bottle...!", forKey: "descrip")
        pro4.setValue(80, forKey: "price")
        
        
        let pro5 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro5.setValue("Pencil", forKey: "name")
        pro5.setValue("p5", forKey: "id")
        pro5.setValue("pencil...!", forKey: "descrip")
        pro5.setValue(20, forKey: "price")


        let pro6 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro6.setValue("Cream", forKey: "name")
        pro6.setValue("p6", forKey: "id")
        pro6.setValue("cream...!", forKey: "descrip")
        pro6.setValue(300, forKey: "price")

        let pro7 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        
        pro7.setValue("Pen Drive", forKey: "name")
        pro7.setValue("p7", forKey: "id")
        pro7.setValue("pen drive...!", forKey: "descrip")
        pro7.setValue(500, forKey: "price")


        let pro8 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

        pro8.setValue("Scale", forKey: "name")
        pro8.setValue("p8", forKey: "id")
        pro8.setValue("scale...!", forKey: "descrip")
        pro8.setValue(35, forKey: "price")
        
        
        
        let pro9 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
        pro9.setValue("TV", forKey: "name")
         pro9.setValue("p9", forKey: "id")
         pro9.setValue("tv..!", forKey: "descrip")
         pro9.setValue(700, forKey: "price")
         
        
        
        let pro10 = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)

         pro10.setValue("Tablet", forKey: "name")
         pro10.setValue("p10", forKey: "id")
         pro10.setValue("tablet...!", forKey: "descrip")
         pro10.setValue(400, forKey: "price")
        
        
                      // 4th step: save context

                do{
                    try context.save()
                        print(pro1, "is saved")
                        print(pro2, "is saved")
                        print(pro3, "is saved")
                        print(pro4, "is saved")
                        print(pro5, "is saved")
                        print(pro6, "is saved")
                        print(pro7, "is saved")
                        print(pro8, "is saved")
                        print(pro9, "is saved")
                        print(pro10, "is saved")
                        
                      }
                      catch{
                          print(error)
                      }
   }
    
        func loadCoreData(){
    
        product_array = [Product]()

        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")

        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let product_name = result.value(forKey: "name") as! String
                    let product_id = result.value(forKey: "id") as! String
                    let product_description = result.value(forKey: "descrip") as! String
                    let product_price = result.value(forKey: "price") as! Int
                    product_array?.append(Product(P_name: product_name, P_id: product_id, P_descrip: product_description, P_price: product_price))
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

        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")

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



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
