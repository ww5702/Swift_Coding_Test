조합을 만드는 함수를 만들어준다.   
menu라는 [String, Int]의 딕셔너리를 만들어 조합에 따른 경우의수를 +1해준다.   
menu를 순환하면서 course의 개수와 같을때 append해주었다.   

```
import Foundation


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 조합
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
    
    var menu: [String: Int] = [:]
    for o in orders {
        let arr = o.map{String($0)}
        //print(arr)
        var cnt = 1
        while cnt <= arr.count {
            let combi = combination(arr, cnt)
            for c in combi {
                let check = c.count
                let key = c.joined()
                if menu[key] == nil {
                    menu[key] = 1
                } else {
                    menu[key]! += 1
                }
            }
            cnt += 1
        }
    }
    // 정렬
    let sortedMenu = menu.sorted{$0.1>$1.1}
    var result: [String] = []
    // course에 따른 최대호출 음식 입력
    var course = course
    var maxValue = 1
    var maxKey = -1
    for i in sortedMenu {
        let key = i.key
        let value = i.value
        
        if value < maxValue {
            course.remove(at: maxKey)
        }
        
        print(key,value)
        for c in course {
            if key.map{String($0)}.count == c {
                result.append(key)
                
                maxValue = value
                maxKey = course.firstIndex(of: c)!
            }
        }
    }
    //print(sortedMenu)
    print(result)
    return []
}
```
