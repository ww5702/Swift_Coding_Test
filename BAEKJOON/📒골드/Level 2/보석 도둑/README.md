구현으로 풀이해봤지만 당연히 시간초과   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (input[0],input[1])
    var list: [(Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        list.append((input[0],input[1]))
    }
    list.sort(by: {$0.0 < $1.0})
    var visited = Array(repeating: false, count: n)
    //print(list)
    var bag: [Int] = []
    for _ in 0..<k {
        bag.append(Int(readLine()!)!)
    }
    bag.sort(by:<)
    var result = 0
    // 작은 무게 순으로 해당 무게 안에서 가장 값이 큰 것
    for i in 0..<k {
        let weight = bag[i]
        var maxCost = 0
        var idx = 0
        for j in 0..<n {
            // 무게가 넘어갈때까지
            if list[j].0 > weight { break }
            
            if list[j].1 > maxCost && !visited[j] {
                maxCost = list[j].1
                idx = j
            }
        }
        visited[idx] = true
        result += maxCost
        //print(maxCost, idx)
    }
    print(result)
}

solution()
/*
 5 30
 10 20
 15 10
 15
 5
 
 30 0
 20 30
 
 */

```
