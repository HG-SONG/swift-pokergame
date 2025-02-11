//
//  ViewController.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/13.
//

import UIKit

class GameBoardViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setCardBack()
        printCardInfo()
        testDeck()
    }
    
    func setBackground () {
        guard let backgroundPattern = UIImage(named: "bg_pattern") else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundPattern)
    }
    
    func setCardBack () {
        let boundaryWidth = self.view.bounds.width
        var positionX = 2.0
        let positionY = 50.0
        let padding = 2.0
        let cardWidth = boundaryWidth/7 - (2*padding)
        let cardHeight = cardWidth * 1.27
        
        guard let cardBack = UIImage(named: "card-back") else {
            return
        }
        
        for _ in 0...6 {
            let cardBackView = UIImageView(image: cardBack)
            cardBackView.frame = CGRect(x: positionX , y: positionY, width: cardWidth, height: cardHeight)
            self.view.addSubview(cardBackView)
            positionX += cardWidth + (2*padding)
        }
    }
    
    func printCardInfo() {
        let firstCard = Card(shape: .clover, rank: .ace)
        print(firstCard)
    }
    
    func testDeck() {
        var myDeck = Deck()
        
        print("덱 초기화")
        myDeck.reset()
        print(myDeck)
        
        print("카드 몇 장?")
        print(myDeck.count())
        
        print("카드 섞어")
        myDeck.shuffle()
        print(myDeck)
        
        print("카드 뽑아")
        print(myDeck.removeOne() ?? "nil")
        
        print("카드 몇 장?")
        print(myDeck.count())
    }
}

