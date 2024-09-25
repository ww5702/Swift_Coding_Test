구현문제이다.   
톱니바퀴를 시계, 반시계방향으로 회전하고   
회전한 방향에 따라 옆에 있던 톱니바퀴의 극과 비교하여 같으면 돌리지않고 다르면 반대방향으로 돌려준다.   

구현문제는 처음부터 파악하게 쉽게 구현해야한다.   
그래야 더 추가해야하는 기능이나 실수가 나왔을때 쉽게 고칠 수 있다.   
파악하지 못했던 부분이   
1번 톱니바퀴를 시계방향으로 돌렸을때 2번 톱니바퀴는 반시계방향, 그리고 3번은 시계방향 이렇게 반대로 생각해야한다.   
하지만 2번 톱니바퀴를 시게방향으로 돌렸다면 1번 톱니바퀴는 반시계, 3번도 반시계이다.   
따라서 2,3번 톱니바퀴를 돌릴때 회전방향을 유의하여 다시 수정하였다.   



```
import Foundation
func solution() {
    var firstTrack = readLine()!.map{String($0)}
    var secondTrack = readLine()!.map{String($0)}
    var thirdTrack = readLine()!.map{String($0)}
    var fourthTrack = readLine()!.map{String($0)}
    var k = Int(readLine()!)!
    var board: [(Int,Int)] = []
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append((input[0],input[1]))
    }

    func rotate(_ n: Int, _ dir: Int) {
        if n == 1 {
            if dir == 1 {
                let temp = firstTrack.removeLast()
                firstTrack.reverse()
                firstTrack.append(temp)
                firstTrack.reverse()
            } else {
                firstTrack.reverse()
                let temp = firstTrack.removeLast()
                firstTrack.reverse()
                firstTrack.append(temp)
            }
        } else if n == 2 {
            if dir == 1 {
                let temp = secondTrack.removeLast()
                secondTrack.reverse()
                secondTrack.append(temp)
                secondTrack.reverse()
            } else {
                secondTrack.reverse()
                let temp = secondTrack.removeLast()
                secondTrack.reverse()
                secondTrack.append(temp)
            }
            
        } else if n == 3 {
            if dir == 1 {
                let temp = thirdTrack.removeLast()
                thirdTrack.reverse()
                thirdTrack.append(temp)
                thirdTrack.reverse()
            } else {
                thirdTrack.reverse()
                let temp = thirdTrack.removeLast()
                thirdTrack.reverse()
                thirdTrack.append(temp)
            }
            
        } else {
            if dir == 1 {
                let temp = fourthTrack.removeLast()
                fourthTrack.reverse()
                fourthTrack.append(temp)
                fourthTrack.reverse()
            } else {
                fourthTrack.reverse()
                let temp = fourthTrack.removeLast()
                fourthTrack.reverse()
                fourthTrack.append(temp)
            }
        }
        
    }
    
    for i in 0..<k {
        let num = board[i].0
        var direction = board[i].1
        let (ft2,st2,st6,tt2,tt6,ft6) = (firstTrack[2],secondTrack[2],secondTrack[6],thirdTrack[2],thirdTrack[6],fourthTrack[6])
        
//        print(firstTrack)
//        print(secondTrack)
//        print(thirdTrack)
//        print(fourthTrack)
//        print()
        
        if num == 1 {
            rotate(1, direction)
            if ft2 != st6 {
                if direction == 1 {
                    direction = -1
                    rotate(2, direction)
                } else {
                    direction = 1
                    rotate(2, direction)
                }
            } else {
                //print("2가 같은 극이므로 움직이지 않고 3도 안움직임 4도")
                continue
            }
            
            if st2 != tt6 {
                if direction == 1 {
                    direction = -1
                    rotate(3, direction)
                } else {
                    direction = 1
                    rotate(3, direction)
                }
            } else {
                //print("3이 같은극이므로 움직이지 않고 4도 안움직임")
                continue
            }
            
            if tt2 != ft6 {
                if direction == 1 {
                    direction = -1
                    rotate(4, direction)
                } else {
                    direction = 1
                    rotate(4, direction)
                }
            }
            
            
        } else if num == 2 {
            rotate(2, direction)
            if st6 != ft2 {
                if direction == 1 {
                    rotate(1, -1)
                } else {
                    rotate(1, 1)
                }
            }
            
            if st2 != tt6 {
                if direction == 1 {
                    direction = -1
                    rotate(3, direction)
                } else {
                    direction = 1
                    rotate(3, direction)
                }
            } else {
                //print("3이 같은극이므로 움직이지 않음")
                continue
            }
            
            if tt2 != ft6 {
                if direction == 1 {
                    direction = -1
                    rotate(4, direction)
                } else {
                    direction = 1
                    rotate(4, direction)
                }
            }
            
            
        } else if num == 3 {
            rotate(3, direction)
            if tt2 != ft6 {
                if direction == 1 {
                    rotate(4, -1)
                } else {
                    rotate(4, 1)
                }
            }
            
            if st2 != tt6 {
                if direction == 1 {
                    direction = -1
                    rotate(2, direction)
                } else {
                    direction = 1
                    rotate(2, direction)
                }
            } else {
                //print("2가 같은극이므로 움직이지않고 1도 안움직임")
                continue
            }
            
            if st6 != ft2 {
                if direction == 1 {
                    direction = -1
                    rotate(1, direction)
                } else {
                    direction = 1
                    rotate(1, direction)
                }
            }
            
        } else {
            rotate(4, direction)
            
            if tt2 != ft6 {
                if direction == 1 {
                    direction = -1
                    rotate(3, direction)
                } else {
                    direction = 1
                    rotate(3, direction)
                }
            } else {
                //print("3이 같은극이므로 움직이지 않고 2도 1도 안움직임")
                continue
            }
            
            if st2 != tt6 {
                if direction == 1 {
                    direction = -1
                    rotate(2, direction)
                } else {
                    direction = 1
                    rotate(2, direction)
                }
            } else {
                //print("2가 같은극이므로 움직이지 않고 1도 안움직임")
                continue
            }
            
            if ft2 != st6 {
                if direction == 1 {
                    direction = -1
                    rotate(1, direction)
                } else {
                    direction = 1
                    rotate(1, direction)
                }
            }
        }
        
    }
//    print(firstTrack)
//    print(secondTrack)
//    print(thirdTrack)
//    print(fourthTrack)
    var answer = 0
    answer += firstTrack[0] == "1" ? 1 : 0
    answer += secondTrack[0] == "1" ? 2 : 0
    answer += thirdTrack[0] == "1" ? 4 : 0
    answer += fourthTrack[0] == "1" ? 8 : 0
    
    print(answer)
}

solution()
/*
 시계방향
 1이 S / 0이 N
 1번째 2 <-> 2번째 6
 2번째 2 <-> 3번째 6
 3번째 2 <-> 4번째 6
 
 1이 시계방향 회전 / -1이 반시계방향 회전
 같은 극이면 변화 x
 다른 극이면 서로 다른방향으로 회전
 
10111000
10100110
11000010
00001100
8
1 -1
4 1
1 1
1 -1
1 1
2 1
2 -1
4 1
 
 */


```
