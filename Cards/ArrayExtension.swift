//
//  ArrayExtensions.swift
//  PaymeProto
//
//  Created by pat on 6/18/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation

extension Array {
  
  func first () -> Element? {
    return count > 0 ? self[0] : nil
  }
  
  func last () -> Element? {
    return count > 0 ? self[count - 1] : nil
  }
  
  func whereItemIs (iterator: (Element) -> Bool) -> Array {
    var array = Array<Element>()
    for item in self {
      if (iterator(item)) { array.append(item) }
    }
    return array
  }
  
  func each (iterator: (Element) -> Void ) -> Array {
    for item in self {
      iterator(item)
    }
    
    return self
  }
  
  func eachWithIndex (iterator: (Element, Int) -> Void ) -> Array {
    var i = 0
    for item in self {
      iterator(item, i++)
    }
    
    return self
  }
  
  subscript (range: Range<Int>) -> Array<Element> {
    var array = Array<Element>()
      
      let min = range.startIndex
      let max = range.endIndex
      
      for var i = min; i < max; i++ {
        array += [self[i]]
      }
      
      return array
  }
  
  func take (n: Int) -> Array<Element> {
    return self[0..<n]
  }
  
  func subset(start: Int, n: Int) -> Array<Element> {
    return self[start..<n]
  }
  
  mutating func remove(start: Int, n: Int) {
    for i in start..<n { self.removeAtIndex(i) }
  }
  
  func skip ( n: Int) -> Array<Element> {
    return self[n..<count]
  }
  
  //
  //-----------------------------------------------------------------------------------
  func contains<T : Equatable>(obj: T) -> Bool {
    return self.filter({$0 as? T == obj}).count > 0
  }
  
  
  //
  // U may or may not be the same type as the array elements
  //-----------------------------------------------------------------------------------
  func foldl<U>(initial:U, combine:(U,Element) -> U) -> U{
    if self.count > 0 {
      var combined = initial
      let inverted = self
      for index in 0..<inverted.count {
        let element = inverted[index]
        combined = combine(combined, element)
      }
      return combined
    }
    return initial
  }
  
  //
  //-----------------------------------------------------------------------------------
  func foldr<U>(initial:U, combine:(U,Element) -> U) -> U {
    if self.count > 0 {
      var combined = initial
      for element in self {
        combined = combine(combined, element)
      }
      return combined
    }
    return initial
  }
  
  //
  //-----------------------------------------------------------------------------------
  mutating func shuffle() -> [Element] {
    for i in 0..<self.count {
      let j = Int(arc4random_uniform(UInt32(self.count - i))) + i
      self.insert(self.removeAtIndex(j), atIndex: i)
    }
    return self
  }
}

