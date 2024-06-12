스택으로 풀이하였다.   

```
import Foundation
func solution(){
    var input = readLine()!.map{String($0)}
    //print(input)
    var isPossible = true
    var stack: [String] = []

    var sum = 0
    for i in 0..<input.count {
        let now = input[i]
        if now == "(" || now == "[" {
            stack.append(now)
        } else if now == ")" {
            var sum = 0
            if stack.isEmpty {
                isPossible = false
                break
            }
            
            while !stack.isEmpty {
                let popped = stack.popLast()!
                if popped == "(" {
                    stack.append(sum == 0 ? "2" : "\(2*sum)")
                    break
                } else if popped == "[" {
                    isPossible = false
                    break
                } else {
                    sum += Int(popped)!
                }
            }
            
        } else if now == "]" {
            var sum = 0
            if stack.isEmpty {
                isPossible = false
                break
            }
            while !stack.isEmpty {
                let popped = stack.popLast()!
                if popped == "[" {
                    stack.append(sum == 0 ? "3" : "\(3*sum)")
                    break
                } else if popped == "(" {
                    isPossible = false
                    break
                } else {
                    sum += Int(popped)!
                }
            }
            
        }
    }
    //print(stack)
    if !isPossible {
        print(0)
    } else {
        var result = 0
        for s in stack {
            guard let num = Int(s) else {
                isPossible = false
                break
            }
            result += num
        }
        if !isPossible {
            print(0)
        } else {
            print(result)
        }
        
    }
    
}
solution()

```
