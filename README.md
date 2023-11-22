# Coding_Test
   
전체 데이터 100만개 이하라면 완전 탐색을 사용하기 적절하다.  
큰 문제룰 작은 문제로 나눌 수 있다/작은 문제에서 구한 정답은 그것을 포함하는 큰 문제에서도 동일하다.   
-> 다이나믹 프로그래밍   

그래프에 가중치가 없다면 (1)이라면 -> bfs   
가중치가 있다면 -> 다익스트라   
```
그래프 저장 [()()], [()()()], [()] 와 같은 형식   
var graph = Array(repeating: [(Int,Int)](), count: n+1) 
그래프 [[],[],[],[]] 와 같이 배열 안에 배열을 저장
var graph = [[Int]](repeating: [Int](), count: n + 1)

그래프에 [Int,[[Int]]] = [:] 저장
선언할때 append를 바로 하면 없는 값이라 저장이 안됨 따라서 default로 초기값 설정
map[value[0],default:[]].append([value[1],value[2]])

12345 를 [1,2,3,4,5]로 변형
let n = Array(readLine()!).map{Int(String($0))!}

readLine()!.split(separator:" ").map{ Int(String($0.reversed()) ) ?? 0}   
에서 ?? 0 쓰는 이유   
https://babbab2.tistory.com/20

"X,3,2,3,X","X,2,2,2,X" 등과 같은 String계열 배열을
하나씩 잘라 Character 계열로 배열을 다시 구축 
let graph = maps.reduce(into: [[Character]]()) {result, map in
                                                  result.append(Array(map))
                                                  }
   
flatMap은 중첩된 배열을 제거하고 평평한 배열을 return 해준다.
let numbers = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]

let flatMapped = numbers.flatMap { $0 }
print(flatMapped)
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


<String>
확장으로 string을 map하여 사용하기
extension String {
    subscript(_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}
let str = "POOOP"
str[0] // "P"
위와 같이 나온다.
---
string안의 단어중 arr[i]와 같다면 String(i)로 바꿔주기
str = str.replacingOccurrences(of: arr[i], with: String(i))
---
string 특정 문자 제거하고 합쳐서 출력
print(today.split(separator:".").joined())
print(today.components(separatedBy:".").joined())
reduce를 사용해도 합쳐서 출력할 수 있다.
str.reduce(""){$0+"\($1)"})
str의 초기값은"", 각 원소들을 붙여서 string으로 반환  
---
hello의
string.startIndex는 0 / string.endIndex는 5이다.
즉 endIndex는 길이 전체를 반환한다는 것을 알 수 있다.
string[string.startIndex] = h
string[string.endIndex] = error
중간중간의 개별 index 접근하기 = offsetBy
string[string.index(startIndex, offsetBy: 0)] = h
string[string.index(startIndex, offsetBy: 4)] = o
string[string.index(endIndex, offsetBy: -1)] = o
index = str.index(startIndex, offSetBy: i, limitedBy: str.endIndex) ?? str.endIndex
-> index는 str의 0번째 index에서 i만큼 떨어진 거리의 인덱스이다.
하지만 반복문에 의해 i가 커지다 endIndex를 넘어서면 endIndex로 반환된다
num.index(after: middleIndex) = middleIndex의 변수 +1을 지정
---
let actions = ["Enter":"님이 들어왔습니다.", "Leave":"님이 나갔습니다."]
위와 같이 몇개 없는 문구들은 따로 지정하여
print(actions[0]) // 님이 들어왔습니다.
와 같이 매크로로 사용해줄 수 있다.
----
String(repeating:"가", count: 2)
가가
Array뿐만 아니라 앞에 String을 사용할 수 있다.
--------
두자리로 표현하기 (시간, 분 관련일때 사용하기 유리)
String(foramt: "%02d", number)
7 -> 07
                                               
bool로 array선언
var visited = Array(repeating:Array(repeating: Bool(), count: col), count: row)
var visited = [[Bool]](repeating:[Bool](repeating:false, count: col), count: row)
둘중 하나로 사용 가능

<2차원 배열>
2차원 배열 조건 넣어서 정렬
arr.sorted{ $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]}
[0]을 기준으로 오름차순, 2순위로 [1]을 기준으로 오름차순 

["ABC","ABC","ABC"] 를 2차원배열로 하나씩 넣기
let x = Array(arr[0].map{String($0)})을
newArr.append(x)의 형식으로 넣는다.

두 배열을 합쳐 각각의 index값을 더한뒤 출력
return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
zip을 활용하여 두 배열의 값들을 map해준다.

allSatisfy를 통해 배열을 전부 확인해볼수있다.
let answerA = arrayB.allSatisfy { gcdA != 1 && $0 % gcdA != 0 } ? gcdA : 0


<딕셔너리>
var dict = ["E": 1, "S" : 1, "W" : -1, "N" : -1]
일때 dict[0]! = 1, dict[2]! = -1 이다.
var rePrivacies = [String:String]()

두개의 배열을 합쳐 dictionary 초기화
let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))


딕셔너리 input
var best: [Int:Int] = [:]
    for i in 0..<enemy.count {
        best[i] = enemy[i]
    }

딕셔너리 고차함수 적용
var arr = comb.map{(val1: String, val2: Int) -> Int in return val2+1 }
return arr.reduce(1){$0*$1}-1

<Set>
이런 형식으로 배열의 중복을 제거해줄 수도 있다.   
var report = Set<String>(report)


["ABC","AAA"]를   
Array(keymap[0].map{String($0)}) -> ["A","B","C"] 로 나누는 것
let keymap = keymap.map{$0.map{String($0)}} -> ["A","B","C"],["A","A","A"] 나누고 배열로 다시 저장

영단어 UnicodeScalar로
var word = Int(UnicodeScalar(i)!.value)
다시 영어로
String(UnicodeScalar(word)!)
A = 65 a = 97
Z = 90 z = 122
   

if문 한줄에
var msg = number >= 20 ? "higger" : "lesser"

stride 반복문
for i in stride(from: 0, to: 5, by: 1) {
    print(i) // 0, 1, 2, 3, 4
}

for i in stride(from: 0, through: 5, by: 1) {
    print(i) // 0, 1, 2, 3, 4, 5
}



~= 연산자
if 0..<10 ~= n {
  n *= 10
}
만약 n이 0~10 안에 들어갔다면 반복문 수행
!을 통해 반대도 가능

배열 범위삭제 removeSubrange
a.removeSubrange(1..<3)

배열 removeFirst popFirst
removeFirst는 그냥 사용하면 되지만 시간복잡도 O(N)
var q1 = queue1[queue1.startIndex...]
로 바꾼다면
q1.popFirst() 사용 가능

guard let else return
if let
if let은 지역안에서밖에 활용을 못하는 단점이 있다.

진법 변환기
result = String(value,radix: 2)
value값을 raidx의 값 진법으로 바꿔줄 수 있다.

```
구현 문제가 가장 빨리 풀 수 있으면서 풀이가 어렵게 구성될 수 있다.   
함수를 잘 이용해 필요한 요구기능들을 각각 구현   

   
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
   
## 튜플
튜플은 지정된 데이터의 묶음 이라고 표현 할 수있다.   
```
var person : (String, Int, Double) = ("asdf", 100, 180.5)

// 인덱스를 통해서 값을 빼 올 수 있다.
print(person.0) // asdf
print(person.1) // 100

person.0 = "dd"
print(person.0) // dd
```
또한 별칭을 사용해 사용할 수 있다.
```
var person : (name : String, age : Int, height : Double) = ("asdf", 100, 180.5)
print(person.name)   // asdf
print(person.age)    // 100
 
person.age = 99
print(person.age)    // 99
   
```

2023.07.27 야곰커리어스타터 사전과제 step 0, 1   
2023.07.28 야곰커리어스타터 사전과제 step 2, 3   
