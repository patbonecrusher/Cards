//
//  Suit.swift
//  PaymeSwiftly
//
//  Created by pat on 6/13/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation

public enum Suit: Int, CustomStringConvertible {
  case Clubs, Diamonds, Hearts, Spades, Special
  func Description() -> String {
    switch self {
    case .Clubs: return "clubs"
    case .Diamonds: return "diamonds"
    case .Hearts: return "hearts"
    case .Spades: return "spades"
    case .Special: return "special"
    }
  }
  public var description: String { get { return Description() } }
}
