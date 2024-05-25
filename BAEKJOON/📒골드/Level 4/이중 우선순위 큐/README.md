당연하지만 큐 하나로 풀이하는건 쉽지 않다.   

```
import Foundation

func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let k = Int(readLine()!)!
        var q: [Int] = []
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map{String($0)}
            if input[0] == "I" {
                q.append(Int(input[1])!)
                q.sort()
            } else {
                if input[1] == "-1" {
                    if !q.isEmpty {
                        q.reverse()
                        q.removeLast()
                        q.reverse()
                    }
                } else {
                    if !q.isEmpty {
                        q.removeLast()
                    }
                }
            }
            //print(q)
        }
        
        if q.isEmpty {
            print("EMPTY")
        } else {
            if q.count == 1 {
                print(q.first!)
            } else {
                print("\(q.last!) \(q.first!)")
            }
        }
    }
}
solution()

```
