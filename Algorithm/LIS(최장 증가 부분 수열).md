# LIS (Longest Increasing Subsequence)
최장 증가 부분 수열    
어떤 임의의 수열이 주어질 때, 이 수열에서 몇 개의 수들을 제거해서 부분수열을 만들 수 있다.   
그럼 먼저 부분수열이란 무엇일까?   
## 부분수열
부분수열은 어떤 수열에서 일부 원소들을 순서를 유지하면서 선택한 것을 말한다.   
3 5 7 9 2 1 4 8 이라는 수열이 있을 때   
3 5 / 7 2 8 / 3 1 4 8 / 3 / 2 8 등   
순서를 유지한 상태이기만 하면 부분수열이다.   
   
그렇다면 최장 증가 부분수열이란 무엇일까?   
   
## 최장 증가 부분 수열
위의 부분수열들 중 오름차순으로 정렬된 가장 긴 수열을 최장 증가 부분수열이라고 한다.   
3 5 / 3 / 2 8 이 위의 예시로 주어진 부분수열중 최장 증가 부분 수열이라고   
고민해볼 자격이 생긴다는 것이다.   
여튼 최장 증가 부분 수열은 3 5 7 9 혹은 3 5 7 8 등 최대 4의 크기가   
최장 증가 부분 수열이다.   
   
   
## LIS 길이 구하기 문제  
이제 해당 길이를 구하는 알고리즘 문제가 있다고 가정하자   
풀이 방식은 2가지가 있다.   
   
   
## O(n^2) 기본적인 풀이(DP)
가장 쉽게 생각하면 현재 비교할 숫자가 앞에 숫자들중 몇번째로 큰지 비교하는것이다.   
index 0 1 2 3 4 5 6 7 8    
arr   0 3 5 7 9 2 1 4 8   
answer0 1 2 3 4 1 1 2 4   
arr 3은 처음 들어가고, 5는 3 뒤에 가능하므로 2, 7은 5 뒤에 가능하므로 3....   
이런 방식으로 진행된다.   
arr 4같은 경우에는 앞선 숫자들중 3(index = 1) , 2(index = 5), 3(index = 6) 뒤에 가능하다.   
해당 값들중 가장 max값을 넣어주면 되지만 3가지 경우 모두 answer가 1이므로 2를 넣어준다.   
이렇게 해서 answer 배열을 완성했다.   
해당 배열에서 가장 숫자가 큰 정답은 4이다.   
```
import Foundation

func solution() {
    let arr: [Int] = [3,5,7,9,1,4,8]
    // LIS길이의 최솟값, 즉 자기 자신 1로 초기화
    var dp: [Int] = Array(repeating: 1, count: arr.count)
    for i in 0..<arr.count {
        for j in 0..<i {
            // 만약 해당 dp[i]값이 그 전의 길이들보다 크다면 해당 dp[j]뒤에 붙을 수 있다는 의미.
            // 따라서 dp[j] + 1해준다.
            // 하지만 위 동작은 dp[j]+1이 dp[i]보다 클 경우에만 동작
            if arr[i] > arr[j] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    print(dp) // [1, 2, 3, 4, 1, 2, 4]
}

solution()
```
그리고 해당 최장증가부분수열의 구성을 구하기 위해 다시 반복문을 역으로 순환시켜 구할 수 있다.   
```
var result = dp.max()!
var list: [Int] = [] 
for i in stride(from: n-1, through: 0, by: -1) {
   if dp[i] == result {
   list.append(arr[i])
   result -= 1
   }
}
print(list)
```
하지만 당연하게도 O(N^2)로 풀이가 가능한 알고리즘 문제는 거의 없다.   
   
   
## O(N log N) 이분 탐색   
이 방법은 LIS를 기록하는 배열을 하나 더 두고,   
원래 수열에서 각 원소에 대해 LIS배열 내에서의 위치를 찾는 방법이다.   
똑같은 예제가 존재한다고 가정하자.   
index 0 1 2 3 4 5 6 7 8    
arr   0 3 5 7 9 2 1 4 8   
result 3    
result 3 5   
reuslt 3 5 7   
result 3 5 7 9   
result 2 5 7 9   
result 1 5 7 9   
result 1 4 7 9   
result 1 4 7 8   
이와 같은 방식으로 진행이 된다.   
2(index = 5)가 삽입될 때를 살펴보겠다.   
2는 0~3 사이의 값이다.   
1번째의 값을 3에서 2로 갱신해준다.   
이 이유는 어차피 나중에 길이가 2인 수열을 찾기 위해서는 index가 5인 2 뒤에   
붙일 수 있는지 확인만 하면 되기 때문이다.   

위의 예제는 첫 4개의 숫자가 연속적으로 지정되어있기에 다른 예제로 풀이해보겠다.   
1 5 4 2 3 8 6 7 9 3 4 5   
일때   
```
1
1 5
1 4
1 2
1 2 3
1 2 3 8
1 2 3 6
1 2 3 6 7
1 2 3 6 7 9
1 2 3 6 7 9
1 2 3 4 7 9
1 2 3 4 5 9
길이는 6이 된다.   
```
코드로 풀이한다면 이렇게 된다.   
```
import Foundation

func solution() {
    let arr: [Int] = [1, 5, 4, 2, 3, 8, 6, 7, 9, 3, 4, 5]
    var result: [Int] = []
    result.append(arr[0])
    for i in 1..<arr.count {
        // 만약 result의 last 즉 더 큰 값이라면 붙일 수 있다.
        if arr[i] > result.last! {
            result.append(arr[i])
            continue
        }
        
        var start = 0
        var end = result.count
        while start <= end {
            let mid = (start+end)/2
            if result[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        result[start] = arr[i]
    }
    
    print(result) // [1, 2, 3, 4, 5, 9]
}

solution()

```
