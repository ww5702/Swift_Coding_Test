# String, 문자열의 count보다 isEmpty가 빠른 이유
   
보통 문자열이나 set, string, array등의 컬렉션 타입이 비었을때를 체크할 때, 아래와 같이 사용한다.   
```
let input = ""
if input.count == 0 {
    print("비었습니다")
}
```
하지만 위보다 더 효율적인 코드가 존재한다.   
   
```
let input = ""
if input.isEmpty {
    print("비었습니다.")
}
```

count보다 isEmpty가 더 빠른 장점을 가지고 있다.   
그렇다면 그 이유는 무엇일까?   
   
Swift의 문자열에서 count 를 사용할 경우 시간복잡도는 O(n)이 된다.   
문자열 하나하나가 복잡한 구조의 값으로 되어있어 길이를 알기 위해 인덱스로부터 한단계 한단계 계산하기 때문이다.   
   
하지만 isEmpty는 단 한번의 체크로 true나 false를 반환할 수 있다.   
즉 시간복잡도는 O(1)를 나타낸다.   
