문제를 이해하기 쉽지 않았다.   
임의의 인접한 두 풍선을 고르고 단 한번만 작은수를 남길수있고 나머지는 큰 수를 남길 수 있는 방법으로   
최후의 풍선이 될수있는 풍선은 몇개인지 고르는 문제였다.   
따라서 목표 인덱스를 정하고, 해당 인덱스의 왼쪽 오른쪽으로 배열을 나눠   
큰수를 남기는 방법은 무한으로 가능하기에 왼쪽의 max, 해당인덱스, 오른쪽의 max를 남겨왔다.   
그리고 세 풍선의 숫자만을 남겨 아직 작은수를 터뜨릴수있는 기회 한번을 이용해   
두번 연속 작은 풍선일 경우인 가장 작은 경우를 제외하고는 전부 가능한 풍선으로 선별해 result를 반환시켰다.   

```
import Foundation
/*
더 낮은 숫자를 없앨수 있는 횟수는 1회이다.
그 뒤로는 계속해서 큰 숫자만 없앨 수 있다.
터뜨리는 풍선은 인접하다.
따라서 i,i+1 씩 비교해가면서 마지막으로 남는 숫자를 Set배열에 넣는다

결국 모든 경우는 n-1번 비교를 해야한다
2번 예제를 기준으로
-16은 65가 나머지 숫자들보다 크므로 다 없앤다음 -16이 더 작은 수로 선택
27은 왼쪽에 있는 수 -16 대기, 오른쪽의 수 중 가장 큰 수 65 작은수는 한번만 가능하므로 불가
65는 왼쪽 가장큰수 17 오른쪽 가장큰수 58 제일 크므로 가능
왼쪽 65 (-2) 58 오른쪽 제일 작으므로 불가
즉 index를 기준으로 오른쪽 왼쪽을 나눠서 가장 큰 수를 구해서
가장 크거나, 중간값이면 가능하다.

*/
func solution(_ a:[Int]) -> Int {
    var result = 1
    for i in 1..<a.count {
        var arr: [Int] = []
        let num = a[i]
        arr.append(num)
        var left = 0, right = 0
        if i < a.count-1 {
            left = a[0..<i].max()!
            right = a[i+1..<a.count].max()!
            arr.append(left)
            arr.append(right)
            arr.sort(by:<)
            if arr[0] != num {
                print(left,num,right)
                result += 1
            } else {
                print("실패케이스",left,num,right)
            }
        } else {
            left = a[0..<i].max()!
            result += 1
        }
    }
    print(result)
    return 0
}
```
