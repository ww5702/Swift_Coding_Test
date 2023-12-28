# 스택을 사용하여 더욱 어려운 문제를 해결해 봅시다.	
## 9935 문자열 폭발
문자열의 substring을 이용하여 풀이해보았지만 실패하였다.   

```
import Foundation
func solution() {
    var words = Array(readLine()!)
    let bomb = readLine()!
    var result = ""
    func checkOk(_ addWord: String) -> String{
        var word = addWord
        //print("check",word)
        while true {
            if word.suffix(bomb.count) != bomb { break }
            let start = word.index(word.startIndex, offsetBy: 0)
            let end = word.index(word.startIndex, offsetBy: word.count-bomb.count)
            word = word.substring(with: start..<end)
            //print("delete",word)
        }
        return word
    }
    var temp = ""
    for i in 0..<words.count {
        temp.append(words[i])
        
        // bomb 확인
        if temp.count >= bomb.count {
            //print(temp.suffix(bomb.count))
            if bomb == temp.suffix(bomb.count) {
                
                let start = temp.index(temp.startIndex, offsetBy: 0)
                let end = temp.index(temp.startIndex, offsetBy: temp.count-bomb.count)
                result.append(temp.substring(with: start..<end))
                
                //print("adding",result)
                temp = ""
            }
            
        }
    }
    result.append(temp)
    let answer = checkOk(result)
    answer.count == 0 ? print("FRULA") : print(answer)
}

solution()

```
문제를 너무 어렵게 생각한것 같았다.   
stack을 이용하여 popLast를 반복해준다.   
```
import Foundation
func solution() {
    var words = String(readLine()!)
    let bomb = readLine()!
    var stack: [Character] = []
    
    for word in words {
        stack.append(word)
        if bomb.last! == word {
            let cnt = stack.count
            if cnt >= bomb.count && String(stack[(cnt-bomb.count)...]) == bomb {
                for _ in 0..<bomb.count {
                    stack.popLast()
                }
            }
        }
    }
    stack.count == 0 ? print("FRULA") : print(String(stack))
}

solution()

```
## 17298 오큰수
신박한 풀이방식이었다.   
stack을 이용하여 풀이하는데 index값들을 이용해 풀이하는 것이다.   
예를 들어 9 5 4 8이 있다.   
만약 스택의 last! (9)가 5 4 8 보다 작은 순간이 있다면 해당 숫자가 오큰수이다.   
하지만 없다면 일단 값을 스택에 넣는다.   
말로 들으면 어려워보일 수 있으니 해당 코드의 동작순서를 보여주겠다.  
```
num    = 9 5 4 8
result = 0
num    = 9 5 4 8
result = 0 1
num    = 9 5 4 8
result = 0 1 2
num    = 9 5 8 8
result = 0 1
num    = 9 8 8 8 
result = 0
num    = 9 8 8 8
result = 0 3
```
이제 남은 result(index배열)을 순회하면서 해당 값들은 오큰수가 없다는 의미로   
값을 -1로 변환시켜준다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var num = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    for i in 0..<n {
        while !result.isEmpty && num[result.last!] < num[i] {
            num[result.removeLast()] = num[i]
        }
        
        result.append(i)
    }
    for i in result {
        num[i] = -1
    }
    print(num.map{String($0)}.joined(separator: " "))
}

solution()

```
## 17299 오동큰수
오큰수와 같은 방식으로 풀이하기만 하면 된다.   
혹시 해당 숫자의 갯수를 카운팅하는 과정에서 시간초과가 발생하지 않으려나 걱정했지만   
다행히 문제 없었다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var num = readLine()!.split(separator: " ").map{Int($0)!}
    var cnt = Array(repeating: 0, count: 5)
    for n in num {
        cnt[n] += 1
    }
    //print(cnt)
    // 3 2 1 1
    // -1 -1 1 2 2 1 -1
    var stack: [Int] = []
    for i in 0..<n {
        while !stack.isEmpty && cnt[num[stack.last!]] < cnt[num[i]] {
            num[stack.removeLast()] = num[i]
        }
        
        stack.append(i)
    }
    for i in stack {
        num[i] = -1
    }
    print(num.map{String($0)}.joined(separator: " "))
}

solution()

```
## 1725 히스토그램
전에 풀이했던 분할정복처럼 풀이할 경우 시간초과가 발생한다.   
스택으로 풀이했어야 했기에 오큰수나 오동큰수처럼 index를 넣다가   
높이보다 작은 순간이 나온다면 해당순간을 기준으로 넓이를 구해주는 방식으로   
풀이를 진행해보았다.   
```
import Foundation

func solution() {
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    //print(arr)
    var result = 0
    var stack: [Int] = []
    for i in 0..<n {
        while !stack.isEmpty && arr[stack.last!] > arr[i] {
            var height = arr[stack.popLast()!]
            var width = stack.isEmpty ? i : i - stack.last! - 1
            //print(height,width,result)
            result = max(result, height*width)
        }
        
        stack.append(i)
        //print(stack)
    }
    print(stack)
    
    while !stack.isEmpty {
        var height = arr[stack.popLast()!]
        var width = stack.isEmpty ? n : n - stack.last! - 1
        print(height,width,result)
        result = max(result,height*width)
    }
    print(result)
}

solution()

```
