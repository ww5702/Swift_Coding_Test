주어진 값들을 없앴다가 다시 돌려놓는게 시간이 오래걸릴것같아   
해당 index를 기준으로 없애지않고 올라가거나 내려갈때 이미 삭제한항이라면 +1을 해주는   
방식으로 진행해보았다.   

```
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    /*
    삭제된 인덱스를 그대로 저장해두었다가
    z명령어를 받으면 해당 값들은 다시 빼주는 형식으로 진행한다
    
    */
    
    var delete: [Int] = []
    var result = Array(repeating:"O", count : n)
    var nowIndex = k
    for i in 0..<cmd.count {
        //print("지금",nowIndex)
        var now = cmd[i]
        // 삭제된 행이 없을때 Z가 주어지지는 않는다
        if now == "Z" {
            //print("되돌리기",delete)
            let index = delete.removeLast()
            result[index] = "O"
        }
        var commend = now.components(separatedBy:" ")
        let move = commend[0]
        var value = ""
        if commend.count > 1 { value = commend[1] }
        // 삭제
        if move == "C" {
            result[nowIndex] = "X"
            delete.append(nowIndex)
            // 삭제후 바로 밑에항 선택
            var temp = 1
            while true {
                // 만약 삭제된 행이 가장 마지막행인 경우 윗항으로
                if nowIndex+temp >= n {
                    if !delete.contains(nowIndex-temp) {
                        nowIndex -= temp
                        break
                    }
                    temp += 1
                } else {
                    if !delete.contains(nowIndex+temp) {
                        nowIndex += temp
                        break
                    }
                    temp += 1
                }
                
            }
            //print("삭제된후 index",nowIndex)
        }
        
        // 표의 범위를 벗어나는 이동은 주어지지않으니
        if move == "D" {
            let plus = delete.filter{$0 > nowIndex && $0 <= nowIndex+Int(value)!}.count
            nowIndex += (Int(value)!+plus)
        } else if move == "U" {
            let plus = delete.filter{$0 < nowIndex && $0 >= nowIndex-Int(value)!}.count
            nowIndex -= (Int(value)!+plus)
        }
    }
    return result.joined()
}
```
하지만 배열로 해당풀이를 한다면 결국 O(n)이 걸리기에 시간초과가 난다   
따라서 링크드 리스트를 이용해야 한다.   
링크드 리스트는 처음이라 생소했다.   
```
import Foundation
class Node {
    var up: Node?
    var down: Node?
    var index: Int = 0
    
    init(up: Node?, down: Node?, index: Int) {
        self.up = up
        self.down = down
        self.index = index
    }
}
func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    /*
    next(down), prev(up)가 필요하기에 자기참조를 해야한다.
    따라서 struct가 아닌 class를 이용해 풀이해야한다.
    */
    var result = Array(repeating: "O", count: n)
    
    // 링크드 리스트를 구현해준다.
    // 각 index들의 위 아래를 정해준다.
    var linkedList: [Node] = []
    for i in 0..<n {
        linkedList.append(Node(up: nil, down: nil, index: i))
    }
    linkedList[0].down = linkedList[1]
    for i in 1...n-2 {
        linkedList[i].up = linkedList[i-1]
        linkedList[i].down = linkedList[i+1]
    }
    linkedList[n-1].up = linkedList[n-2]
    // for item in linkedList {
    //     print("item: \(item.index) / up: \(item.up?.index) / down: \(item.down?.index)")
    // }
    
    // 시작위치
    var now: Node = linkedList[k]
    // 삭제한 node 즉 무시할 node
    var delete: [Node] = []
    
    for command in cmd {
        let cmdArray = command.components(separatedBy:" ")
        // 명령어에 따른 위치변경 및 행동
        switch cmdArray.first {
            case "U":
            let value = Int(cmdArray[1])!
            // 현재 index를 올려주는 과정
            // 올리는 도중 위 index가 삭제되어있다면 점프된다.
            for _ in 0..<value {
                now = now.up!
            }
            case "D":
            let value = Int(cmdArray[1])!
            // 현재 index를 올려주는 과정
            // 올리는 도중 위 index가 삭제되어있다면 점프된다.
            for _ in 0..<value {
                now = now.down!
            }
            case "C":
            result[now.index] = "X"
            // 점프해야할 linkedList 추가
            delete.append(now)
            // 삭제한 현재 index의 윗index가 (down)아래 인덱스를 고르는 현상이 벌어지면 현재 index의 down으로 가게된다.
            // 반대로 현재 삭제한 index의 밑 index가 위로 올라가려는 행동을 한다면 하나 더 올려준다.
            now.up?.down = now.down
            now.down?.up = now.up
            // 만약 삭제한 index가 마지막행이라면 하나 위로
            // 마지막이 아니라면 하나 밑으로
            if now.down == nil {
                now = now.up!
            } else {
                now = now.down!
            }
            
            case "Z":
            let top = delete.popLast()!
            result[top.index] = "O"
            // 다시 돌려준 index의 위 아래의 node들의 up,down을 본인으로 바꿔준다.
            top.up?.down = top
            top.down?.up = top
            break
            default:
            break
        }
    }
    
    return result.joined()
    
}
```
