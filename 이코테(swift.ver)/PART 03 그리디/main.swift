//
//  main.swift
//  큰 수의 법칙
//
//  Created by 이재웅 on 2023/05/08.
//

import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,m,k) = (input[0],input[1],input[2])
    var data = Array(readLine()!.split(separator: " ").map{Int($0)!})
    data.sort(by: >)
    let first = data[0]
    let second = data[1]
    var sum = 0
    while true {
        for _ in 0..<k {
            if m == 0 { break }
            sum += first
            m -= 1
            if m == 0 { break }
        }
        sum += second
        m -= 1
        if m == 0 { break }
    }
    print(sum)
}
solution()

