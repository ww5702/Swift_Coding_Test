# 소수 판별법
소수 판별에는 여러가지 방법이 있다.   
정말 단순하고 간단하게 생각하면 2부터 n까지의 수까지 탐색하며 나누어 떨어지는지 확인하는 것이다.
```
func isPrime(_ checkNumber: Int) -> Bool {
  let num = checkNumber
  for i in 1...num {
    if checkNumber % i == 0 {
      return false
    }
  }
}
```
하지만 당연하게도 수가 크다면 시간초과가 발생할 것이다.(O(N))   
여기서 한 단계 더 나아간다면 모든 수를 체크하는 것이 아닌 제곱근까지만 체크하는 것이다.   
소수가 아닌 수들은 인수가 존재하고, 인수는 곱의 쌍으로 존재하기 때문이다.   
만약에 30이라면 3 x 10으로 나눠지는데 3으로도 나눠진다면 10으로는 당연히 나눠지는 원리를 응용하는것이다.   
```
func isPrime(_ checkNumber: Int) -> Bool {
  let num = Int(sqrt(Double(checkNumber)))
  for i in 2...num {
    if checkNumber % i == 0 { return false }
  }
}
```
이렇게만 구현해도 어느정도 수까지는 전부 연산이 가능하다.(O(sqrt(N))   
하지만 여기서 더 수가 커진다면 '에라토스테네스의 체'라는 개념을 사용해야 한다.   

## 에라토스테네스의 체
2부터 시작해서 소수들의 배수를 해당 구간에서 제거하는 방식으로 작업하며   
남는 모든 수가 소수가 된다.   
예를 들어 120 이하의 수 중 소수인 것을 판별한다면   
해당 수의 제곱근 10.xxx < 11이기에 10 이전의 수 중 소수의 배수들을 제거해준다   
2,3,5,7을 제외한 2,3,5,7 배수들을 제거해준다면 소수들만 남게 된다.   
   
   
주어진 숫자까지 소수 개수 구하기   
```
var num = 1000
var numArray = Array(repeating: 0, count: num+1)
for i in 2...num {
  numArray[i] = i
}
for i in 2...num {
  if numArray[i] == 0 { continue }
  // 해당 2,3,5,7 등의 소수 본인을 제외한 그 다음수부터 배수(i)로 늘어나면서 배수들 제거
  for j in stride(from : i+1, through : num, by : i) {
    
  }
}
for i in 2...num {
  if numArray[i] != 0 {
    print(numArray[i], terminator:" ")
  }
}

혹은
func isPrime(_ n : Int) -> Int {
  var isPrime = Array(repeating: true, count: n+1)
  isPrime[0] = false
  isPrime[1] = false
  // 0,1은 소수가 아니고, 2,3은 소수이니 패스
  if n >= 4 {
    for i in 2...Int(sqrt(Double(n))) {
    // 해당 수 전까지의 배수
      for j in 2...n/i {
      isPrime[i*j] = false
      }
  }
}
  let result = isPrime.filter{$0}.count
  return result
}
```
