# 동적 계획법 (Dynamic Programming)   
DP 즉 동적계획법은 기본적인 아이디어로 하나의 큰 문제를 여러 개의 작은 문제로 나누어서 그 결과를 저장하여   
다시 큰 문제를 해결할 때 사용하는 것으로 알고리즘이 아닌 하나의 문제해결 패러다임으로 볼 수 있다.   
'큰 문제를 작은 문제로 쪼개서 그 답을 저장해두고 재활용'한다 -> 즉 기억하며 풀기라고 부르기도 한다.   
   
DP는 일반적인 재귀를 단순히 사용 시 동일한 작은 문제들이 여러번 반복되어 비효율적인 계산이 될 수 있기에   
메모리 절약을 위해 흔히 사용한다.   

## DP가 적용되기 위해서는 2가지 조건을 만족해야한다.   
1. Overlapping Subproblems(겹치는 부분 문제)   
동일한 작은 문제들이 반복하여 나타나는 경우에 사용이 가능하다.   
부분 문제가 반복적으로 나타나지 않는다면 재사용이 불가능하니 부분 문제가 중복되지 않는 경우에는 사용할 수 없다.   
ex) 이진탐색, 피보나치 수열   
2. Optimal Substructure(최적 부분 구조)   
부분 문제의 최적 결과값을 사용해 전체 문제의 최적 결과를 낼 수 있는 경우를 의미한다.   

## 구현 방법   
1. Bottom-Up 방식   
아래에서 부터 계산을 수행하고 누적시켜서 전체 큰 문제를 해결하는 방식이다.   
dp[0]부터 시작하여 dp[n]까지 그 값을 전이시켜 재활용하는 방식이다.   
2. Top-Down 방식   
db[0]에서 시작하는게 아닌 dp[n]의 값을 찾기 위해 위에서부터 바로 호출을 시작하여   
dp[0]의 상태까지 내려간다음 해당 결과값을 재귀를 통해 전이시켜 재활용하는 방식이다.   
   
   
## 피보나치로 표현한 예시   
단순 피보나치 함수   
```
func fibo(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fibo(n - 1) + fibo(n - 2)
}

```
동적 계획법 구현   
```
func fibo(_ n: Int) -> Int{
    var cache: [Int] = [0, 1]
    
    for num in 2...n {
        cache.append(cache[num - 1] + cache[num - 2])
    }
    return cache[n]
}
```
cache라는 저장 공간을 활용해 0부터 도출되는 값을 계속 저장해간다.   
   
동적 계획법 (Bottom-Up)
```
var cache = [Int](repeating: 0, count : 101)

cache[1] = 1
cache[2] = 1

func fibo(_ n: Int) -> Int {
	for i in 3...n {
    	cache[i] = cache[i-1] + cache[i-2]
    }
    
    return cache[n]
}
```
아래에서 위로 접근하는 방법으로 문제를 해결.   
   
동적 계획법 (Top-Down)
```
//범위보다 1크게
// cache[0] 초기값 상태 0으로 모두 채워줌
var cache = [Int](repeating: 0, count: 101)

cache[1] = 1
cache[2] = 1

//피보나치 수열
func fibo(_ n: Int) -> Int {
	if cache[n] != 0 {
    	return cache[n]
    }
    
    cache[n] = fibo(n-1) + fibo(n-2)
    return cache[n]
}
```

## 동적계획법 vs 분할정복   
둘다 가장 작은 단위로 분할하여 문제를 해결하지만   
동적계획법은 상위 문제를 해결하는데 작은 단위가 재사용되지만 분할정복은 재사용되지 않는다.   

