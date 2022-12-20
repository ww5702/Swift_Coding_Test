# Coding_Test

Foundation   
원시 데이터 타입(String, Int, Double), 컬렉션 타입(Array, Dictionary, Set) 기본적인 기능을 관리.   
데이터 타입, 날짜 및 시간 계산, 필터 및 정렬, 네트워킹 등의 기본 기능 제공.   
iOS뿐만 아니라 macOS, watchOS, tvOS 등 모든 애플 SDK에서 사용된다.     
   
   
readLine()   
swift에서 입력을 받는 메서드이다.   
readLine()은 입력을 모두 optional String형으로 처리하기 때문에 또 다른 처리가 필요하다.   
또한 readLine()은 EOF 즉 엔터를 치면 끝인 문구이다.   
정수를 찍기 위해서는 Int(input[0])   
언래핑(!)하는 이유는 nil이 할당될수도 있기 때문.   
readLine() -> Optional<String>   
readLine()! -> String   
Int(readLine()!) -> Optional<Int>   
Int(readLine()!)! -> Int   
   
Map,Filter,Reduce   
Swift의 표준 배열 라이브러리에는 map, filter, reduce라는 세가지 기능을 제공한다.   
map   
클로저로 각 항목들을 반영한 결과물을 가진 새로운 배열을 반환한다.
```
func map<U>(transform: (T) -> U) -> Array<U>
```
  


## BAEKJOON
