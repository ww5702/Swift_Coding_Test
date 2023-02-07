# 시간 복잡도(Time Complexity) ⏰⚡️ 
문제를 해결하기 위한 알고리즘의 로직을 코드로 구현할 때, 시간복잡도를 고려한다는 얘기를 가장 많이 들을 것이다.   
시간 복잡도를 고려한다는 것은   
***
'입력값의 변화에 따라 연산을 실행할 때, 연산 횟수에 비해 시간이 얼마만큼 걸리는가?' 
***
라는 의미이다.   
더 쉽게 말해 시간의 비율을 최소화한 알고리즘 즉, 효율이 좋은 알고리즘을 구성한다는 것을 의미한다.   
그리고 이 시간 복잡도는 빅-오 표기법을 사용해 나타낸다.   

## Big-O 표기법
시간복잡도를 표기하는 방법이다.   
Big-O(빅-오) ⇒ 상한 점근(최악의 경우)   
Big-Ω(빅-오메가) ⇒ 하한 점근(최선의 경우)   
Big-θ(빅-세타) ⇒ 그 둘의 평균(위 둘의 평균)   
이 중 빅-오 표기법은 최악의 경우를 고려하므로, 프로그램이 실행되는 과정에 소요되는 최악의 시간까지 고려한다.   
'이정도 시간이 걸린다' 가 아니라 -> '이정도 시간까지 걸릴 수 있다'를 고려한다는 것이다.   

## Big-O 표기법의 종류
1. O(1)   
2. O(n)   
3. O(log n)   
4. O(n2)   
5. O(2n)   
   
   
<img width="691" alt="스크린샷 2023-02-06 오후 4 00 02" src="https://user-images.githubusercontent.com/60501045/216904262-04140029-2453-4f66-aeba-8f8a1542ddf6.png">   
   
   
<img width="589" alt="스크린샷 2023-02-07 오후 4 46 20" src="https://user-images.githubusercontent.com/60501045/217183124-c43e848b-7dca-4bdb-a94b-5a0f517da347.png">   
   
   
## O(1)
O(1)은 일정한 복잡도라고 하며, 입력값이 증가하더라도 시간이 늘어나지않는 시간복잡도를 의미한다.   
입력의 크기와 관계없이 즉시 출력값을 얻어낼 수 있다는 의미이다.   
   
<img width="234" alt="스크린샷 2023-02-06 오후 4 01 56" src="https://user-images.githubusercontent.com/60501045/216904734-9efb3a4a-6262-4205-b956-bea94e451eff.png">   
   
```
func O_1_algorithm(_ arr : [Int],_ input : Int) -> Int {
    return arr[input]
}
let arr = [1,2,3,4,5]
let input = 1
let result = O_1_algorithm(arr,input)
print(result)
```
위와 같은 알고리즘이 존재할때 입력값이 아무리 커져도 즉시 출력값을 얻을 수 있다.   
arr이 1,2,3,4,5가 아니라 100까지 있어도 즉시 해당 input에 접근해 값을 반환할 수 있다.   

## O(n)
O(n)은 선형 복잡도 라고 부르며, 입력값이 증가함에 따라 시간이 같은 비율로 증가하는 것을 의미한다.(비례)   
예를 들어 입력값이 1일때 1초의 시간이 걸리고, 입력값을 100으로 증가시켰을때 100초가 걸리는 알고리즘이라면   
O(n)의 시간복잡도를 가졌다는 것을 의미한다.   
   
<img width="262" alt="스크린샷 2023-02-06 오후 4 10 35" src="https://user-images.githubusercontent.com/60501045/216906738-de98d19e-36d4-4a43-ae3c-2f1aa39623ad.png">   
   
```
import Foundation
 
func O_n_algorithm(_ n : Int){
    for i in 0..<n {
        print(i)
    }
}
func another_O_n_algorithm(_ n : Int){
    for i in 0..<2*n {
        print(i)
    }
}
let n : Int = 100
O_n_algorithm(n)
another_O_n_algorithm(n)
```
O_n_algorithm 함수에서는 입력값이 1 증가할 때 마다 실행시간이 1초씩 증가한다   
입력값이 증가함에 따라 같은 비율로 걸리는 시간이 증가하고 있기 때문이다.   
   
그렇다면 another_O_n_algorithm은 2초씩 증가하기 때문에 O(2n)인가 싶지만 그렇지 않다.   
입력값이 커지면 커질수록 의미가 퇴색되기 때문에 같은 비율로 증가하고 있다면 5배 10배 증가하더라도 O(n)이다.   

## O(log n)
O(log n)은 로그 복잡도라고 부르며 빅-오 표기법중 O(1) 다음으로 빠른 시간 복잡도를 가진다.   
Binary Search Tree(이진탐색트리)가 대표적인 예시이다.   
   
<img width="239" alt="스크린샷 2023-02-07 오후 4 17 54" src="https://user-images.githubusercontent.com/60501045/217174459-df3da30c-bbbe-4cef-86c5-49e1f2ad23cb.png">   
   
```
import Foundation
 
func O_logn_algorithm(_ arr : [Int], num : Int) -> Bool{
    if arr.count == 1 {
        return arr[0] == num ? true : false
    }
    let mid = arr.count / 2
    if arr[mid] == num { return true }
    let range = arr[mid] > num ? (0..<mid) : ((mid + 1)..<arr.count)

    return O_logn_algorithm(Array(arr[range]), num: num)
}
let arr = [1,2,3,4,5,6,7,8,9,10]
print(O_logn_algorithm(arr, num : 3))
```

1부터 100까지의 숫자중 원하는 값을 탐색할 때, 30을 골랐다면 50보다 큰지 작은지 조사한 후 작은값으로 다시 탐색을 한다.   
매번 숫자를 제시할 때 마다 경우의 수가 절반으로 줄어들기 떄문에 최악의 경우에도 7번이면 원하는 숫자를 찾을 수 있다.   
   
위와 같이 주로 정렬알고리즘처럼 문제를 해결하는데 필요한 단계들이 연산마다 특정 요인에 의해 줄어드는 경우 O(logn).      

## O(n^2)
O(n^2)는 2차 복잡도라고 부르며, 입력값이 증가함에 따라 시간이 n의 제곱수의 비율로 증가하는 것을 의미한다.   
1이라는 입력값일 때 1초가 걸리던 알고리즘이 5라는 입력값을 주었을때 25초가 걸리게 된다는 뜻을 의미한다.   
   
<img width="242" alt="스크린샷 2023-02-07 오후 4 32 46" src="https://user-images.githubusercontent.com/60501045/217179670-a8175910-3aa8-4791-88e5-f0a05055f1b6.png">   
   
```
import Foundation
 
func O_n2_algorithm(_ n : Int){
    for _ in 0..<n {
        for _ in 0..<n {
            print("1초 증가")
        }
    }
}

func another_O_n2_algorithm(_ n : Int) {
    for _ in 0..<n {
        for _ in 0..<n {
            for _ in 0..<n {
                print("1초 증가")
            }
        }
    }
}
O_n2_algorithm(2)
another_O_n2_algorithm(2)
```
2n과 5n을 모두 시간복잡도 O(n)이라고 하는것처럼, n^3 n^5 또한 모두 O(n^2)라고 표기한다.   
n이 커지면 커질수록 지수가 주는 영향력이 퇴색되니 때문이다.   

## O(2^n) 
O(2^n)는 기하급수적 복잡도라고 부르며 빅-오 표기법중 가장 느린 시간 복잡도를 가진다.   
가장 대표적인 기하급수적 복잡도로 피보자치 수열을 뽑을 수 있다.   
   
<img width="253" alt="스크린샷 2023-02-07 오후 4 41 19" src="https://user-images.githubusercontent.com/60501045/217182132-2003bdeb-a2e5-46d2-ac78-0fac918486b7.png">   
   
   
```
import Foundation
 
func O_2n_algorithm(_ n : Int) -> Int{
    if n == 1 { return 1}
    return n + O_2n_algorithm(n-1)
}
print(O_2n_algorithm(5))
```
종이를 42번 접으면 두께가 지구에서 달까지의 거리보다 커진다는 이야기를 증명하는 알고리즘이다.   
