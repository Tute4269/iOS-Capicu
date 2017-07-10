//
//  TwoPlayersController.swift
//  Capicu
//
//  Created by Anthony Benitez on 1/31/17.
//  Copyright © 2017 SymphoLife. All rights reserved.
//

import UIKit

class TwoPlayersController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var player_team_1_scores = [Int]()
    var player_team_1_total_score = 0
    var player_team_1_name_text = "Player/Team 1"
    @IBOutlet weak var player_team_1_name: UILabel!
    @IBOutlet weak var player_team_1_score: UILabel!
    @IBOutlet weak var player_team_1_table: UITableView!
    
    var player_team_2_scores = [Int]()
    var player_team_2_total_score = 0
    var player_team_2_name_text = "Player/Team 2"
    @IBOutlet weak var player_team_2_score: UILabel!
    @IBOutlet weak var player_team_2_name: UILabel!
    @IBOutlet weak var player_team_2_table: UITableView!
    
    
    func handlePress(sender: UILongPressGestureRecognizer) {
        if sender.view?.tag == 1 {
            let alert = UIAlertController(title: "Player/Team 1", message: "Set the name of Player/Team 1", preferredStyle: .alert)
            
            alert.addTextField { (new_score) in
                new_score.placeholder = "Player/Team 1 Name"
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
                    self.player_team_1_name.text = the_new_score
                    UserDefaults.standard.set(the_new_score, forKey: "2p_playerteam1name")
                }
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        } else if sender.view?.tag == 2 {
            let alert = UIAlertController(title: "Player/Team 2", message: "Set the name of Player/Team 2", preferredStyle: .alert)
            
            alert.addTextField { (new_score) in
                new_score.placeholder = "Player/Team 2 Name"
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
                    self.player_team_2_name.text = the_new_score
                    UserDefaults.standard.set(the_new_score, forKey: "2p_playerteam2name")
                }
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearTables(_ sender: Any) {
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset this game?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
            self.dismiss(animated: true, completion: {
                // Do nothing
            })
        }))
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            
            self.player_team_1_scores.removeAll()
            self.player_team_1_total_score = 0
            self.player_team_1_score.text = String(self.player_team_1_total_score)
            self.player_team_1_table.reloadData()
            self.player_team_1_name.text = "Player/Team 1"
            UserDefaults.standard.set("Player/Team 1", forKey: "2p_playerteam1name")
            UserDefaults.standard.set([Int](), forKey: "2p_playerteam1scores")
            
            self.player_team_2_scores.removeAll()
            self.player_team_2_total_score = 0
            self.player_team_2_score.text = String(self.player_team_2_total_score)
            self.player_team_2_table.reloadData()
            self.player_team_2_name.text = "Player/Team 2"
            UserDefaults.standard.set("Player/Team 2", forKey: "2p_playerteam2name")
            UserDefaults.standard.set([Int](), forKey: "2p_playerteam2scores")
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToPlayerTeamOne(_ sender: Any) {
        
        let alert = UIAlertController(title: "Player/Team 1 Wins", message: "Add points to the winner", preferredStyle: .alert)
        
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
                    self.player_team_1_scores.append(Int(the_new_score)!)
                    
                    // update the total score variable
                    self.player_team_1_total_score = self.player_team_1_total_score + (Int(the_new_score)!)
                    
                    self.player_team_1_table.reloadData()
                    self.player_team_1_score.text = String(self.player_team_1_total_score)
                    
                    UserDefaults.standard.set(self.player_team_1_scores, forKey: "2p_playerteam1scores")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToPlayerTeamTwo(_ sender: Any) {
        
        let alert = UIAlertController(title: "Player/Team 2 Wins", message: "Add points to the winner", preferredStyle: .alert)
        
        alert.addTextField { (new_score) in
            new_score.placeholder = "Points"
            new_score.keyboardType = UIKeyboardType.asciiCapableNumberPad
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
                    self.player_team_2_scores.append(Int(the_new_score)!)
                    
                    // update the total score variable
                    self.player_team_2_total_score = self.player_team_2_total_score + (Int(the_new_score)!)
                    
                    self.player_team_2_table.reloadData()
                    self.player_team_2_score.text = String(self.player_team_2_total_score)
                    
                    UserDefaults.standard.set(self.player_team_2_scores, forKey: "2p_playerteam2scores")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        
        if tableView.isEqual(player_team_1_table) {
            rowCount = player_team_1_scores.count
        } else if tableView.isEqual(player_team_2_table) {
            rowCount = player_team_2_scores.count
        }
        
        return rowCount
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        if tableView.isEqual(player_team_1_table) {
            cell.textLabel?.text = String(player_team_1_scores[indexPath.row])
        } else if tableView.isEqual(player_team_2_table) {
            cell.textLabel?.text = String(player_team_2_scores[indexPath.row])
        }
        
        return cell
    }
    
    // function to be able to delete rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // if delete is used
        if editingStyle == UITableViewCellEditingStyle.delete {
            if tableView.isEqual(player_team_1_table) {
                // update list items when deleting item
                player_team_1_total_score -= player_team_1_scores[indexPath.row]
                player_team_1_score.text = String(player_team_1_total_score)
                
                // remove from places Dictionary, set the standardDefault, and reload the table data
                player_team_1_scores.remove(at: indexPath.row)
                player_team_1_table.reloadData()
                UserDefaults.standard.set(player_team_1_scores, forKey: "2p_playerteam1scores")
                
            } else if tableView.isEqual(player_team_2_table) {
                // update list items when deleting item
                player_team_2_total_score -= player_team_2_scores[indexPath.row]
                player_team_2_score.text = String(player_team_2_total_score)
                
                // remove from places Dictionary, set the standardDefault, and reload the table data
                player_team_2_scores.remove(at: indexPath.row)
                player_team_2_table.reloadData()
                UserDefaults.standard.set(player_team_2_scores, forKey: "2p_playerteam2scores")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGestureRecognizer1 = UILongPressGestureRecognizer(target: self, action: #selector(TwoPlayersController.handlePress))
        let longPressGestureRecognizer2 = UILongPressGestureRecognizer(target: self, action: #selector(TwoPlayersController.handlePress))
        player_team_1_name.isUserInteractionEnabled = true
        player_team_2_name.isUserInteractionEnabled = true
        player_team_1_name.addGestureRecognizer(longPressGestureRecognizer1)
        player_team_2_name.addGestureRecognizer(longPressGestureRecognizer2)
        
        
        let logo = UIImage(named: "domino2.png")! as UIImage
        let imageView = UIImageView(image:logo)
        imageView.frame.size.width = 20;
        imageView.frame.size.height = 40;
        
        self.navigationItem.titleView = imageView
        
        if let name_1 = UserDefaults.standard.object(forKey: "2p_playerteam1name") as? String {
            player_team_1_name.text = name_1
            player_team_1_name_text = name_1
        }
        
        if let name_2 = UserDefaults.standard.object(forKey: "2p_playerteam2name") as? String {
            player_team_2_name.text = name_2
            player_team_2_name_text = name_2
        }
        
        if let player_team_1_scores_arr = UserDefaults.standard.object(forKey: "2p_playerteam1scores") as? [Int] {
            player_team_1_scores = player_team_1_scores_arr
        }
        
        if let player_team_2_scores_arr = UserDefaults.standard.object(forKey: "2p_playerteam2scores") as? [Int] {
            player_team_2_scores = player_team_2_scores_arr
        }
        
        player_team_1_table.reloadData()
        player_team_2_table.reloadData()
        
        player_team_1_total_score = player_team_1_scores.reduce(0, { x, y in x + y })
        player_team_1_score.text = String("\(player_team_1_total_score)")
        player_team_2_total_score = player_team_2_scores.reduce(0, { x, y in x + y })
        player_team_2_score.text = String("\(player_team_2_total_score)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backToMain(_ sender: Any) {
        self.performSegue(withIdentifier: "toMainFromTwo", sender: self)
    }
    
}
