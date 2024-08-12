조건에 맞춰서 식을 풀이해가는 문제이다.   
알파벳이면 일단 출력을하고,   
곱셈이나 나눗셈이 나온다면 그 전에 먼저 실행했어야하는 곱셈 나눗셈들을 전부 출력   
그리고 덧셈이나 나눗셈이 나온다면 그 전에 있엇던 식들은 전부 완료되어야 하니   
stack에 들어가있는 기호들을 출력해준다.   
그리고 반복문이 끝났을떄 남아있는 stack을 비워준다.   

```
import Foundation
func solution() {
    let line = readLine()!
    var stack = ""
    
    for char in line {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            while !stack.isEmpty && stack.last != "(" {
                print(stack.removeLast(),terminator: "")
            }
            // ( 지워주기
            stack.removeLast()
        } else if (char == "*" || char == "/") {
            while !stack.isEmpty && (stack.last == "*" || stack.last == "/") {
                print(stack.removeLast(), terminator: "")
            }
            stack.append(char)
        } else if (char == "+" || char == "-") {
            while !stack.isEmpty && stack.last != "(" {
                print(stack.removeLast(),terminator: "")
            }
            stack.append(char)
        } else {
            print(char, terminator: "")
        }
    }
    
    while !stack.isEmpty {
        print(stack.removeLast(), terminator: "")
    }
}


solution()
/*
 */

```
