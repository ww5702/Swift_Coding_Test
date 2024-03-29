# 스택을 구현하고 사용해 봅시다.
## 10828 스택
정수를 저장하는 스택을 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.   
명령은 총 다섯 가지이다.   
   
1. push X: 정수 X를 스택에 넣는 연산이다.   
2. pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
3. size: 스택에 들어있는 정수의 개수를 출력한다.   
4. empty: 스택이 비어있으면 1, 아니면 0을 출력한다.   
5. top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
```
import Foundation
 
func solution() {
    let n = Int(readLine()!)!
    var stack: [Int] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator:" ").map{String($0)}
        switch input[0] {
        case "push":
            push(Int(input[1])!)
            break
        case "pop":
            print(pop())
            break
        case "size":
            print(size())
            break
        case "empty":
            print(empty())
            break
        case "top":
            print(top())
            break
        default:
            break
        }
    }


    func push(_ n : Int) {
        stack.append(n)
    }
    func pop() -> Int {
        if let pop = stack.popLast() {
            return pop
        } else {
            return -1
        }
    }
    func size() -> Int{
        return stack.count
    }
    func empty() -> Int{
        if stack.isEmpty == true {
            return 1
        } else {
            return 0
        }
    }
    func top() -> Int{
        if let pop = stack.last {
            return pop
        } else {
            return -1
        }
    }
}

solution()

```
stack의 개념 유의하며 push, pop, size, empty, top의 기능을 하나하나 구현하면 된다.   

## 28278 스택 2
명령어에 맞게 해당 값들을 출력해준다.   
```
import Foundation

func solution() {
    var Q: [Int] = []
    let N = Int(readLine()!)!
    for _ in 0..<N {
        var input = readLine()!.split(separator: " ").map{Int($0)!}
        
        switch(input[0]) {
        case 1:
            Q.append(input[1])
            break
        case 2:
            if Q.isEmpty {
                print(-1)
            } else {
                print(Q.popLast()!)
            }
            break
        case 3:
            print(Q.count)
            break
        case 4:
            Q.isEmpty ? print(1) : print(0)
            break
        case 5:
            Q.isEmpty ? print(-1) : print(Q.last!)
        default:
            break
        }
    }
}
solution()


```
## 10773 제로
나코더 기장 재민이는 동아리 회식을 준비하기 위해서 장부를 관리하는 중이다.   
재현이는 재민이를 도와서 돈을 관리하는 중인데, 애석하게도 항상 정신없는 재현이는 돈을 실수로 잘못 부르는 사고를 치기 일쑤였다.   
재현이는 잘못된 수를 부를 때마다 0을 외쳐서, 가장 최근에 재민이가 쓴 수를 지우게 시킨다.   
재민이는 이렇게 모든 수를 받아 적은 후 그 수의 합을 알고 싶어 한다. 재민이를 도와주자!   
```
import Foundation
 
func solution() {
    let n = Int(readLine()!)!
    var stack: [Int] = []
    
    for _ in 0..<n {
        let input = readLine()!.split(separator:" ").map{Int($0)!}
        if input[0] == 0 {
            stack.removeLast()
        } else {
            stack.append(input[0])
        }
    }
    print(stack.reduce(0, +))

   
}

solution()
```
0일때 removeLast, 나머지값일때는 해당값을 더해준다.   
```
import Foundation
 
func solution() {
    let n = Int(readLine()!)!
    var stack: [Int] = []
    var sum = 0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator:" ").map{Int($0)!}
        if input[0] == 0 {
        	   sum -= stack.last!
            stack.popLast()
        } else {
        	   sum += input[0]
            stack.append(input[0])
        }
    }
	print(sum)
   
}

solution()
```
혹은 변수 하나를 더 생성해 stack.last값을 빼주거나 input[0]값을 더해주는 방식으로도 풀 수 있다.   

## 9012 괄호
괄호 문자열(Parenthesis String, PS)은 두 개의 괄호 기호인 ‘(’ 와 ‘)’ 만으로 구성되어 있는 문자열이다.   
그 중에서 괄호의 모양이 바르게 구성된 문자열을 올바른 괄호 문자열(Valid PS, VPS)이라고 부른다.   
한 쌍의 괄호 기호로 된 “( )” 문자열은 기본 VPS 이라고 부른다.   
만일 x 가 VPS 라면 이것을 하나의 괄호에 넣은 새로운 문자열 “(x)”도 VPS 가 된다.    
그리고 두 VPS x 와 y를 접합(concatenation)시킨 새로운 문자열 xy도 VPS 가 된다.   
예를 들어 “(())()”와 “((()))” 는 VPS 이지만 “(()(”, “(())()))” , 그리고 “(()” 는 모두 VPS 가 아닌 문자열이다.   
   
여러분은 입력으로 주어진 괄호 문자열이 VPS 인지 아닌지를 판단해서 그 결과를 YES 와 NO 로 나타내어야 한다.   
```
import Foundation
 
func solution() {
    let n = Int(readLine()!)!

    for _ in 0..<n {
        let stack = Array(readLine()!)
        var count = 0
        for i in stack {
            if i == "(" {
                count += 1
            } else if i == ")" {
                count -= 1
                if count < 0 {
                    break
                }
            }
        }
        print(count == 0 ? "YES" : "NO")
    }

   
}

solution()
```
(일때 +1 (일때 -1을 해주고 마지막 결과값이 0이라면 참을 출력해주었다.   
하지만 (와 )가 적당히 번갈아가면서 나오는것이 아닌 )가 더 나와 - 상태가 되면 NO를 출력해준다.   

## 4949 균형잡힌 세상
세계는 균형이 잘 잡혀있어야 한다. 양과 음, 빛과 어둠 그리고 왼쪽 괄호와 오른쪽 괄호처럼 말이다.   
정민이의 임무는 어떤 문자열이 주어졌을 때, 괄호들의 균형이 잘 맞춰져 있는지 판단하는 프로그램을 짜는 것이다.   
문자열에 포함되는 괄호는 소괄호("()") 와 대괄호("[]")로 2종류이고, 문자열이 균형을 이루는 조건은 아래와 같다.   
   
1. 모든 왼쪽 소괄호("(")는 오른쪽 소괄호(")")와만 짝을 이뤄야 한다.   
2. 모든 왼쪽 대괄호("[")는 오른쪽 대괄호("]")와만 짝을 이뤄야 한다.   
3. 모든 오른쪽 괄호들은 자신과 짝을 이룰 수 있는 왼쪽 괄호가 존재한다.   
4. 모든 괄호들의 짝은 1:1 매칭만 가능하다. 즉, 괄호 하나가 둘 이상의 괄호와 짝지어지지 않는다.   
5. 짝을 이루는 두 괄호가 있을 때, 그 사이에 있는 문자열도 균형이 잡혀야 한다.   
   
정민이를 도와 문자열이 주어졌을 때 균형잡힌 문자열인지 아닌지를 판단해보자.   
```
import Foundation
 
func solution() {
    var n = ""
    while true {
        n = readLine()!
        if n == "." { break }
        var stack : [Character] = []
        var check = true
        
        for i in n {
            if i == "[" || i == "(" {
                stack.append(i)
            } else if i == "]" || i == ")" {
                if stack.isEmpty {
                    check = false
                    break
                }
                if i == "]" && stack.removeLast() != "[" {
                    check = false
                    break
                } else if i == ")" && stack.removeLast() != "(" {
                    check = false
                    break
                }
            }
            
        }
        if check == false {
            print("no")
        } else {
            if stack.isEmpty { print("yes")}
            else { print("no")}
        }
    }
}

```
준비된 stack에 (와 [를 append해준다.   
단 스택이 비어있는데 ]나 )를 append해주려 한다면 false를 리턴해주고,   
]나 )를 append해주려 할때 스택의 last가 ]나 )처럼 맞는 짝이 아니라면 또한 false를 리턴해준다.   
## 12789 도키도키 간식드리미
옆줄에 세우면서 만약 옆줄의 맨앞이나 원래줄 맨앞이 간식을 먹어야 할 순서가 맞다면   
간식순서 +1, 옆줄이나 현재줄 빼기   
그리고 순서가 아니라면 옆줄에 세우는데,   
만약 옆줄에 세울때 옆줄에 자기보다 작은 숫자가 있다면 불가능한 순서   
index가 N을 넘어갈때 즉 전체를 한바퀴 돌았을때   
isOk가 true라면 -> 즉 옆줄은 오름차순으로 잘 세워져있을것이다   
가능한 부분   
```
import Foundation

func solution() {
    let N = Int(readLine()!)!
    var value = readLine()!.split(separator: " ").map{Int($0)!}
    var line: [Int] = []
    var now = 1, index = 0
    var isOk = true
    while true {
        if index >= N { break }
        let cur = value[index]
        if cur == now {
            now += 1
            index += 1
        } else {
            if line.count == 0 {
                line.append(value[index])
                index += 1
            } else {
                if line.last! == now {
                    line.popLast()
                    now += 1
                } else {
                    if value[index] > line.last! {
                        print("Sad")
                        isOk = false
                        break
                    } else {
                        line.append(value[index])
                        index += 1
                    }
                }
            }
        }
//        print("현재 옆 줄",line)
//        print("현재 먹어야하는 사람",now, index)
    }
    if isOk { print("Nice") }
}
solution()


```


## 1874 스택수열
스택 (stack)은 기본적인 자료구조 중 하나로, 컴퓨터 프로그램을 작성할 때 자주 이용되는 개념이다.   
스택은 자료를 넣는 (push) 입구와 자료를 뽑는 (pop) 입구가 같아   
제일 나중에 들어간 자료가 제일 먼저 나오는 (LIFO, Last in First out) 특성을 가지고 있다.   
   
1부터 n까지의 수를 스택에 넣었다가 뽑아 늘어놓음으로써, 하나의 수열을 만들 수 있다.   
이때, 스택에 push하는 순서는 반드시 오름차순을 지키도록 한다고 하자.   
임의의 수열이 주어졌을 때 스택을 이용해 그 수열을 만들 수 있는지 없는지,   
있다면 어떤 순서로 push와 pop 연산을 수행해야 하는지를 알아낼 수 있다. 이를 계산하는 프로그램을 작성하라.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var count = 1
    var stack: [Int] = []
    var answer : [String] = []

    for _ in 0..<n {
        let input = Int(readLine()!)!
        while count <= input {
            answer.append("+")
            stack.append(count)
            count += 1
        }
        if input == stack.last {
            answer.append("-")
            stack.popLast()
        } else {
            print("NO")
            exit(0)
        }
    }

    print(answer.joined(separator: "\n"))

}
solution()
```
count를 이용해 기본적으로 주어진 숫자와 같아질때까지 stack에 append시켜준다. +를 저장   
stack의 last와 input이 같아진다면 -를 저장하고 pop을 시켜준다.   
위와 같은 과정을 반복하되 count가 주어진 input보다 큼에도 불구하고 stack의 last와 같지 않다면 불가능을 출력한다.   
