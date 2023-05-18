# 범위를 반씩 좁혀가는 탐색
이번에는 리스트 내에서 데이터를 아주 빠르게 탐색하는 이진 탐색 알고리즘에 대해서 공부한다.   
이진 탐색을 공부하기 전에 가장 기본 탐색 방법인 순차 탐색에 대해 먼저 이해할 필요가 있다.   
N개의 데이터가 있을 때, 그 데이터를 차례대로 하나씩 확인하여 처리한 경우도 많았는데 이를 순차 탐색이라고 할 수도 있다.   
이와 같이 순차 탐색이란 '리스트 안에 있는 특정한 데이터를 찾기 위해 앞에서부터 데이터를 하나씩 차례대로 확인하는 방법'이다. 
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{String($0)}
    func sequential_search(_ n: Int, _ target: String, _ arr: [String]) -> Int{
        var result = 0
        for i in 0..<n {
            if arr[i] == target {
                result = i+1
                break
            }
        }
        return result
    }
    let (n,target) = (Int(input[0])!,input[1])
    let arr = readLine()!.split(separator:" ").map{String($0)}
    print(sequential_search(n, target, arr))
}
solution()
```
데이터가 N개일 때 N번 비교연산을 하므로 공간복잡도는 O(N)이다.   
   
## 이진 탐색: 반으로 쪼개면서 탐색하기
본론인 이진탐색으로 넘어가자.   
이진 탐색은 배열 내부의 데이터가 이미 정렬되어있어야 사용할 수 있는 알고리즘이다.   
데이터가 무작위일떄는 사용할 수 없지만, 이미 정렬되어있다면 빠르게 찾을 수 있다.   
탐색 범위를 절반으로 좁혀가며 데이터를 탐색하는 특징이 있다.   
시작점, 끝점, 중간점 이 3개의 변수를 사용해 탐색한다.   
0 2 4 6 8 10 12 13 16 18   
위의 이미 정렬되어 있는 리스트가 있을 때 4인 원소를 찾는 방법은 이렇다.   
시작점은 0 끝점은 18 두 지점을 합친후 반으로 나눈것이 중간점이다.   
중간점이 실수일때는 소수점 이하를 버린다.   
시작점이 0, 끝점은 18, 중간점은 8이다.   
중간점 8과 찾아야하는 값 4를 비교한다.   
중간점이 더 크므로 중간점 이후의 값은 비교할 이유가 없다.   
끝점을 18에서 중간점 8 바로 전인 6으로 옮긴다.
위의 과정을 반복해 결과값을 찾아내는 구조이다.   
전체 데이터의 개수는 10개이지만 총 3번의 탐색으로 원소를 찾을 수 있었다.   
따라서 시간복잡도는 O(logN)이다.   
절반씩 데이터가 줄어들도록 만든다는 점에서 앞서 다룬 퀵 정렬과 공통점이 있다.   
   
위 이진탐색 알고리즘을 구현하는 방법에는 2가지 방법이 있는데 하나는 재귀함수를 이용하는 것이고,   
다른 하나는 반복문을 이용하는 방법이다.   
먼저 재귀함수를 이용해 구현해보자.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,target) = (input[0],input[1])
    let arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    
    func binary_sarch(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int?{
        if start > end { return nil }
        var mid: Int = (start + end) / 2
        
        if arr[mid] == target {
            return mid
        }else if arr[mid] > target {
            return binary_sarch(arr, target, start, mid - 1)
        } else {
            return binary_sarch(arr, target, mid + 1, end)
        }
    }
    let result = binary_sarch(arr, target, 0, n-1)
    if result == nil {
        print("원소가 존재하지 않습니다.")
    } else {
        print(result!+1)
    }
}
solution()
```
   
반복문으로 구현   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,target) = (input[0],input[1])
    let arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    
    func binary_sarch(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int?{
        var end = end
        var start = start
        
        while start <= end {
            var mid: Int = (start + end) / 2
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return nil
    }
    
    let result = binary_sarch(arr, target, 0, n-1)
    if result == nil {
        print("원소가 존재하지 않습니다.")
    } else {
        print(result!+1)
    }
}
solution()
```
이진 탐색알고리즘을 여러번 입력하여 자연스럽게 외워야 할 필요가 있다.   
이진 탐색의 원리는 다른 알고리즘에서도 폭 넓게 적용되는 원리와 유사하기 떄문에 매우 중요하다.   
높은 난이도의 다른 문제에서는 이진탐색 알고리즘에 다른 알고리즘을 함께 사용해 풀어야 하는 경우도 존재한다.   
더불어 코딩테스트의 이진 탐색 문제는 탐색 범위가 큰 상황에서의 탐색을 가정하는 문제가 많다.   
만약 탐색 범위가 2,000만을 넘어가면 이진탐색으로 접근할 필요가 있을 수 있다.   
O(logN)의 속도를 내야 문제를 풀 수 있는 경우가 대다수 일것이기 때문이다.   
   
## 트리 자료구조
이진 탐색은 전제 조건이 데이터 정렬이다.   
데이터베이스는 내부적으로 대용량 데이터 처리에 적합한 트리 자료구조를 이용하여 향상 데이터가 정렬되어 있다.   
따라서 데이터베이스에서의 탐색은 이진 탐색과는 조금 다르지만, 유사한 방법을 사용해 탐색이 항상 빠르게 수행하도록 설계되어 있다.   
그렇다면 트리 자료구조가 무엇인지 간단하게 알아보자.   
트리 자료구조는 노드와 노드의 연결로 표현하며 앞서 그래프를 다룰 때 언급했던 노드와 동일하다.   
트리 자료구조는 몇가지 주요한 특징이 있는데   
1. 부모 노드와 자식 노드의 관계로 표현된다.   
2. 트리의 최상단 노드를 루트 노드라고 한다.   
3. 트리의 최하단 노드를 단말 노드라고 한다.   
4. 트리에서 일부를 떼어내도 트리 구조이며 이를 서브 트리라고 한다.   
5. 트리는 파일 시스템과 같이 계층적이고 정렬된 데이터를 다루기에 적합하다.   
정리하자면 큰 데이터를 처리하는 소프트웨어는 대부분 데이터를 트리 자료구조로 저장해서 이진탐색과 같은 탐색기법을 이용해 빠르게 탐색한다.   
로 정리할 수 있다.   

## 이진 탐색 트리
그렇다면 어떤 방식으로 항상 이진 탐색이 가능한건지 알아보도록 하자.   
   
<img width="386" alt="스크린샷 2023-05-18 오후 11 54 51" src="https://github.com/ww5702/Coding_Test/assets/60501045/a14a1ca4-b8cb-4098-8528-7e6cb1367ad4">   
   
보통 이진 탐색 트리는 이 그림과 같은데 모든 트리가 다 이진 탐색 트리는 아니다.   
이진 탐색 트리는 다음과 같은 특징을 가진다.   
1. 부모노드보다 왼쪽 자식 노드가 작다.   
2. 부모노드보다 오른쪽 자식 노드가 크다.   
위 그림에서도 알 수 있듯이 왼쪽 자식노드 (17) < 부모 노드 (30) < 오른쪽 자식 노드 (48) 가 성립해야지 이진 탐색 트리라고 할 수 있다.   
이진탐색트리가 미리 구현되어 있다고 가정하고, 데이터를 조회하는 과정만 살펴보자.   
찾는 원소가 37일때,   
루트 노드부터 방문하게 되어 '30'을 방문한다.   
왼쪽 자식 노드는 '30'이하이므로 왼쪽에 있는 모든 노드는 확인할 필요가 없다. 따라서 오른쪽 노드를 방문한다.   
오른쪽 자식 노드인 '48'이 이번에는 부모 노드이다.   
'48'보다 찾는 원소값인 '37'보다 크므로 오른쪽 자식노드는 '48'이상들만 있으므로 확인할 필요가 없다.   
'37'을 찾는다.   
