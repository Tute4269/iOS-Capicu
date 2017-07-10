//
//  ThreePlayersController.swift
//  Capicu
//
//  Created by Anthony Benitez on 1/31/17.
//  Copyright © 2017 SymphoLife. All rights reserved.
//

import UIKit

class ThreePlayersController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var player_1_scores = [Int]()
    var player_1_total_score = 0
    var player_1_name_text = "Player 1"
    @IBOutlet weak var player_1_name: UILabel!
    @IBOutlet weak var player_1_score: UILabel!
    @IBOutlet weak var player_1_table: UITableView!
    
    var player_2_scores = [Int]()
    var player_2_total_score = 0
    var player_2_name_text = "Player 2"
    @IBOutlet weak var player_2_name: UILabel!
    @IBOutlet weak var player_2_score: UILabel!
    @IBOutlet weak var player_2_table: UITableView!
    
    var player_3_scores = [Int]()
    var player_3_total_score = 0
    var player_3_name_text = "Player 3"
    @IBOutlet weak var player_3_name: UILabel!
    @IBOutlet weak var player_3_score: UILabel!
    @IBOutlet weak var player_3_table: UITableView!
    
    func handlePress(sender: UILongPressGestureRecognizer) {
        if sender.view?.tag == 1 {
            let alert = UIAlertController(title: "Player 1", message: "Set the name of Player 1", preferredStyle: .alert)
            
            alert.addTextField { (new_score) in
                new_score.placeholder = "Player 1 Name"
                new_score.keyboardType = UIKeyboardType.alphabet
                new_score.autocapitalizationType = .words
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
                self.dismiss(animated: true, completion: {
                    // Do nothing
                })
            }))
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
                if let the_new_score = alert!.textFields?[0].text {
                    self.player_1_name.text = the_new_score
                    UserDefaults.standard.set(the_new_score, forKey: "3p_player1name")
                }
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        } else if sender.view?.tag == 2 {
            let alert = UIAlertController(title: "Player 2", message: "Set the name of Player 2", preferredStyle: .alert)
            
            alert.addTextField { (new_score) in
                new_score.placeholder = "Player 2 Name"
                new_score.keyboardType = UIKeyboardType.alphabet
                new_score.autocapitalizationType = .words
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
                self.dismiss(animated: true, completion: {
                    // Do nothing
                })
            }))
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
                if let the_new_score = alert!.textFields?[0].text {
                    self.player_2_name.text = the_new_score
                    UserDefaults.standard.set(the_new_score, forKey: "3p_player2name")
                }
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        } else if sender.view?.tag == 3 {
            let alert = UIAlertController(title: "Player 3", message: "Set the name of Player 3", preferredStyle: .alert)
            
            alert.addTextField { (new_score) in
                new_score.placeholder = "Player 3 Name"
                new_score.keyboardType = UIKeyboardType.alphabet
                new_score.autocapitalizationType = .words
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
                self.dismiss(animated: true, completion: {
                    // Do nothing
                })
            }))
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
                if let the_new_score = alert!.textFields?[0].text {
                    self.player_3_name.text = the_new_score
                    UserDefaults.standard.set(the_new_score, forKey: "3p_player3name")
                }
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearTables(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Game", message: "Are you sure you want to reset this game?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            self.dismiss(animated: true, completion: {
                // Do nothing
            })
        }))
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            self.player_1_scores.removeAll()
            self.player_1_total_score = 0
            self.player_1_score.text = String(self.player_1_total_score)
            self.player_1_table.reloadData()
            self.player_1_name.text = "Player 1"
            UserDefaults.standard.set("Player 1", forKey: "3p_player1name")
            UserDefaults.standard.set([Int](), forKey: "3p_player1scores")
            
            
            self.player_2_scores.removeAll()
            self.player_2_total_score = 0
            self.player_2_score.text = String(self.player_2_total_score)
            self.player_2_table.reloadData()
            self.player_2_name.text = "Player 2"
            UserDefaults.standard.set("Player 2", forKey: "3p_player2name")
            UserDefaults.standard.set([Int](), forKey: "3p_player2scores")
            
            self.player_3_scores.removeAll()
            self.player_3_total_score = 0
            self.player_3_score.text = String(self.player_3_total_score)
            self.player_3_table.reloadData()
            self.player_3_name.text = "Player 3"
            UserDefaults.standard.set("Player 3", forKey: "3p_player3name")
            UserDefaults.standard.set([Int](), forKey: "3p_player3scores")
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToPlayerOne(_ sender: Any) {
        let alert = UIAlertController(title: "Player 1 Wins", message: "Add points to the winner", preferredStyle: .alert)
        
        alert.addTextField { (new_score) in
            new_score.placeholder = "Points"
            new_score.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            self.dismiss(animated: true, completion: {
                // Do nothing
            })
        }))
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            if let the_new_score = alert!.textFields?[0].text {
                if the_new_score == "" {
                    self.dismiss(animated: true, completion: {
                        // Do nothing
                    })
                } else {
                    // append new score to table
                    self.player_1_scores.append(Int(the_new_score)!)
                    
                    // update the total score variable
                    self.player_1_total_score = self.player_1_total_score + (Int(the_new_score)!)
                    
                    self.player_1_table.reloadData()
                    self.player_1_score.text = String(self.player_1_total_score)
                    
                    UserDefaults.standard.set(self.player_1_scores, forKey: "3p_player1scores")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToPlayerTwo(_ sender: Any) {
        let alert = UIAlertController(title: "Player 2 Wins", message: "Add points to the winner", preferredStyle: .alert)
        
        alert.addTextField { (new_score) in
            new_score.placeholder = "Points"
            new_score.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            self.dismiss(animated: true, completion: {
                // Do nothing
            })
        }))
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            if let the_new_score = alert!.textFields?[0].text {
                if the_new_score == "" {
                    self.dismiss(animated: true, completion: {
                        // Do nothing
                    })
                } else {
                    // append new score to table
                    self.player_2_scores.append(Int(the_new_score)!)
                    
                    // update the total score variable
                    self.player_2_total_score = self.player_2_total_score + (Int(the_new_score)!)
                    
                    self.player_2_table.reloadData()
                    self.player_2_score.text = String(self.player_2_total_score)
                    
                    UserDefaults.standard.set(self.player_2_scores, forKey: "3p_player2scores")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToPlayerThree(_ sender: Any) {
        let alert = UIAlertController(title: "Player 3 Wins", message: "Add points to the winner", preferredStyle: .alert)
        
        alert.addTextField { (new_score) in
            new_score.placeholder = "Points"
            new_score.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            self.dismiss(animated: true, completion: {
                // Do nothing
            })
        }))
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            if let the_new_score = alert!.textFields?[0].text {
                if the_new_score == "" {
                    self.dismiss(animated: true, completion: {
                        // Do nothing
                    })
                } else {
                    // append new score to table
                    self.player_3_scores.append(Int(the_new_score)!)
                    
                    // update the total score variable
                    self.player_3_total_score = self.player_3_total_score + (Int(the_new_score)!)
                    
                    self.player_3_table.reloadData()
                    self.player_3_score.text = String(self.player_3_total_score)
                    
                    UserDefaults.standard.set(self.player_3_scores, forKey: "3p_player3scores")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        
        if tableView.isEqual(player_1_table) {
            rowCount = player_1_scores.count
        } else if tableView.isEqual(player_2_table) {
            rowCount = player_2_scores.count
        } else if tableView.isEqual(player_3_table) {
            rowCount = player_3_scores.count
        }
        
        return rowCount
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        if tableView.isEqual(player_1_table) {
            cell.textLabel?.text = String(player_1_scores[indexPath.row])
        } else if tableView.isEqual(player_2_table) {
            cell.textLabel?.text = String(player_2_scores[indexPath.row])
        } else if tableView.isEqual(player_3_table) {
            cell.textLabel?.text = String(player_3_scores[indexPath.row])
        }
        
        return cell
    }
    
    
    // function to be able to delete rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // if delete is used
        if editingStyle == UITableViewCellEditingStyle.delete {
            if tableView.isEqual(player_1_table) {
                // update list items when deleting item
                player_1_total_score -= player_1_scores[indexPath.row]
                player_1_score.text = String(player_1_total_score)
                
                // remove from places Dictionary, set the standardDefault, and reload the table data
                player_1_scores.remove(at: indexPath.row)
                player_1_table.reloadData()
                UserDefaults.standard.set(player_1_scores, forKey: "3p_player1scores")
            } else if tableView.isEqual(player_2_table) {
                // update list items when deleting item
                player_2_total_score -= player_2_scores[indexPath.row]
                player_2_score.text = String(player_2_total_score)
                
                // remove from places Dictionary, set the standardDefault, and reload the table data
                player_2_scores.remove(at: indexPath.row)
                player_2_table.reloadData()
                UserDefaults.standard.set(player_2_scores, forKey: "3p_player2scores")
            } else if tableView.isEqual(player_3_table) {
                // update list items when deleting item
                player_3_total_score -= player_3_scores[indexPath.row]
                player_3_score.text = String(player_3_total_score)
                
                // remove from places Dictionary, set the standardDefault, and reload the table data
                player_3_scores.remove(at: indexPath.row)
                player_3_table.reloadData()
                UserDefaults.standard.set(player_3_scores, forKey: "3p_player3scores")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGestureRecognizer1 = UILongPressGestureRecognizer(target: self, action: #selector(ThreePlayersController.handlePress))
        let longPressGestureRecognizer2 = UILongPressGestureRecognizer(target: self, action: #selector(ThreePlayersController.handlePress))
        let longPressGestureRecognizer3 = UILongPressGestureRecognizer(target: self, action: #selector(ThreePlayersController.handlePress))
        player_1_name.isUserInteractionEnabled = true
        player_2_name.isUserInteractionEnabled = true
        player_3_name.isUserInteractionEnabled = true
        player_1_name.addGestureRecognizer(longPressGestureRecognizer1)
        player_2_name.addGestureRecognizer(longPressGestureRecognizer2)
        player_3_name.addGestureRecognizer(longPressGestureRecognizer3)
        
        let logo = UIImage(named: "domino3.png")! as UIImage
        let imageView = UIImageView(image:logo)
        imageView.frame.size.width = 40;
        imageView.frame.size.height = 40;
        
        self.navigationItem.titleView = imageView
        
        if let name_1 = UserDefaults.standard.object(forKey: "3p_player1name") as? String {
            player_1_name.text = name_1
            player_1_name_text = name_1
        }
        
        if let name_2 = UserDefaults.standard.object(forKey: "3p_player2name") as? String {
            player_2_name.text = name_2
            player_2_name_text = name_2
        }
        
        if let name_3 = UserDefaults.standard.object(forKey: "3p_player3name") as? String {
            player_3_name.text = name_3
            player_3_name_text = name_3
        }
        
        if let player_1_scores_arr = UserDefaults.standard.object(forKey: "3p_player1scores") as? [Int] {
            player_1_scores = player_1_scores_arr
        }
        
        if let player_2_scores_arr = UserDefaults.standard.object(forKey: "3p_player2scores") as? [Int] {
            player_2_scores = player_2_scores_arr
        }
        
        if let player_3_scores_arr = UserDefaults.standard.object(forKey: "3p_player3scores") as? [Int] {
            player_3_scores = player_3_scores_arr
        }
        
        player_1_table.reloadData()
        player_2_table.reloadData()
        player_3_table.reloadData()
        
        player_1_total_score = player_1_scores.reduce(0, { x, y in x + y })
        player_1_score.text = String("\(player_1_total_score)")
        player_2_total_score = player_2_scores.reduce(0, { x, y in x + y })
        player_2_score.text = String("\(player_2_total_score)")
        player_3_total_score = player_3_scores.reduce(0, { x, y in x + y })
        player_3_score.text = String("\(player_3_total_score)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
