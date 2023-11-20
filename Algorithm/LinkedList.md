# LinkedList
배열과 연결리스트는 데이터를 표현하는 자료구조이다.   
하지만 배열과 연결리스트는 서로의 장단점을 보완하고 있다.   

## 배열의 특징
배열은 너무나 잘알듯이 한 메모리 공간에 데이터들이 '나란히'저장되어있다.   
따라서 index값만 안다면 접근이 매우 빠른것이 장점이다.   
하지만 삭제나 삽입할경우 해당 위치의 값들을 밀어내고 삭제 혹은 삽입하기 때문에   
재배치하는 과정때문에 O(N) 시간복잡도 즉 오버헤드가 발생하는 단점이 있다.   

## 연결리스트의 특징
그래서 연결리스트는 배열의 단점을 보완해주는 모습을 보여준다.   
'각각 떨어진 공간에 존재하는 데이터'를 연결시켜주는것이다.   
따라서 원하는 때에 메모리에 공간을 할당해서 사용하고, 중간 element를 삭제시 재배치하는 오버헤드도 발생하지 않는다.   
하지만 배열처럼 index에 바로 접근하는것이 아니라서   
첫번째 데이터부터 원하는 데이터까지 (단방향) 순차적으로 찾아가야 하는 단점이 있다 즉 속도가 느리다.   
1000번쨰 값에 접근한다면 1000번을   
999번쨰 값에 접근한다면 999번을 계속해서 탐색해야하는것이다.   

## (단)방향 연결리스트
당연히 양방향 연결리스트를 사용하겠지만 우선 단방향 연결리스트에 대해서도 알아놓자.   
data, next   
위의 모양처럼 데이터가 생겼는데   
data는 저장되어있는 내 데이터   
next는 다음 데이터의 주소값을 저장해둔다고 생각하면 편하다.   
그리고 위의 모양을 우리는 Node(노드)라고 부른다.   
```
class Node<T> {
  var data : T?
  var next : Node?

  init(data : T?, next : Node? = nil) {
    self.data = data
    self.next = next
  }
}
```
이렇게 class를 구현해주고   
Node를 관리해주는 LinkedList에서 append와 remove를 구현해주면된다.   
search를 할 경우 속도가 매우 느려진다는 단점을 알고있으니 양방향으로 처음부터 구현하는것이 맞다   

## (양)방향 연결리스트
가장 첫 노드를 가르키는 head와 가장 마지막 노드를 가르키는 tail을 두고,   
내 앞노드, 내 뒷노드를 모드 연결하여 양방향에서 탐색가능하게 하는 연결리스트이다.   
따라서 prev, data, next의 모양을 가지고 있다.   
```
class Node<T> {
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(data: T?, prev: Node? = nil, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}
```