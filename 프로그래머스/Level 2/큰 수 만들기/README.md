주어진 숫자를 조합으로 풀이하여 최대값을 정렬하여 풀려고 하였으나   
stack을 가져와 앞에서부터 숫자를 하나씩 집어넣고   
다음 집어넣을 숫자가 이미 넣은 숫자보다 크다면 전에 넣었던 숫자를 remove해주는 방법이   
더 쉽게 문제를 해결할 수 있을 뿐만 아니라 문제의 본질인 그리디 알고리즘에 적합하여 이와 같이 풀이하였다.   

```
import Foundation
func solution(_ number:String, _ k:Int) -> String {
    var arr = number.map{Int(String($0))!}
    print(arr)
    var stack: [Int] = []
    var cnt = 0
    
    for i in 0..<arr.count {
        // 새로 들어온 수보다 작은 수를 지워준다. 
        while stack.count > 0 && stack.last! < arr[i] && cnt < k {
            stack.removeLast()
            cnt += 1
            
            if cnt == k {
                break
            }
        }
        stack.append(arr[i])
    }
    return stack.reduce(""){$0 + "\($1)"}
}
```
12번 테스트케이스가 실패했는데   
이는 "22222",1 과 같이 하나도 지워지지 않는 경우이다   
그렇다면 가장 작은수가 가장 뒤에 있기 때문에 뒤에서부터 k번 지워준다.   
```
import Foundation
func solution(_ number:String, _ k:Int) -> String {
    var arr = number.map{Int(String($0))!}
    //print(arr)
    var stack: [Int] = []
    var cnt = 0
    
    for i in 0..<arr.count {
        // 새로 들어온 수보다 작은 수를 지워준다. 
        while stack.count > 0 && stack.last! < arr[i] && cnt < k {
            stack.removeLast()
            cnt += 1
            
            if cnt == k {
                break
            }
        }
        stack.append(arr[i])
    }
    // 하나도 지워지지않았다면
    if cnt == 0 {
        for i in 1...k {
            stack.removeLast()
        }
    }
    return stack.reduce(""){$0 + "\($1)"}
}
```
