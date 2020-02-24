//
//  MyTableViewController.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import UIKit
import Charts

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var testLabel: UILabel!
    var searchController : UISearchController!
       var searchResult : [String] = []
       var selectedCities : [String] = []
       var data : [String] = ["Tirana" , "Andorra la Vella" , "Yerevan" , "Vienna" , "Baku" , "Minsk" , "Brussels" , "Sarajevo" , "Sofia" , "Zagreb" , "Nicosia" , "Prague" , "Copenhagen" , "Tallinn" , "Helsinki" , "Paris" , "Tbilisi" , "Berlin" , "Athens" , "Budapest" , "Reykjavik" , "Nur-Sultan" , "Pristina" , "Riga" , "Vaduz" , "Vilnius" , "Luxembourg" , "Valletta" , "Chisinau" , "Monaco" , "Podgorica" , "Amsterdam" , "Skopje" , "Oslo" , "Warsaw" , "Lisbon" , "Bucharest" , "Moscow" , "San Marino" , "Belgrade" , "Bratislava" , "Ljubljana" , "Madrid" , "Stockholm" , "Bern" , "Kiev" , "London" , "Vatican" , "Damascus" , "Istanbul" , "Cairo" , "Dubai"  ]
      
       
       func updateSearchResults(for searchController: UISearchController) {
          
           if let text = searchController.searchBar.text?.lowercased() {
               searchResult = data.filter { $0.lowercased().contains(text.lowercased()) }
               } else {
               searchResult = []
               }
           
           tableView.reloadData()
       }
       
       var shouldUseSearchResult : Bool {
        
       if let t = searchController.searchBar.text {
       if t.isEmpty {
        return false
        }
       } else {
               return false
           }
       return searchController.isActive }
       
       func numberOfSections(in tableView: UITableView) -> Int {
         
           return 1
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
           if shouldUseSearchResult {
               return searchResult.count
           }else {
               return data.count
           }
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
               if shouldUseSearchResult {
                   cell.textLabel?.text = searchResult[indexPath.row]
               } else {
                   cell.textLabel?.text = data[indexPath.row]
               }
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

               
           let cell = tableView.cellForRow(at: indexPath)!
           let labelContent = cell.textLabel?.text
           selectedCities.append(labelContent!)
           print(selectedCities)
           
          
           
           
           let weatherApi=API()
           weatherApi.fetchWeather(cityName: labelContent!){
                  (Result) in
                  
                  switch Result{
                  case.success(let weather):
                          DispatchQueue.main.async {
                              let temp : Double = weather.main.temp
                              //print(" temp now is : \(temp)")
                              let desc : String = weather.weather[0].description
                              //print("Sky description is : \(desc)")
                           self.testLabel.text = " temp now is : \(temp)° and Sky description is : \(desc)"
                              }
                          case.failure(let error): print("Error \(error)")
                          }
                }
       }
    
     
       func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           let cell = tableView.cellForRow(at: indexPath)!
           let labelContent = cell.textLabel?.text
           
           if let unWanted = selectedCities.firstIndex(of: labelContent!){
               selectedCities.remove(at: unWanted)
           }
           print(selectedCities)

       }
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           definesPresentationContext = true
           searchController = UISearchController(searchResultsController: nil)
           searchController.searchResultsUpdater = self
           searchController.obscuresBackgroundDuringPresentation = false
           navigationItem.searchController = searchController
        
           tableView.delegate = self
           tableView.dataSource = self
           
           
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*//*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
