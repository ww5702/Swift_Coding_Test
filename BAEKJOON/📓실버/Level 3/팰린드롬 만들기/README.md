```
import Foundation
func solution(){
    let str = readLine()!
    var arr = str.map{String($0)}
    var dict: [String:Int] = [:]
    //print(arr)
    /*
     홀수인게 하나 이상이라면 불가
     */
    for i in 0..<arr.count {
        if dict[arr[i]] == nil {
            dict.updateValue(1, forKey: arr[i])
        } else {
            let value = dict[arr[i]]!
            dict.updateValue(value+1, forKey: arr[i])
        }
    }
    var isOdd = 0
    for (key, value) in dict {
        isOdd += value % 2 == 1 ? 1 : 0
    }
    
    let sortedDict = dict.sorted(by : {$0.key < $1.key})
    //print(sortedDict)
    
    // 개수가 짝수
    if arr.count % 2 == 0 {
        //짝수인데 홀수개수가 존재한다면 실패
        if isOdd != 0 {
            print("I'm Sorry Hansoo")
        } else {
            var result = ""
            for (key, value) in sortedDict {
                result += String(repeating: key, count: value/2)
            }
            result += result.reversed()
            print(result)
        }
    }
    // 홀수
    else {
        // 한개까지 가능
        if isOdd > 1 {
            print("I'm Sorry Hansoo")
        } else {
            var result = ""
            var isOdd = ""
            for (key, value) in sortedDict {
                if value % 2 == 1 {
                    isOdd = key
                }
                result += String(repeating: key, count: value/2)
            }
            var ans = result
            ans += isOdd
            ans += result.reversed()
            print(ans)
        }
    }
}
solution()

```
