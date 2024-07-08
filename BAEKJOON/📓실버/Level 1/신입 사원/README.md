첫번쨰 성적을 기준으로 오름차순 정렬을 한다.   
그렇다면 이미 i사원은 자신이 뒤로는 전부 다 높다.   
그렇다면 두번째 성적까지 높아야 되기에 만약   
다음 사원이 더 높은 등수를 가지고 있다면 last를 바꿔주고   
+1 해준다.   
더 낮다면 모두한테 높은것이 아니다.   

```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var arr: [(Int,Int)] = []
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            arr.append((input[0],input[1]))
        }
        arr.sort(by: {$0.0 == $1.0 ? $0.1 < $1.1 : $0.0 > $1.0})
        //print(arr)
        var ans = 1
        var last = arr[0].1
        for i in 1..<n {
            if last < arr[i].1 {
                ans += 1
            }
            last = arr[i].1
        }
        print(ans)
    }
}

solution()
/*

 */

```
