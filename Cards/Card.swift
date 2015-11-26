//
//  Card.swift
//  PaymeSwiftly
//
//  Created by pat on 6/13/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation

//-------------------------------------------------------------------------------------------------
public class Card: CustomStringConvertible, Equatable {
  public let suit: Suit
  public let rank: Rank
  public var isWild: Bool = false
  
  // MARK: Initializer/Deinitializer
  //---------------------------------------------------------------------------------------------
  public init(rank: Rank, suit: Suit) {
    self.suit = suit
    self.rank = rank
  }
  
  // MARK: Public API
  //---------------------------------------------------------------------------------------------
  public func isSameSuit(card: Card) -> Bool { return self.suit == card.suit }
  public func isSameRank(card: Card) -> Bool { return self.rank == card.rank }
  
  // MARK: Printable protocol
  //---------------------------------------------------------------------------------------------
  public var description: String { get { return (suit == Suit.Special ? "\(rank)" : "\(rank) of \(suit)") } }
}

//-------------------------------------------------------------------------------------------------
public func == (this: Card, that: Card) -> Bool {
  return 	this.suit == that.suit && this.rank == that.rank
}

public func != (this: Card, that: Card) -> Bool {
  return 	this.suit != that.suit || this.rank != that.rank
}

// This assumes Aces are low.
//-------------------------------------------------------------------------------------------------
public func < (this: Card, that: Card) -> Bool {
  return 	(this.suit.rawValue != that.suit.rawValue ? this.suit.rawValue < that.suit.rawValue : this.rank.rawValue < that.rank.rawValue)
}

// This assumes Aces are low.
//-------------------------------------------------------------------------------------------------
public func > (this: Card, that: Card) -> Bool {
  return 	(this.suit.rawValue != that.suit.rawValue ? this.suit.rawValue > that.suit.rawValue : this.rank.rawValue > that.rank.rawValue)
}

// This assumes Aces are low.
//-------------------------------------------------------------------------------------------------
public func <= (this: Card, that: Card) -> Bool {
  return 	(this.suit.rawValue != that.suit.rawValue ? this.suit.rawValue <= that.suit.rawValue : this.rank.rawValue <= that.rank.rawValue)
}

// This assumes Aces are low.
//-------------------------------------------------------------------------------------------------
public func >= (this: Card, that: Card) -> Bool {
  return 	(this.suit.rawValue != that.suit.rawValue ? this.suit.rawValue >= that.suit.rawValue : this.rank.rawValue >= that.rank.rawValue)
}