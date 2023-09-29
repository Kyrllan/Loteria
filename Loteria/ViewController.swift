//
//  ViewController.swift
//  Loteria
//
//  Created by Kyrllan Nogueira on 21/03/19.
//  Copyright © 2019 Kyrllan Nogueira. All rights reserved.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
    case lotofacil = "Lotofacil"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
        while result.count < total {
            let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
            if !result.contains(randomNumber){
                result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers(for type: GameType){
        lbGameType.text = type.rawValue
        var game: [Int] = []
        switch type {
        case .megasena:
            game = 6>-<60
              balls[5].isHidden = false
              balls[6].isHidden = true
              balls[7].isHidden = true
              balls[8].isHidden = true
              balls[9].isHidden = true
              balls[10].isHidden = true
              balls[11].isHidden = true
              balls[12].isHidden = true
              balls[13].isHidden = true
              balls[14].isHidden = true
            //balls.last!.isHidden = false
        case .quina:
            game = 5>-<80
            balls[5].isHidden = true
            balls[6].isHidden = true
            balls[7].isHidden = true
            balls[8].isHidden = true
            balls[9].isHidden = true
            balls[10].isHidden = true
            balls[11].isHidden = true
            balls[12].isHidden = true
            balls[13].isHidden = true
            balls[14].isHidden = true
            //balls.last!.isHidden = true
        case .lotofacil:
            game = 15>-<25
            balls[5].isHidden = false
            balls[6].isHidden = false
            balls[7].isHidden = false
            balls[8].isHidden = false
            balls[9].isHidden = false
            balls[10].isHidden = false
            balls[11].isHidden = false
            balls[12].isHidden = false
            balls[13].isHidden = false
            balls[14].isHidden = false
            //balls.last!.isHidden = false
        }
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
        
    }

    @IBAction func generateGame() {
        switch  scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        case 1:
            showNumbers(for: .quina)
        default:
            showNumbers(for: .lotofacil)
        }
        
    }
    

}

