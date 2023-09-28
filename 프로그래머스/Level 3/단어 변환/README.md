최대한 빠르게 찾아야하기 때문에 bfs가 옳다고 판단하였다.   
배열에 처음 글자를 넣고, 몇번째 순서인지 넣는다.   
배열을 words와 비교하면서 한글자를 빼고 서로 맞는 글자인지 확인해주고,   
맞다면 append해준다.   
혹은 한글자만 빼면 같은 글자라면 return해준다.   
```
import Foundation
// 글자가 2글자 같은지 확인
func diff(_ str1: String, _ str2: String) -> Bool {
    let str1 = Array(str1), str2 = Array(str2)
    var cnt = 0
    for i in 0..<str1.count {
        if str1[i] == str2[i] { cnt += 1 }
    }
    return cnt == 2 ? true : false
}
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // 단어가 포함되어있지 않고 시작과 끝 단어가 같다면 0을 return
    guard words.contains(target), begin != target 
    else { return 0 }
    
    // 시작 노드
    var needChanged: [(str: String, cnt: Int)] = [(begin, 0)]
    var index = 0
    
    while !needChanged.isEmpty {
        //print(needChanged)
        let node = needChanged[index]
        index += 1
        
        let word = node.str
        let count = node.cnt
        
        for nextWord in words {
            //print("현재 \(word)단어로 비교 시작")
            // 글자 비교
            if diff(word, nextWord) {
                // 다음 단어와 바꿨을때 같아질 수 있다면
                if nextWord == target { return count+1 }
                else {
                    needChanged.append((nextWord, count+1))
                }
            }
            
        }
    }
    return 0
}
```
분명 맞는 알고리즘인거같은데 틀린 이유를 찾아보니   
글자의 길이는 3~10이라는 조건을 충족시키지 못했다 (diff함수에서)   
내가 짠 코드는 3글자로 국한시켜 풀이하고있었기에 이 부분을 수정했다.   
```
import Foundation
// 글자가 2글자 같은지 확인
func diff(_ str1: String, _ str2: String) -> Bool {
    let str1 = Array(str1), str2 = Array(str2)
    var cnt = 0
    for i in 0..<str1.count {
        if str1[i] != str2[i] { cnt += 1 }
    }
    return cnt == 1 ? true : false
}
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // 단어가 포함되어있지 않고 시작과 끝 단어가 같다면 0을 return
    guard words.contains(target), begin != target 
    else { return 0 }
    
    // 시작 노드
    var needChanged: [(str: String, cnt: Int)] = [(begin, 0)]
    var index = 0
    
    while !needChanged.isEmpty {
        //print(needChanged)
        let node = needChanged[index]
        index += 1
        
        let word = node.str
        let count = node.cnt
        
        for nextWord in words {
            //print("현재 \(word)단어로 비교 시작")
            // 글자 비교
            if diff(word, nextWord) {
                // 다음 단어와 바꿨을때 같아질 수 있다면
                if nextWord == target { return count+1 }
                else {
                    needChanged.append((nextWord, count+1))
                }
            }
            
        }
    }
    return 0
}
```
다시 풀기   
words.contains(target) 조건을 넣지 않아 계속 2번테스트케이스가 오류가 났었다.   
```
import Foundation
func canChange(_ str1: String, _ str2: String) -> Bool {
    let str1 = str1.map{String($0)}
    let str2 = str2.map{String($0)}
    var cnt = 0
    for i in 0..<str1.count {
        if str1[i] != str2[i] { cnt += 1 }
    }
    return cnt == 1 ? true : false
}
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) || begin == target { return 0 }
    var arr: [(String, Int)] = []
    var index = 0
    arr.append((begin, index))
    while !arr.isEmpty {
        let word = arr[index].0
        let count = arr[index].1
        index += 1
        
        for w in words {
            if canChange(word, w) {
                if w == target { 
                    return count + 1 
                } else {
                    arr.append((w, count + 1))
                }
            }
        }
    }
    return 0
}
```
