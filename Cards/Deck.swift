//
//  Deck.swift
//  PaymeProto
//
//  Created by pat on 6/15/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation

public class Deck: CardPile {
  
  public convenience init(includeJoker:Bool = true) {
    self.init(cards: {
      let ranksPerSuit = 13
      var deck = [Card]()
      
      for index in 0..<52
      {
        let suit = Suit(rawValue: index / ranksPerSuit)
        let rank = Rank(rawValue: index % ranksPerSuit + 1)
        
        let card = Card(rank: rank!, suit: suit!)
        deck.append(card)
      }
      
      if (includeJoker) {
        deck.append(Card(rank: Rank.JokerLow, suit: Suit.Special));
        deck.append(Card(rank: Rank.JokerHigh, suit: Suit.Special));
      }
      
      return deck
      }())
  }
  
  public override init(cards: [Card]) {
    super.init(cards: cards)
  }
  
}
