```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let input = Array(readLine()!)
    var board: [Int] = []
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    
    var stack: [Double] = []
    
    for word in input {
        if word.asciiValue! >= 65 && word.asciiValue! <= 90 {
            stack.append(Double(board[Int(word.asciiValue!)-65]))
        } else {
            if word == "*" {
                stack.append(stack.removeLast()*stack.removeLast())
            } else if word == "/" {
                let num1 = stack.removeLast()
                let num2 = stack.removeLast()
                stack.append(num2 / num1)
            } else if word == "+" {
                stack.append(stack.removeLast()+stack.removeLast())
            } else if word == "-" {
                let num1 = stack.removeLast()
                let num2 = stack.removeLast()
                stack.append(num2 - num1)
            }
            
        }
        //print(stack)
        
    }
    print(String(format: "%.2f", stack.first!))
}

solution()
/*
 */


```
