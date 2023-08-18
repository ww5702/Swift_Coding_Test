subList를 이용해 선행스킬을 배우지 않았다면 break   
선행 스킬을 배웠다면 level을 +1   
만약 스킬들을 순서대로 다 배웠다면 뒤에 어떠한 스킬을 배우려고 한다고 한들 가능한 스킬트리   
```
import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    for s in skill_trees {
        let value = s.map{String($0)}
        var skill = skill.map{String($0)}
        var level = 0
        var isPossible = true
        for v in value {
            // 주어진 스킬을 다 배웠다면 뒤에 뭐가 오던 이미 가능
            if level == skill.count { break }
            
            let subValue = skill[level+1..<skill.count]
            // 만약 선행스킬을 배우지않고 다음 스킬을 배우려 한다면
            if subValue.contains(v) { 
                isPossible = false
                break
            }
            // 선행스킬을 배운다면
            if skill[level] == v {
                level += 1
            }
            
            //print(subValue)
        }
        if isPossible == true {
            result += 1
        } else {
            isPossible = true
        }
    }
    return result
}
```
