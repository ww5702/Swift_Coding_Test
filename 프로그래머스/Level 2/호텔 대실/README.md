첫 제출   
components를 활용해 : 를 제거하고 분으로 전부 바꿔 시간을 비교할 수 있도록 하였다.   
~= 연산자를 활용해 투숙하고있는 투숙객 방의 나가는 시간까지 다음 손님이 또 들어온다면 추가하는 형식   
```
import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var bookTime: [(Int,Int)] = []
    var rooms: [(Int,Int)] = []
    for i in book_time {
        let start = i[0].components(separatedBy:[":"])
        let end = i[1].components(separatedBy:[":"])
        let startTime = Int(start[0])!*60 + Int(start[1])!
        let endTime = Int(end[0])!*60 + Int(end[1])! + 10
        bookTime.append((startTime,endTime))
    }
    bookTime.sort(by: {$0.0 < $1.0})
    //print(bookTime)
    loop1: for book in bookTime {
        for (i,room) in rooms.enumerated() {
            // book.0(시작시간)이 이미 방에 들어가있는
            // room.0~room.1 시간 사이에 들어가있지 않다면
            if !(room.0..<room.1 ~= book.0) {
                //print(i, book)
                rooms[i] = book
                continue loop1
            }
        }
        rooms.append((book.0, book.1))
    }
    return rooms.count
}
```
