//
//  LinkedList_InsertNthNode.swift
//  CoderwarSolution
//
//  Created by apple on 1/3/2018.
//  Copyright © 2018 greatwall. All rights reserved.
//

//Linked Lists - Insert Nth
//
//Implement an InsertNth() function (insert_nth() in PHP) which can insert a new node at any index within a list.
//
//InsertNth() is a more general version of the Push() function that we implemented in the first kata listed below. Given a list, an index 'n' in the range 0..length, and a data element, add a new node to the list so that it has the given index. InsertNth() should return the head of the list.
//
//insertNth(1 -> 2 -> 3 -> null, 0, 7) === 7 -> 1 -> 2 -> 3 -> null)
//insertNth(1 -> 2 -> 3 -> null, 1, 7) === 1 -> 7 -> 2 -> 3 -> null)
//insertNth(1 -> 2 -> 3 -> null, 3, 7) === 1 -> 2 -> 3 -> 7 -> null)
//You must throw/raise an exception (ArgumentOutOfRangeException in C#, InvalidArgumentException in PHP) if the index is too large.
//
//The push() and buildOneTwoThree() (build_one_two_three() in PHP) functions do not need to be redefined. The Node class is also preloaded for you in PHP.

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

enum InsertNthError: Error {
    case outOfRangeError
}

func insertNth(_ head: Node?, _ index: Int, _ data: Int) throws -> Node? {
    if index == 0 {
        let h = Node(data)
        h.next = head
        return h
    }
    
    guard let hh = head else { throw InsertNthError.outOfRangeError }
    let n = try insertNth(hh.next, index - 1, data)
    hh.next = n
    return head
}
