이분탐색 개념으로 풀이하면 쉽다.   
1,2,3,4,5에서 3 이상의 차이를 구한다고 가정할때   
3이상 차이가 될때까지 end를 늘려준다.   
1과 4가 된다.   
그렇다면 result을 3으로 만들고 끝내본다.   
자연스럽게 start가 증가해서 2가 된다.   
2와 4는 차이가 아직 2이므로 end를 증가해본다.   
2와 5는 차가 3이므로 break 후 start를 다시 증가한다.   
end가 5보다 큰 6이 된 순간 종료한다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var arr: [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    arr.sort(by:<)
    
    var diff = 0
    var result = Int.max
    var end = 0
    
    for start in 0..<n {
        while end < n {
            //print(start,end)
            diff = abs(arr[start] - arr[end])
            if diff >= m {
                result = min(result, diff)
                break
            }else if diff < m {
                end += 1
            }
        }
    }
    print(result)
}

solution()
/*
 
 */


```
