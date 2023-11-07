당연히 1000개의 행열에 250,000개의 명령이라 반복문을 사용한다면   
시간초과가 날것 같았다.   
테스트케이스들은 전부 통과했으나 효율성 검사도 있었기에 실패판정   
```
import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    /*
    skill 2차원배열의 순서
    type / 1 = 공격, 2 = 회복
    (r1,c1) 부터 (r2,c2)까지 degree만큼 up down
    효율성까지 존재하는 문제라 당연히 반복문을 사용한다면 안되지않을까 생각중
    
    */
    var board = board
    //print(board)
    for s in skill {
        let type = s[0]
        let damage = s[5]
        let (x1,y1) = (s[1],s[2])
        let (x2,y2) = (s[3],s[4])
        // 공격이라면
        if type == 1 {
            for i in x1...x2 {
                for j in y1...y2 {
                    board[i][j] -= damage
                }
            }
        } else {
        // 회복이라면    
            for i in x1...x2 {
                for j in y1...y2 {
                    board[i][j] += damage
                }
            }
        }
    }
    
    
    return board.flatMap{$0}.filter{$0 > 0}.count
}
```
누적합을 이용한 풀이
```
import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    /*
    skill 2차원배열의 순서
    type / 1 = 공격, 2 = 회복
    (r1,c1) 부터 (r2,c2)까지 degree만큼 up down
    효율성까지 존재하는 문제라 당연히 반복문을 사용한다면 실패
    
    풀이의 도움을 받을수밖에 없었다. 
    풀이는 이렇다
    먼저 board와 같은 크기의 2차원배열을 만든다
    다음 더하거나 빼줘야 하는 수치만큼 누적합을 만든다
    만약 0~3까지 -2만큼 해주고싶다면
    -2 0 0 0 2 라고 지정해주는것이다
    앞에서부터 누적합을 하게 된다면 
    -2 -2 -2 -2 0 이 된다.
    
    여기까지 한다면 O(N)과 차이가 없지만
    위에서 아래로 왼쪽에서 오른쪽으로 누적합을 한다면 달라진다
    입출력 예1번의 첫번째를 예시로 든다면
    -4 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
     0 0 0 0 0
    이 된다.
    2번째 예시를 추가해준다면
    -4 0 0 0 0
     0 0 0 0 0
    -2 0 0 0 2
     2 0 0 0 -2
     0 0 0 0 0
    3번째 예시를 추가해준다면
    -4 0 0  0  0
     2 0 -2 0  0
    -2 0 0  0  2
     2 0 0  0 -2
    -2 0 2  0  0
    4번째 예시 추가
    -4 -1  0  0  1
     2  0 -2  0  0
    -2  0  0  0  2
     2  0  0 0 -2
    누적합
    -4 -5 -5 -5 -4
     2  2  0  0  0
    -2 -2 -2 -2  0
     2  2  2  2  0
    아래로
    -4 -5 -5 -5 -4
    -2 -3 -5 -5 -4
    -4 -4 -7 -7 -4
    -2 -3 -5 -5 -4
    
    즉 원하는 곳부터 어디까지 에서 
    (x1,y1) 에 n을 (x1,y2+1)에 -n을
    (x2+1,y1) 에 -n을 (x2+1,y2+1)에 n을
    해준다.
    
    */
    var newboard = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    let n = board[0].count
    let m = board.count
    for s in skill {
        let type = s[0]
        let (x1,y1) = (s[1],s[2])
        let (x2,y2) = (s[3],s[4])
        // 공격일때와 회복일때를 나눠주는 조건문
        if type == 1 {
            newboard[x1][y1] -= damage
            // 맵을 넘어가지 않는다면
            if y2+1 < n {
                newboard[x1][y2+1] += damage
            }
            if x2+1 < m {
                newboard[x2+1][y1] += damage
            }
            if x2+1 < m && y2+1 < n {
                newboard[x2+1][y2+1] -= damage
            }
             
        } else {
            newboard[x1][y1] += damage
            // 맵을 넘어가지 않는다면
            if y2+1 < n {
                newboard[x1][y2+1] -= damage
            }
            if x2+1 < m {
                newboard[x2+1][y1] -= damage
            }
            if x2+1 < m && y2+1 < n {
                newboard[x2+1][y2+1] += damage
            }
        }
        //print(newboard)
    }
    
    // 누적합 왼->오
    for i in 0..<m {
        var sum = newboard[i][0]
        for j in 1..<n {
            sum += newboard[i][j]
            newboard[i][j] = sum
        }
    }
    // 누적합 위->아래
    for j in 0..<n {
        var sum = newboard[0][j]
        for i in 1..<m {
            sum += newboard[i][j]
            newboard[i][j] = sum
        }
    }
    //print(newboard)
    
    var resultBoard = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<m {
        for j in 0..<n {
            resultBoard[i][j] = board[i][j] + newboard[i][j]
        }
    }
    //print(resultBoard)
    
    return resultBoard.flatMap{$0}.filter{$0 > 0}.count
}
```
