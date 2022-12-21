# Coding_Test

## Foundation   
원시 데이터 타입(String, Int, Double), 컬렉션 타입(Array, Dictionary, Set) 기본적인 기능을 관리.   
데이터 타입, 날짜 및 시간 계산, 필터 및 정렬, 네트워킹 등의 기본 기능 제공.   
iOS뿐만 아니라 macOS, watchOS, tvOS 등 모든 애플 SDK에서 사용된다.     
   
   
## readLine()   
swift에서 입력을 받는 메서드이다.   
readLine()은 입력을 모두 optional String형으로 처리하기 때문에 또 다른 처리가 필요하다.   
또한 readLine()은 EOF 즉 엔터를 치면 끝인 문구이다.   
정수를 찍기 위해서는 Int(input[0])   
언래핑(!)하는 이유는 nil이 할당될수도 있기 때문.   
readLine() -> Optional<String>   
readLine()! -> String   
Int(readLine()!) -> Optional<Int>   
Int(readLine()!)! -> Int   
   
## Map,Filter,Reduce   
Swift의 표준 배열 라이브러리에는 map, filter, reduce라는 세가지 기능을 제공한다.   
### map   
클로저로 각 항목들을 반영한 결과물을 가진 새로운 배열을 반환한다.
```
func map<U>(transform: (T) -> U) -> Array<U>
// ex 1,2,3,4 배열을 2씩 곱해서 다시 배열로
let multipliedArray = array.map( { (value: Int) -> Int in return value * 2 } )
// 이 또한 추론으로 생략가능
let multipliedArray = array.map { $0 * 2 }
```
### Filter   
클로저로 각 항목들을 비교하여 일치하는 결과물을 가진 새로운 배열을 반환한다.   
```
func filter(includeElement: (T) -> Bool) -> Array<T>
// 홀수 값만 가지는 배열을 얻는 예제
let oddArray = array.filter( { (value: Int) -> Bool in return (value % 2 == 0) } )
// 추론 생략
let oddArray = array.filter{ $0 % 2 == 0 }
```   
### Reduce   
배열의 각 항목들을 재귀적으로 클로저를 적용시켜 하나의 값을 만든다.   
```
func reduce<U>(initial: U, combine: (U, T) -> U) -> U
// 배열의 각 항목들
array.reduce(0, { (s1: Int, s2: Int) -> Int in
    return s1 + s2
})
// 추론 생략
array.reduce(0) { $0 + $1 }
```
   

   
즉 이 코드를   
```
let numberArray = [1,2,3,4,5,6,7,8,9,10]
var sum = 0
for number in numberArray {
    sum += number
}
print(sum)
// 55
```
이렇게 바꿀 수 있다.   
```
let numberArray = [1,2,3,4,5,6,7,8,9,10]
let sum = numberArray.reduce(0) { $0 + $1 }
print(sum)
// 55
```   

## forEach
해당하는 범위내에서 전체 수를 선회하면서 탐색하는것   
순회 도중 break로 빠져나가야하는 상황이 있다면 적절하지 않다.   
하지만 전체 숫자를 확인해봐야하는 문제는 forEach가 적절하다.   

readLine()!.split(separator:" ").map{ Int(String($0.reversed()) ) ?? 0}   
에서 ?? 0 쓰는 이유 ;;
