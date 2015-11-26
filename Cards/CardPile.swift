//
//  CardPile.swift
//  PaymeSwiftly
//
//  Created by pat on 6/14/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation
import Utils

//-------------------------------------------------------------------------------------------------
public class CardPile: Utils.Container, CustomStringConvertible {
  
  public var cards = [Card]()
  
  // MARK: Initialization/Deinitialization
  //---------------------------------------------------------------------------------------------
  public init(cards: [Card]) { self.cards = cards }
  public init() {}
  
  //
  //---------------------------------------------------------------------------------------------
  public var topCard: Card { get { return self.cards[0] } }
  public var bottomCard: Card { get { return self.cards[self.count-1] } }
  
  // MARK: Public api
  //---------------------------------------------------------------------------------------------
  
  //
  //---------------------------------------------------------------------------------------------
  public func draw(index: Int = 0) -> Card { return self.cards.removeAtIndex(index) }
  public func drawLast() -> Card { return self.draw(self.count-1);  }
  public func shuffle() -> CardPile { self.cards.shuffle(); return self }
  
  //
  //---------------------------------------------------------------------------------------------
  public func getCardsFromTop(cardCount: Int, remove: Bool = true) -> CardPile {
    return self.subset(cardCount, fromIndex: 0, remove: remove)
  }
  
  //
  //---------------------------------------------------------------------------------------------
  public func subset(cardCount: Int, fromIndex: Int = 0, remove: Bool = true) -> CardPile {
    let subsetCards = self.cards.subset(fromIndex, n: cardCount)
    if (remove) { self.cards.remove(fromIndex, n: cardCount) }
    return CardPile(cards: subsetCards)
  }
  
  //
  //---------------------------------------------------------------------------------------------
  public func mergeWith(pile: CardPile) -> CardPile {
    for card in self.cards { self.append(card) }
    pile.cards.removeAll(keepCapacity: false)
    return self
  }
  
  //
  //---------------------------------------------------------------------------------------------
  public func merge(piles: [CardPile]) -> CardPile {
    for pile in piles {
      for card in pile.cards { self.append(card) }
      pile.removeAll(false)
    }
    return self
  }
  
  //
  //---------------------------------------------------------------------------------------------
  public func contains(card: Card) -> Bool {
    return false;
  }
  
  // MARK: Container
  //---------------------------------------------------------------------------------------------
  public typealias ItemType = Card
  public func removeAll(keepCapacity: Bool) { self.cards.removeAll(keepCapacity: keepCapacity) }
  public func append(item: Card) { self.cards.append(item) }
  public var count: Int { return self.cards.count }
  public subscript(i: Int) -> ItemType { return self.cards[i] }
  
  // MARK: Printable protocol
  //---------------------------------------------------------------------------------------------
  public var description: String { get {
    var tmpDescription = String()
    
    for (index, element) in self.cards.enumerate() {
      tmpDescription += String("Item \(index): \(element)\n")
    }
    
    return tmpDescription
    }
  }
}

/*
- (id)initWithCardCount:(NSInteger)cardCount;
- (id)initWithDecks:(NSArray *)decks;
- (id)initWithCards:(NSArray *)cards;
- (id)initWithDeckCount:(NSInteger)deckCount;

- (NSArray *)getCardsFromTop:(NSInteger)cardCount;

- (void)shuffle;

- (Card *)draw;

- (void)add:(Card *)card;

- (void)addCards:(NSArray *)cards;

- (void)removeCard:(Card *)card;

- (void)takeOverPile:(Stack *)pile;

- (int)cardsRemaining;
*/