//
//  Container.swift
//  PaymeProto
//
//  Created by Patrick Laplante on 6/29/14.
//  Copyright (c) 2014 CovenOfChaos. All rights reserved.
//

import Foundation


public protocol Container {
  typealias ItemType
  mutating func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}
