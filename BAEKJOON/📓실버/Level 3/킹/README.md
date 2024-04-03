단순한 구현문제이다.   

```
import Foundation
// 좌표 typealias
typealias Position = (Int, Int)

// String을 아스키 코드로
extension String {
    func toNum() -> Int {
        Int(Character(self).asciiValue! - Character("A").asciiValue!) + 1
    }
}
// 아스키 코드를 String으로
extension Int {
    func toString() -> String {
        String(Character(UnicodeScalar(UInt8(self) + Character("A").asciiValue! - 1)))
    }
}
// 입력에 따른 Position의 변화
func move(_ command: String, _ p: Position) -> Position {
    switch command {
    case "R": return (p.0 + 1, p.1)
    case "L": return (p.0 - 1, p.1)
    case "B": return (p.0, p.1 - 1)
    case "T": return (p.0, p.1 + 1)
    case "RT": return (p.0 + 1, p.1 + 1)
    case "LT": return (p.0 - 1, p.1 + 1)
    case "RB": return (p.0 + 1, p.1 - 1)
    case "LB": return (p.0 - 1, p.1 - 1)
    default: return (0, 0)
    }
}
// 체스판 안에 위치하는지 확인하는 함수
func isValid(_ p: Position) -> Bool {
    p.0 >= 1 && p.0 <= 8 && p.1 >= 1 && p.1 <= 8
}

func solution(){
    // 입력 받기 (k와 s는 글자를 분리해서 좌표로 받기 위해 map 사용)
    let input = readLine()!.split(separator: " ")
    let k = input[0].map { String($0) }, s = input[1].map { String($0) }, N = Int(input[2])!

    // 입력을 좌표로 표현
    var king = (k[0].toNum(), Int(k[1])!)
    var stone = (s[0].toNum(), Int(s[1])!)

    for _ in 0..<N {
        let command = readLine()!
        let newKing = move(command, king)
        
        // king이 밖으로 나가면 이동 x
        guard isValid(newKing) else { continue }
        
        // king과 stone이 같은 위치라면 stone 이동
        if newKing == stone {
            let newStone = move(command, stone)
            // stone이 밖으로 나가면 이동 x
            guard isValid(newStone) else { continue }
            stone = newStone
        }
        
        king = newKing
    }

    // 다시 숫자를 문자열로 바꾸어서 출력
    print(king.0.toString() + "\(king.1)")
    print(stone.0.toString() + "\(stone.1)")
}
solution()

```


```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{String($0)}
    let (k,s,n) = (Array(input[0].map{String($0)}),Array(input[1].map{String($0)}),input[2])
    //print(Int(UnicodeScalar(k[0])!.value))
    var king = (Int(UnicodeScalar(k[0])!.value), Int(k[1])!)
    var stone = (Int(UnicodeScalar(s[0])!.value), Int(s[1])!)
    //print(king, stone)
    // 65 ~ 73 H
    for _ in 0..<Int(n)! {
        let move = String(readLine()!)
        var tempKing = king
        var tempStone = stone
        //print(move)
        if (move == "R") {
            tempKing.0 += 1
            if (tempKing == tempStone) {
                tempStone.0 += 1
            }
            if (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "L") {
            tempKing.0 -= 1
            if (tempKing == tempStone) {
                tempStone.0 -= 1
            }
            if (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "B") {
            tempKing.1 -= 1
            if (tempKing == tempStone) {
                tempStone.1 -= 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "T") {
            tempKing.1 += 1
            if (tempKing == tempStone) {
                tempStone.1 += 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "RT") {
            tempKing.0 += 1
            tempKing.1 += 1
            if (tempKing == tempStone) {
                tempStone.0 += 1
                tempStone.1 += 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) &&
                (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "LT") {
            tempKing.0 -= 1
            tempKing.1 += 1
            if (tempKing == tempStone) {
                tempStone.0 -= 1
                tempStone.1 += 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) &&
                (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "RB") {
            tempKing.0 += 1
            tempKing.1 -= 1
            if (tempKing == tempStone) {
                tempStone.0 += 1
                tempStone.1 -= 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) &&
                (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        } else if (move == "LB") {
            tempKing.0 -= 1
            tempKing.1 -= 1
            if (tempKing == tempStone) {
                tempStone.0 -= 1
                tempStone.1 -= 1
            }
            if (1...8).contains(tempKing.1) && (1...8).contains(tempStone.1) &&
                (65...73).contains(tempKing.0) && (65...73).contains(tempStone.0) {
                king = tempKing
                stone = tempStone
            }
        }
//        print(king)
//        print(stone)
    }
    var resultKing = "\(String(UnicodeScalar(king.0)!))\(king.1)"
    var resultStone = "\(String(UnicodeScalar(stone.0)!))\(stone.1)"
    print(resultKing)
    print(resultStone)
}
solution()

```
