규칙을 찾는데 더 오랜 시간이 걸리는 문제이다.   

```
import Foundation

func solution(_ s:[String]) -> [String] {
    /*
    110만을 움직일 수 있다
    사전적으로 가장 앞에 오도록 하자
    무작정 110을 모든 자리에 넣어서 검사를 해본다면 무조건 시간초과가 난다
    따라서 규칙을 생각해보아야한다
    110은 111을 제외하고는 뒤에와야만 한다
    100110이 110100보다 사전적으로 앞이기 떄문이다
    
    하지만 이렇게까지 규칙을 발견해도 구현하는데에는 어려움이 있다.
    따라서 여기서 규칙을 하나 더 발견해야 한다
    예를 들어 01101111000110이 있다고 치자
    110이 총 3개가 있고 이를 제거하면
    01100이 남고 110,110,110이 된다
    이때 남은 01100을 뒤에서부터 탐색하여 제일 먼저 0을 발견한 index 뒤에
    110110110을 붙이면 정답이 된다.
    
    이유는 의외로 간단하다
    110은 111보다만 앞에 있을 수 있다 -> 110은 최대한 뒤로 가야한다
    -> 0을 만난다면 이보다는 뒤에 있어야한다. 
    -> 1을 만난다면 연속된 1들보다는 앞에 있어도 된다
    
    수학적인 구현과 규칙을 물어보는 문제이다.
    */
    var result: [String] = []
    var cnt = 0
    func remove110(_ num: String) -> String {
        cnt = 0
        var stack = [String]()
        for _char in num {
            let char = String(_char)
            if stack.count < 2 {
                stack.append(String(char))
                } else {
                    let pop1 = stack.removeLast()
                    let pop2 = stack.removeLast()
                    let lastThreeWord = pop2 + pop1 + char
                    if lastThreeWord != "110" {
                        stack.append(contentsOf: [pop2, pop1, char])
                    } else {
                        cnt += 1
                    }
                }
            }
            return stack.joined()
        }
    for str in s {
        var newStr = remove110(str).map{$0}
        //print(newStr)
        var index = 0
        for i in stride (from: newStr.count-1, through:0, by: -1) {
            if newStr[i] == "0" {
                index = i+1
                break
            }
        }
        //print(index)
        if index == newStr.count {
            for i in 0..<cnt {
                newStr.append(contentsOf:["1","1","0"])
            } 
        } else {
            for i in 0..<cnt {
                newStr.insert(contentsOf:["1","1","0"], at: index)
            } 
        }
        result.append(String(newStr))
    }
    return result
}
```
