첫번째 제출   
약수의 개수를 구하는 함수를 따로 만들고   
1부터 증가하면서 개수의 합을 조건문에 비교하여 결과값에 더해주었다.   
약수의 개수를 구하는 함수의 복잡도는 O(sqrt(N)),   
solution함수의 복잡도는 O(n)이므로 가능할거라 생각했지만 테스트케이스 하나가 시간초과   
```
import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    var cnt = 1
    while cnt <= number{
        var num = check(cnt)
        if num <= limit {
            result += num
        } else {
            result += power
        }
        cnt += 1
    }
    //print(result)
    
    return result
}

// 약수의 개수 구하는 함수
func check(_ n: Int) -> Int {
    var i = 1
    var answer = 0
    while i * i <= n {
        if n % i == 0 {
            if i*i == n {
                answer += 1
            } else {
                answer += 2
            }
        }
        i += 1
    }
    return answer
}
```
두번째 제출   
n이 1,2,3일때 단순하게 return만 해주어도 시간절약을 할 수 있었다.   
```
import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    var cnt = 1
    while cnt <= number{
        var num = check(cnt)
        if num <= limit {
            result += num
        } else {
            result += power
        }
        cnt += 1
    }
    //print(result)
    
    return result
}

// 약수의 개수 구하는 함수
func check(_ n: Int) -> Int {
    var i = 1
    var answer = 0
    if n == 1 {
        answer = 1
    } else if n == 2 {
        answer = 2
    } else if n == 3 {
        answer = 2
    } else {
        while i * i <= n {
            if n % i == 0 {
                if i*i == n {
                    answer += 1
                } else {
                    answer += 2
                }
            }
            i += 1
        }
    } 
    return answer
}

```
