# [비트마스크](https://github.com/ww5702/Swift_Coding_Test/blob/main/Algorithm/%EB%B9%84%ED%8A%B8%EB%A7%88%EC%8A%A4%ED%82%B9.md)를 배우고, 동적 계획법에 적용해 봅시다. 그 후에는 선형이 아니라 원형으로 구성된 문제를 다룹니다.	

## 11723 [집합](https://www.acmicpc.net/problem/11723)
단순한 반복문으로 풀이한다면 시간초과가 발생한다.   
```
import Foundation
func solution(){
    let m = Int(readLine()!)!
    var s = Array(repeating: 0, count: 21)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{String($0)}
        //print(input[0])
        switch input[0] {
        case "add":
            s[Int(input[1])!] = 1
            break
        case "remove":
            s[Int(input[1])!] = 0
            break
        case "check":
            print(s[Int(input[1])!] == 1 ? 1 : 0)
            break
        case "toggle":
            if s[Int(input[1])!] == 1 {
                s[Int(input[1])!] = 0
            } else {
                s[Int(input[1])!] = 1
            }
            break
        case "all":
            s = Array(repeating: 1, count: 21)
            break
        case "empty":
            s = Array(repeating: 0, count: 21)
            break
        default:
            break
        }
    }
}
solution()

```
input[1]을 먼저 1<< 로 띄운다.   
예를들어 3이라면 1000이 된다.   
그리고 해당값과 기존 bit값을 &이냐 |이냐로 비교해주는 과정이다.   
만약 이미 5가 들어가있어 100000이라면   
100000      
  1000   
이 두 숫자를 add라면 | (즉 둘중 하나라도 1이라면 1)   
remove라면 1000을 ~로 바꾼다음   
101000   
  0111   
두 숫자가 둘다 1이 아니라면 0으로 바꿔주는 연산을 치룬다.   
check라면 &를 통해 해당값이 둘다 1이라면 1   
아니라면 0   
toggle이라면 ^를 통해 해당값을 반전시켜준다.   
all이라면 ~0 즉 전부 1인 문자를 통해 |연산을 통해 전부 1로 바꿔준다.   
empty라면 0을 &를 통해 전부 0으로 변환시켜준다.   

비트 연산자로 풀이하였으나 또 다시 시간 초과 발생   
비트 연산자로 풀이하여도 틀린걸 보니 입출력 코드를 FileIO 클래스로 만들어   
시간을 줄여야 가능한 문제 같다.   

```
import Foundation
func solution(){
    let m = Int(readLine()!)!
    var bit = 0
    var result = ""
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{String($0)}
        //print(input[0])
        if input[0] == "add" {
            bit |= (1<<Int(input[1])!)
        } else if input[0] == "remove" {
            bit &= ~(1 << Int(input[1])!)
        } else if input[0] == "check" {
            if (bit & (1 << Int(input[1])!) != 0) {
                print(1)
            } else {
                print(0)
            }
        } else if input[0] == "toggle" {
            bit ^= (1 << Int(input[1])!)
        } else if input[0] == "all" {
            bit |= (~0)
        } else if input[0] == "empty" {
            bit &= 0
        }
//        print(bit)
//        print(String(bit, radix: 2))
    }
}
solution()

```
심지어 result를 바로바로 출력하는것이 아닌    
result String에 저장하여 출력해주었어야 했다.   
개인적으로 이런 문제는 swift에게 너무 가혹하다.   
```
import Foundation
class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}
func solution(){
    let file = FileIO()
    var m = file.readInt()
    var bit = 0
    var result = ""
    //print(file)
    while m != 0 {
        switch file.readStirngSum() {
        case 297:
            bit |= (1 << file.readInt())
        case 654:
            bit &= ~(1 << file.readInt())
        case 510:
            if bit & (1 << file.readInt()) != 0 {
                result.append("1\n")
            } else {
                result.append("0\n")
            }
        case 642:
            bit ^= (1 << file.readInt())
        case 313:
            bit |= (~0)
        case 559:
            bit &= 0
        default:
            break
        }
        
        m -= 1
    }
    print(result)
}
solution()

```
