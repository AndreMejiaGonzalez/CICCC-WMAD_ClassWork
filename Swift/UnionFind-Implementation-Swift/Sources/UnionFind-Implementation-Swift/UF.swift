//
//  UF.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The UF struct represents a union-find (disjoint sets) data structure
/// It supports **union** and **find** operations, along with methods for
/// determining whether two nodes are in the same component and the total
/// number of components.
/// This implementation uses weighted quick union (by size or rank) with
/// full path compression.
/// Initializing a data structure with **n** nodes takes linear time.
/// Afterwards, **union**, **find**, and **connected** take logarithmic time
/// (in the worst case) and **count** takes constant time.
/// Moreover, the amortized time per **union**, **find**, and **connected** operation
/// has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
public struct UF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        var i = p
        while i != parent[i] {
            i = parent[i]
        }

        return i
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    public mutating func union(_ p: Int, _ q: Int) {
        let i = find(p)
        let j = find(q)
        if i == j { return }
        if size[i] < size[j] {
            parent[i] = j
            size[j] += size[i]
        } else {
            parent[j] = i
            size[i] += size[j]
        }
        count -= 1
    }

    func printData() {
        print("Count: \(count), Size: \(size), Parents: \(parent)")
    }
}
