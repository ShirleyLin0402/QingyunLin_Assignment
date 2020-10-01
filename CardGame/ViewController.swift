//
//  ViewController.swift
//  CardGame
//
//  Created by 林青筠 on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card1: UIImageView!
    
    @IBOutlet weak var card2: UIImageView!
    
    @IBOutlet weak var card3: UIImageView!
    
    @IBOutlet weak var card4: UIImageView!
    
    @IBOutlet weak var card5: UIImageView!
    
    @IBOutlet weak var card6: UIImageView!
    
    @IBOutlet weak var lblwinner: UILabel!
    
    var all_card_files = [
        "2C", "2D", "2H", "2S",
        "3C", "3D", "3H", "3S",
        "4C", "4D", "4H", "4S",
        "5C", "5D", "5H", "5S",
        "6C", "6D", "6H", "6S",
        "7C", "7D", "7H", "7S",
        "8C", "8D", "8H", "8S",
        "9C", "9D", "9H", "9S",
        "10C", "10D", "10H", "10S",
        "JC", "JD", "JH", "JS",
        "KC", "KD", "KH", "KS",
        "QC", "QD", "QH", "QS",
        "AC", "AD", "AH", "AS"
    ];
    
    let WINNING_CARD = "AS"
    
    var hasWinner = false;
    var val1: Int = -1
    var val2 = -1
    var val3 = -1
    var val4 = -1
    var val5 = -1
    var val6 = -1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       initialize()
    }
    
    func initialize(){
        card1.image = UIImage(named: "green_back");
        card2.image = UIImage(named: "green_back");
        card3.image = UIImage(named: "green_back");
        card4.image = UIImage(named: "green_back");
        card5.image = UIImage(named: "green_back");
        card6.image = UIImage(named: "green_back");
        hasWinner = false
        lblwinner.text = " "
        
    }
    
    func rollCards(){
        let val1 = Int.random(in:0..<52)
        let val2 = Int.random(in:0..<52)
        let val3 = Int.random(in:0..<52)
        let val4 = Int.random(in:0..<52)
        let val5 = Int.random(in:0..<52)
        let val6 = Int.random(in:0..<52)
        
        card1.image = UIImage(named: all_card_files[val1]);
        card2.image = UIImage(named: all_card_files[val2]);
        card3.image = UIImage(named: all_card_files[val3]);
        card4.image = UIImage(named: all_card_files[val4]);
        card5.image = UIImage(named: all_card_files[val5]);
        card6.image = UIImage(named: all_card_files[val6]);
        
        hasWinner = false
        var oneWin = false
        var twoWin = false
        if (all_card_files[val1] == WINNING_CARD || all_card_files[val2] == WINNING_CARD || all_card_files[val3] == WINNING_CARD){
            oneWin = true
        } else if (all_card_files[val4] == WINNING_CARD || all_card_files[val5] == WINNING_CARD || all_card_files[val6] == WINNING_CARD){
            twoWin = true
        }
        if ((oneWin || twoWin) && !(oneWin && twoWin)) {
            hasWinner = true
            lblwinner.text = oneWin ? "Winner is Player1 !" : "Winner is Player2 !"
        } else {
            lblwinner.text = "No winner"
        }
        
    }

   
    @IBAction func playAction(_ sender: UIButton){
        if (hasWinner) {
            showAlertButtonTapped()
        } else {
            rollCards()
        }
    }
    
    func showAlertButtonTapped() {
            
        let alert = UIAlertController(title: "Alert", message: "Play Again?", preferredStyle: UIAlertController.Style.alert)

       
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: playAgain))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))

       
        self.present(alert, animated: true, completion: nil)
    }
    
    func playAgain(action: UIAlertAction) {
        rollCards();
    }

}

