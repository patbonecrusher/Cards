//
//  Rank.swift
//  PaymeSwiftly
//
//  Created by pat on 6/13/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation

public enum Rank : Int, CustomStringConvertible {
  case Ace = 1
  case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
  case Jack, Queen, King
  case JokerLow, JokerHigh
  func Description() -> String {
    switch self {
    case .Ace: return "ace"
    case .Jack: return "jack"
    case .Queen: return "queen"
    case .King: return "king"
    case .JokerHigh: return "red joker"
    case .JokerLow: return "black joker"
    default: return String(self.rawValue)
    }
  }
  public var description: String { get { return Description() } }
}
