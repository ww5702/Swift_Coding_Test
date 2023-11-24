union과 find를 이용해 자식노드를 부모노드로 연결시켜주고 해제시켜주는   
MERGE, UNMERGE를 수행할 수 있다.   
13-16 , 18, 20 테스트케이스가 오류가 난다.   
반례를 찾지 못했다   
```
import Foundation
/*
표의 크기는 50 50, 전부 비어있다
셀은 문자열 값을 가질 수 있고, 다른 셀과 병합될 수 있다.
UPDATE r,c value 바꾸기

UDPATE value1 value2 value1값을 가진 셀들을 value2로

MERGE r1 c1 r2 c2 (r1,c1)(r2,c2) 셀을 병합한다
값이 같으면 무시
값이 안붙어있을수도 있는데 그럼 상관없다
병합할때 한 셀만 값을 가지고 있으면 해당값으로 통일
두 셀 모두 값을 가지고 있으면 r1,c1값으로 가진다
이 이후 r1,c1 이나 r2,c2 어떤 값을 불러도 같은 공동체

UNMERGE r c
r,c위치의 셀을 선택하여 병합 해제
해당 셀이 포함되어 있던 모든 셀들이 초기 상태로 돌아간다
다 초기화 즉 빈칸으로 돌아가는데 r,c만 전으로 돌아가면서 병합되어있을때
가지고 있던 값을 가져간다.

*/
func convertNum(_ x : Int, _ y : Int) -> Int{
    return (50 * (x-1)) + y
}

func solution(_ commands:[String]) -> [String] {
    var result: [String] = []
    var parent = [Int](0...2501)
    var excel = Array(repeating: "", count: 2501)
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    
    for i in 0..<commands.count {
        var value = commands[i].components(separatedBy:" ")
        var command = value[0]
        // 명령이 update인 경우
        if command == "UPDATE" {
            // 좌표 지정
            if value.count > 3 {
                let index = convertNum(Int(value[1])!,Int(value[2])!)
                // 부모노드를 찾아서 해당 값을 변환
                excel[find(index)] = value[3]
            }
            // 문자열 바꾸기
            else {
                let before = value[1]
                let after = value[2]
                for i in 0...2500 {
                    if excel[i] == before {
                        excel[i] = after
                    }
                }
            }
        } else if command == "MERGE" {
        // 명령어가 MERGE인 경우
            let num1 = convertNum(Int(value[1])!,Int(value[2])!)
            let num2 = convertNum(Int(value[3])!,Int(value[4])!)
            let root1 = find(num1)
            let root2 = find(num2)
            // 같은 부모노드를 가르키고 있다면 패스
            if root1 == root2 { continue }
            
            // 값을 가진쪽으로 통일해야하니
            var rootString = excel[root1] == "" ? excel[root2] : excel[root1]
            // 먼저 두 값을 삭제해주고 두 값들을 union시켜준다.
            excel[root1] = ""
            excel[root2] = ""
            union(root1, root2)
            // 루트 노드에 rootString을 임명해준다,
            excel[root1] = rootString
        } else if command == "UNMERGE" {
            var num = convertNum(Int(value[1])!, Int(value[2])!)
            var root = find(num)
            var rootString = excel[root]
            // union된 모든값들을 빈칸으로 만들어주면서
            // 주어진 좌표만 전에 주어진 값을 가진다.
            excel[root] = ""
            excel[num] = rootString
            // 제일 부모노드의 값을 root라고 지정했고
            // 셀들중에서 해당 값을 부모노드로 지정한 index가 있다면 추가
            var deleteList: [Int] = []
            for i in 1...2500 {
                if parent[i] == root {
                    deleteList.append(i)
                }
            }
            // 해당 index들을 다시 자기자신을 가르키도록 반환
            for list in deleteList {
                parent[list] = list
            }
            
            
        } else if command == "PRINT" {
            let num = convertNum(Int(value[1])!, Int(value[2])!)
            var root = find(num)
            excel[root] == "" ? result.append("EMPTY") : result.append(excel[root])
        }
    }
    return result
}
```
반례를 찾을 수 있었다.   
제 경우에는 unmerge가 아니라 merge로직이 문제였다.   
노드 A, 노드 B, 노드 C가 있을 때   
B가 C의 부모인 상태에서 A와 C를 병합하려고 하면   
B와 C의 부모를 모두 업데이트해 주어야 합니다. C의 부모만 A로 수정하면 문제가 발생한다.   
   
이에 따른 반례이다.   
["UPDATE 1 1 A", "UPDATE 2 2 B", "UPDATE 3 3 C", "UPDATE 4 4 D", "MERGE 1 1 2 2", "MERGE 3 3 4 4", "MERGE 1 1 4 4", "UNMERGE 3 3", "PRINT 1 1", "PRINT 2 2", "PRINT 3 3", "PRINT 4 4"]   
답은 ["EMPTY", "EMPTY", "A", "EMPTY"]가 나와야 한다.   
["A", "A", "EMPTY", "A"]나 ["EMPTY", "EMPTY", "A", "A"] 같은 답이 나오면 틀리게 된다.   

```
import Foundation
/*
표의 크기는 50 50, 전부 비어있다
셀은 문자열 값을 가질 수 있고, 다른 셀과 병합될 수 있다.
UPDATE r,c value 바꾸기

UDPATE value1 value2 value1값을 가진 셀들을 value2로

MERGE r1 c1 r2 c2 (r1,c1)(r2,c2) 셀을 병합한다
값이 같으면 무시
값이 안붙어있을수도 있는데 그럼 상관없다
병합할때 한 셀만 값을 가지고 있으면 해당값으로 통일
두 셀 모두 값을 가지고 있으면 r1,c1값으로 가진다
이 이후 r1,c1 이나 r2,c2 어떤 값을 불러도 같은 공동체

UNMERGE r c
r,c위치의 셀을 선택하여 병합 해제
해당 셀이 포함되어 있던 모든 셀들이 초기 상태로 돌아간다
다 초기화 즉 빈칸으로 돌아가는데 r,c만 전으로 돌아가면서 병합되어있을때
가지고 있던 값을 가져간다.

*/
func convertNum(_ x : Int, _ y : Int) -> Int{
    return (50 * (x-1)) + y
}

func solution(_ commands:[String]) -> [String] {
    var result: [String] = []
    var parent = [Int](0...2501)
    var excel = Array(repeating: "", count: 2501)
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        //print(a,b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    
    for i in 0..<commands.count {
        var value = commands[i].components(separatedBy:" ")
        var command = value[0]
        // 명령이 update인 경우
        if command == "UPDATE" {
            // 좌표 지정
            if value.count > 3 {
                let index = convertNum(Int(value[1])!,Int(value[2])!)
                // 부모노드를 찾아서 해당 값을 변환
                excel[find(index)] = value[3]
            }
            // 문자열 바꾸기
            else {
                let before = value[1]
                let after = value[2]
                for i in 0...2500 {
                    if excel[i] == before {
                        excel[i] = after
                    }
                }
            }
        } else if command == "MERGE" {
        // 명령어가 MERGE인 경우
            let num1 = convertNum(Int(value[1])!,Int(value[2])!)
            let num2 = convertNum(Int(value[3])!,Int(value[4])!)
            let root1 = find(num1)
            let root2 = find(num2)
            //print(find(1),find(52),find(103),find(154))
            // print(root1,root2)
            // 같은 부모노드를 가르키고 있다면 패스
            if root1 == root2 { continue }
            
            // 값을 가진쪽으로 통일해야하니
            var rootString = excel[root1] == "" ? excel[root2] : excel[root1]
            // 먼저 두 값을 삭제해주고 두 값들을 union시켜준다.
            excel[root1] = ""
            excel[root2] = ""
            union(root1, root2)
            // 루트 노드에 rootString을 임명해준다,
            excel[root1] = rootString
            
            
            // 이 부분 때문에 13~16, 18, 20 테스트케이스가 틀렸었다.
            // 예를들어 1,1 2,2 3,3 4,4가 
            // 병합되어 1,1 1,1 3,3 3,3 이 되었다 치자
            // 여기서 1,1 3,3를 병합한다고 하면 위 코드로만 수행시
            // 1,1 1,1 1,1 4,4가 된다.
            // 따라서 3,3을 부모노드로 가지던 자식노드들을
            // 전부 1,1로 바꿔줘야 한다.   
            // 1,1 = root1 3,3 = root3이기에 
            // root2와 같은 i값들을 다시 root1로 바꿔주는 코드 추가
            var deleteList: [Int] = []
            for i in 1...2500 {
                if parent[i] == root2 {
                    deleteList.append(i)
                }
            }
            for list in deleteList {
                parent[list] = root1
            }
            //print(parent[1],parent[52],parent[103],parent[154])
            //print(find(1),find(52),find(103),find(154))
        } else if command == "UNMERGE" {
            var num = convertNum(Int(value[1])!, Int(value[2])!)
            var root = find(num)
            var rootString = excel[root]
            // union된 모든값들을 빈칸으로 만들어주면서
            // 주어진 좌표만 전에 주어진 값을 가진다.
            excel[root] = ""
            excel[num] = rootString
            // 제일 부모노드의 값을 root라고 지정했고
            // 셀들중에서 해당 값을 부모노드로 지정한 index가 있다면 추가
            var deleteList: [Int] = []
            for i in 1...2500 {
                if parent[i] == root {
                    deleteList.append(i)
                }
            }
            // 해당 index들을 다시 자기자신을 가르키도록 반환
            for list in deleteList {
                parent[list] = list
            }
            
            //print(parent[1],parent[52],parent[103],parent[154])
        } else if command == "PRINT" {
            let num = convertNum(Int(value[1])!, Int(value[2])!)
            var root = find(num)
            excel[root] == "" ? result.append("EMPTY") : result.append(excel[root])
        }
    }
    return result
}
```
