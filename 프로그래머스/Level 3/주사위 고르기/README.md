순열을 사용해 뽑을 주사위의 경우의 수를 구해준뒤 해당 주사위의 총합을   
dfs로 구해준뒤 승,무 를 비교해준다.   
그리고 최대값으로 변경해준다.   
하지만 테케19부터 시간초과 발생   

```
import Foundation
func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
        
    }
    
    return result
}
var dfsArray: [Int] = []
func dfs(_ dice: [[Int]], _ arr: [Int], _ idx: Int, _ sum: Int) {
    if arr.count == idx {
        dfsArray.append(sum)
        return
    }
    
    for i in 0..<6 {
        dfs(dice, arr, idx+1, sum + dice[arr[idx]][i])
    }
}
func checkWin(_ aArr: [Int], _ bArr: [Int]) -> (Int,Int) {
    var (win, draw) = (0,0)
    for i in 0..<aArr.count {
        let now = aArr[i]
        
        for j in 0..<bArr.count {
            if now > bArr[j] {
                win += 1
            } else if now == bArr[j] {
                draw += 1
            } else {
                break
            }
        }
    }
    
    return (win,draw)
}
func solution(_ dice:[[Int]]) -> [Int] {
    let arr = [Int](0..<dice.count)
    var choice = combination(arr, dice.count/2)
    var (myWin, myDraw) = (0,0)
    var myChoice: [Int] = []
    //print(choice)
    for i in 0..<choice.count {
        var aDice = choice[i]
        var bDice: [Int] = []
        for i in 0..<dice.count {
            if !aDice.contains(i) {
                bDice.append(i)
            }
        }
        //print(aDice, bDice)
        dfs(dice, aDice, 0, 0)
        var aSum = dfsArray.sorted()
        dfsArray = []
        dfs(dice, bDice, 0, 0)
        var bSum = dfsArray.sorted()
        dfsArray = []
        //print(aSum)
        //print(bSum)
        
        let check = checkWin(aSum, bSum)
        let checkWin = check.0
        let checkDraw = check.1
        //print(check)
        
        if myWin < checkWin {
            myWin = checkWin
            myDraw = checkDraw
            myChoice = aDice
        } else if myWin == checkWin {
            if myDraw < checkDraw {
                myWin = checkWin
                myDraw = checkDraw
                myChoice = aDice
            }
        }
        //print(myWin, myDraw, myChoice)
    }
    //print(myChoice.map{$0 + 1}.sorted())
    
    return myChoice.map{$0 + 1}.sorted()
}
```
array가 아니라 dictionary로 합을 계산해서 출력해보았다.   
24 테케가 3500이 나오긴했지만 통과하긴했다.   

```
import Foundation
func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
        
    }
    
    return result
}
var dfsArray: [Int:Int] = [:]
func dfs(_ dice: [[Int]], _ arr: [Int], _ idx: Int, _ sum: Int) {
    if arr.count == idx {
        if dfsArray[sum] == nil {
            dfsArray[sum] = 1
        } else {
            let value = dfsArray[sum]!
            dfsArray.updateValue(value+1, forKey: sum)
        }
        return
    }
    
    for i in 0..<6 {
        dfs(dice, arr, idx+1, sum + dice[arr[idx]][i])
    }
}
func checkWin(_ aArr: [Int:Int], _ bArr: [Int:Int]) -> (Int,Int) {
    var aArr = aArr.sorted{$0.0 < $1.0}
    var bArr = bArr.sorted{$0.0 < $1.0}
    var (win, draw) = (0,0)
    for (key, value) in aArr {
        let now = key
        
        for (key2, value2) in bArr {
            if now > key2 {
                win += (value * value2)
            } else if now == key2 {
                draw += (value * value2)
            } else {
                break
            }
        }
    }
    
    return (win,draw)
}
func solution(_ dice:[[Int]]) -> [Int] {
    let arr = [Int](0..<dice.count)
    var choice = combination(arr, dice.count/2)
    var (myWin, myDraw) = (0,0)
    var myChoice: [Int] = []
    print(choice)
    for i in 0..<choice.count {
        var aDice = choice[i]
        var bDice: [Int] = []
        for i in 0..<dice.count {
            if !aDice.contains(i) {
                bDice.append(i)
            }
        }
        //print(aDice, bDice)
        dfs(dice, aDice, 0, 0)
        var aSum = dfsArray
        dfsArray = [:]
        dfs(dice, bDice, 0, 0)
        var bSum = dfsArray
        dfsArray = [:]
        // print(aSum)
        // print(bSum)
        
        let check = checkWin(aSum, bSum)
        let checkWin = check.0
        let checkDraw = check.1
        //print(check)
        
        if myWin < checkWin {
            myWin = checkWin
            myDraw = checkDraw
            myChoice = aDice
        } else if myWin == checkWin {
            if myDraw < checkDraw {
                myWin = checkWin
                myDraw = checkDraw
                myChoice = aDice
            }
        }
        
        //print(myWin, myDraw, myChoice)
    }
    //print(myChoice.map{$0 + 1}.sorted())
    
    return myChoice.map{$0 + 1}.sorted()
}
```
