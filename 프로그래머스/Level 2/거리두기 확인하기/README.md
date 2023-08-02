첫 제출   
extension을 이용해 POOOX를 map($0)처럼 사용하기 위해 확장하였다.   
그리고 각 배열의 단어들에서 P 즉 사용자의 좌표를 정하고   
사람들 사이의 거리가 1일때 2일때 2이상일때 경우의 수에 따라 예외처리하였다.   

```

import Foundation
// maping을 사용해주기 위해 확장
extension String {
    subscript(_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}
func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    
    for p in places {
        var pArr: [[Int]] = []
        var isSafe = true
        
        // pArr에 P의 위치를 찍는다.
        for (i, row) in p.enumerated() {
            for (j, v) in row.enumerated() {
                if v == "P" { pArr.append([i,j]) }
            }
        }
        
        for i in 0..<pArr.count {
            if !isSafe { break }
            
            // 두 사람씩 비교
            for j in (i+1)..<pArr.count {
                let one = pArr[i]
                let two = pArr[j]
                let distance = abs(one[0]-two[0]) + abs(one[1]-two[1])
                // 거리가 2 이상이라면 통과
                if distance > 2 { continue }
                
                // 만약 1 이하라면 실패
                if distance == 1 {
                    isSafe = false
                    break
                }
                
                // 거리가 2인 경우 체크가 필요
                if distance == 2 {
                    if one[0] == two[0] {
                        // 행이 일치한다면
                        if p[one[0]][min(one[1], two[1])+1] == "O" {
                            isSafe = false
                            break
                        }
                    } else if one[1] == two[1] {
                        // 열이 일치한다면
                        if p[min(one[0], two[0]+1)][one[1]] == "O" {
                            isSafe = false
                            break
                        }
                    } else {
                        if p[one[0]][two[1]] == "O" || p[two[0]][one[1]] == "O" {
                        isSafe = false
                        break
                        }
                    }
                }
            }
        }
        result.append(isSafe ? 1 : 0)
    }
    return result
}
```
