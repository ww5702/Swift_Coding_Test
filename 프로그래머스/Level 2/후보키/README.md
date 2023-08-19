조합, 유일성, 최소성을 확인하면 되는 문제이다.   
먼저 column들을 조합으로 가능한 경우의 수를 구하고   
해당 경우의 수를 Set배열을 사용해 중복된 경우가 있는지 유일성을 확인해주고   
유일성을 통과한 경우의 수를 기준으로 다시 최소성을 확인해주는 과정을 거친다.   
해당 경우의 수를 다시 조합으로 돌려 만약 유일성이 통과된 경우가 2가지 이상이라면 false 1가지라면 true를 반환한다.   
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
func isUnique(_ relation: [[String]], _ arr: [Int]) -> Bool {
    var arrSet: Set<String> = []
    for row in relation {
        var rowInfo = ""
        
        for a in arr {
            rowInfo += row[a]
        }
        
        // 또다시 같은값을 insert해주려 한다면 return false
        if arrSet.contains(rowInfo) { return false}
        
        // 조합들을 insert해준다.
        arrSet.insert(rowInfo)
    }
    return true
}

func isMinimal(_ relation: [[String]], _ key : [Int]) -> Bool {
    var cnt = 0
    for i in 1..<key.count {
        var newComb = combination(key, i)
        for n in newComb {
            if isUnique(relation, n) {
                cnt += 1 }
        }
    }
    
    if cnt == 1 { return true }
    else { return false }
}

func solution(_ relation:[[String]]) -> Int {
    var result = 0
    // 컬럼들의 조합을 구하는 함수
    for i in 1...relation[0].count {
        var comb = combination(Array(0..<relation[0].count), i)
        // 유일성을 판단 -> 중복되는 값이 있는지
        
        // 최소성을 판단 -> 유일성이 되는 조합으로 다시 조합을 생성하여
        // 유일성이 되는지 확인 -> 유일성이 또 된다면 최소성을 만족x
        
        for c in comb {
            if isUnique(relation, c) {
                if isMinimal(relation, c) {
                    result += 1
                }
            }
        }
        
    }
    
    print(result)
    
    return 0
}
```
다른 사람의 풀이 또한 비슷한 수순으로 풀이하였다.   

```
import Foundation

var candidateKeys = [Set<Int>]()

func isCandidate(_ temp: [Int], relation: [[String]]) -> Bool {
    var dict = Set<String>()
    
    for row in relation {
        let key = temp.reduce("") { return $0 + row[$1] }
        dict.insert(key)
    }
    
    return dict.count == relation.count
}

func combination(_ k: Int, _ relation: [[String]]) {
    let len = relation[0].count
    
    func combi(_ index: Int, _ depth: Int, _ temp: [Int]) {
        if depth == k {
            // 유일성을 확인
            if isCandidate(temp, relation: relation) {
                // 최소성을 확인
                for key in candidateKeys {
                    if key.isSubset(of: temp) { return }
                }
                candidateKeys.append(Set(temp))
            }
            
            return
        }
        
        for i in index..<len {
            combi(i + 1, depth + 1, temp + [i])
        }
    }
    
    combi(0, 0, [])
}

func solution(_ relation:[[String]]) -> Int {
    let len = relation[0].count
    
    for i in 1...len {
        combination(i, relation)
    }
    
    return candidateKeys.count
}
```
