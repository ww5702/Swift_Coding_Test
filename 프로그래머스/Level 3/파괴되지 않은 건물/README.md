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
