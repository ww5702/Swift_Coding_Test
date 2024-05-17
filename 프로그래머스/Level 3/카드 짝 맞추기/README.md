bfs문제이지만 구현하는데 상당한 시간이 걸린 문제이다.   
먼저 현재 board상황과 현재 y,x 위치 현재 열은 카드의 유무를 담당할   
Info를 만들어준다.   
그리고 시간을 줄이기 위해 visit을 Set으로 구현하여   
만약 같은 경우의 수 즉 같은 상황의 상태가 들어온다면 추가해주지 않는다.   
     
이제 while문을 시작한다.   
먼저 방향키로 한칸씩 이동하는 좌표가 벽을 넘지 않고,   
이미 같은 형태의 경우의 수가 존재하지 않는다면(visit)   
q와 visit에 추가해준다.   
   
이제 ctrl을 누르고 방향키를 누른 경우를 추가해준다.   
이미 시작 위치가 벽이라서 한칸 이동했을때 벽이라면 추가해주지 않는다   
어차피 움직이는 경우의 수만 늘어나고 안움직인다고 하더라도   
visit의 중복제거로 걸러지기 때문이다.   
   
while문을 통해 이동하면서 board[newY][newX]가 0이 아니거나   
벽을 만나면 끊어준다.   
그리고 다시 visit을 통해 이미 저장된 경우인지 확인해보고   
q와 visit에 추가해준다.   
   
이제 카드를 열어볼 차례이다.   
만약 Info.openCard가 nil이라면 아직 카드를 안연 경우이다.   
그렇다면 현재 board[ny][nx]가 0이 아니라면 카드를 뒤집어   
q와 visit에 넣어준다.   
물론 visit을 확인해본다.   

만약 반복문을 통해 돌다 Info.openCard가 nil이 아니라면   
현재 board[ny][nx]가 Info.openCard.num과 같은지 아닌지 확인해줘야한다.   
만약 같은 카드이고, 같은 자리를 열어본것이 아니라면   
board[card.y][card.x]와 board[ny][nx]를 0으로 변경해주고,   
현재 상황을 기점으로 게임이 끝날 수 있는지 확인해보는   
isGameFinsh 함수를 실행해본다.   
bfs로 구현헀기에 가장 먼저 끝난 경우가 최단시간이다.   
   
만약 카드가 틀렸다면 현재 틀린 상황을   
visit와 q에 넣어준다.   
물론 Info의 openCard는 다시 nild의 상태로 넣어준다.   

```
import Foundation
let dy = [1,-1,0,0]
let dx = [0,0,1,-1]
var visit: Set<Info> = []
struct Card:Hashable {
    let y:Int
    let x:Int
    let num:Int
    
    init(_ y: Int, _ x: Int, _ num: Int) {
        self.y = y
        self.x = x
        self.num = num
    }
}

struct Info:Hashable{
    let board:[[Int]]
    let y:Int
    let x:Int
    let openCard:Card?
    
    init (_ board:[[Int]], _ y:Int, _ x:Int, _ openCard:Card?) {
        self.board = board
        self.y = y
        self.x = x
        self.openCard = openCard
    }
}

func isEnd(_ y: Int, _ x: Int, _ dir: Int) -> Bool {
    if (dir == 0 && y == 3) || (dir == 1 && y == 0) || (dir == 2 && x == 3) || (dir == 3 && x == 0) {
        return true
    } else {
        return false
    }
}

func isGameFinish(_ board: [[Int]]) -> Bool {
    let newBoard = Array(board.flatMap{$0})
    for num in newBoard {
        if num != 0 { return false }
    }
    return true
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    var q: [(info: Info, moveCnt: Int)] = []
    q.append((Info(board,r,c,nil), 0))
    visit.insert(Info(board,r,c,nil))
    
    while !q.isEmpty {
        let now = q.removeFirst()
        
        var nBoard = now.info.board
        let ny = now.info.y
        let nx = now.info.x
        let openCard = now.info.openCard
        let moveCnt = now.moveCnt
        //print("현재",ny,nx,openCard,moveCnt)
        
        // 방향키로 한칸만
        for i in 0..<4 {
            let newY = ny + dy[i]
            let newX = nx + dx[i]
            if !(0..<4).contains(newY) || !(0..<4).contains(newX) { continue }
            else if visit.contains(Info(nBoard, newY, newX, openCard)) { continue }
            else {
                q.append((Info(nBoard, newY, newX, openCard), moveCnt+1))
                visit.insert(Info(nBoard, newY, newX, openCard))
            }
        }
        
        // ctrl + 방향키
        for i in 0..<4 {
            var newY = ny + dy[i]
            var newX = nx + dx[i]
            
            // 이미 벽이라면 패스
            if !(0..<4).contains(newY) || !(0..<4).contains(newX) { continue }
            
            // 벽을 만나거나 새로운 카드를 만날때까지
            while nBoard[newY][newX] == 0 && !isEnd(newY,newX,i) {
                newY += dy[i]
                newX += dx[i]
            }
            
            if visit.contains(Info(nBoard, newY, newX, openCard)) { continue } else {
                q.append((Info(nBoard, newY, newX, openCard), moveCnt+1))
                visit.insert(Info(nBoard, newY, newX, openCard))
            }
        }
        
        
        // 열려있는 카드가 있을때
        if let openCard = openCard {
            //print("열려있는 카드 있음")
            //print(openCard)
            // 같은 카드이라면
            if openCard.num == nBoard[ny][nx] && !(openCard.y == ny && openCard.x == nx) {
                nBoard[openCard.y][openCard.x] = 0
                nBoard[ny][nx] = 0
                
                if isGameFinish(nBoard) {
                    return moveCnt + 1
                }
                
                visit.insert(Info(nBoard, ny, nx, nil))
                q.append((Info(nBoard,ny,nx,nil), moveCnt + 1))
            } else {
            // 카드가 틀렸다면
                if visit.contains(Info(nBoard, ny, nx, openCard)) { continue }
                else {
                    q.append((Info(nBoard,ny,nx,nil), moveCnt + 1))
                    visit.insert(Info(nBoard,ny,nx,nil))
                }
            } 
        } 
        else {
        // 새로 카드를 오픈할때
            //print("새로 카드 오픈하여 추가")
            let newOpenCard = Card(ny,nx,nBoard[ny][nx])
            //print(newOpenCard)
            // 이미 있는 경우의 수라면
            if visit.contains(Info(nBoard,ny,nx,newOpenCard)) { continue }
            
            // 0이 아닌 경우에 추가
            if nBoard[ny][nx] == 0 { continue }
            
            q.append((Info(nBoard, ny, nx, newOpenCard), moveCnt+1))
            visit.insert(Info(nBoard,ny,nx,newOpenCard))
            
        }
    }
    
    return -1
}
```
