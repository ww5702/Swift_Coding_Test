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
