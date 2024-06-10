조합으로 배우는 알파벳의 경우의수를 구하여 해당 단어를 배웠을때의 값을 비교해보았다.   
시간초과 발생   

```
import Foundation
func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
        
    }
    
    return result
}

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    // a n t i c
    if k < 4 {
        print(0)
    } else {
        var list: Set<String> = []
        var storeWord: [[String]] = []
        for _ in 0..<n {
            let arr = readLine()!.map{String($0)}
            storeWord.append(arr)
            for i in 0..<arr.count - 8 {
                
                if arr[i+4] != "a" && arr[i+4] != "n" && arr[i+4] != "t" && arr[i+4] != "i" && arr[i+4] != "c" {
                    list.insert(arr[i+4])
                }
            }
        }
        //print(storeWord)
        let setArr = Array(list)
        let value = combination(setArr, k-5)
        var arr = ["a","n","t","i","c"]
        var result = 0
        for i in 0..<value.count {
            var tempArr = arr + value[i]
            var cnt = 0
            //print(tempArr)
            for j in 0..<storeWord.count {
                let now = storeWord[j]
                var isOk = true
                for k in 0..<now.count {
                    if !tempArr.contains(now[k]) {
                        isOk = false
                        break
                    }
                }
                
                if isOk { cnt += 1 }
            }
            result = max(result, cnt)
            //print(cnt)
        }
        
        print(result)
    }
    
}
solution()

```
다른 언어로는 위의 방법이 통과 가능하나 swift는 비트마스킹을 사용해야 시간초과를 피할 수 있다.   
```
import Foundation

func solution(){
    var nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = nk[0]
    var k = nk[1]
    var result = 0
    var alphabet = 0
    var wordsBit = Array(repeating: 0, count: 50)
    for i in 0..<n{
        let a = readLine()!.map{String($0)}
        for j in a{
            wordsBit[i] |= 1 << (Int(Character(j).asciiValue! - Character("a").asciiValue!))
        }
    }
    //print(wordsBit)
    func dfs(_ depth: Int, _ start: Int){
        var count = 0
        if depth == k{
            for i in 0..<n{
                if wordsBit[i] & alphabet == wordsBit[i]{
                    count += 1
                }
            }
            result = max(result, count)
            return
        }
        for i in start...25{
            if (alphabet & (1 << i)) == 0{
                alphabet |= (1 << i)
                dfs(depth + 1, i)
                alphabet &= ~(1 << i)
            }
        }
    }
    if k < 5 {
        print(0)
    } else {
        alphabet |= 1 << (Int(Character("a").asciiValue! - Character("a").asciiValue!))
        alphabet |= 1 << (Int(Character("n").asciiValue! - Character("a").asciiValue!))
        alphabet |= 1 << (Int(Character("t").asciiValue! - Character("a").asciiValue!))
        alphabet |= 1 << (Int(Character("i").asciiValue! - Character("a").asciiValue!))
        alphabet |= 1 << (Int(Character("c").asciiValue! - Character("a").asciiValue!))
        k -= 5
        dfs(0,0)
        
        print(result)
    }
}
solution()

```
