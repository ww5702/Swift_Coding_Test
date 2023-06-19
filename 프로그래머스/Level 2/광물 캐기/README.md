```
import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var section : [[String]] = []
    var min = minerals
    var p = picks
    var result = 0
    var MAX = picks.reduce(0) { $0 + $1 } * 5

    // 5개의 구역으로 맞춰서 늘려주기
    while (min.count%5 != 0) {
        min.append("")
    }
    // 최대 몇개까지 캘수 있는가
    //print(MAX)
    var N = 0
    
    // 필요한 곡괭이의 수
    if MAX >= min.count {
        N = min.count/5
    } else {
        N = MAX/5
    }

    for i in 0..<N {
        var sec : [String] = []
        for j in 0..<5 {
            let m = min.removeFirst()
            sec.append(m)
        }

        section.append(sec)
    }
    //print(section)
    
    // section마다 피로도의 순서
    for i in 0..<section.count {
        var n = 0
        for j in 0..<5 {
            switch section[i][j] {
                case "diamond":
                    n += 25
                case "iron":
                    n += 5
                case "stone":
                    n += 1
                default:  
                    n += 0
            }
        }
        section[i].append("\(n)")
    }
    print(section)
    // 피로도가 큰 순서로 정렬
    section.sort(by: { Int($0[5])! > Int($1[5])! })
    print(section)
    print(p)
    // section이 다 빌때까지
    while !section.isEmpty {
        let now = section.removeFirst()
        var pick = 0
        if p[0] != 0 {
            pick = 25
            p[0] -= 1
        } else if p[1] != 0 {
            pick = 5
            p[1] -= 1
        } else if p[2] != 0{
            pick = 1
            p[2] -= 1
        } else {
            break
        }
        
        for i in 0..<5 {
            if now[i] == "diamond" {
                result += (25/pick == 0 ? 1 : 25/pick)
            } else if now[i] == "iron" {
                result += (5/pick == 0 ? 1 : 5/pick)
            } else if now[i] == "stone" {
                result += 1
            } else {
                result += 0
            }
        }
    }
    return result
}
```
범위가 작아서 완전탐색으로 풀이했다.   
