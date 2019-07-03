import Cocoa

/*
 题目：用两个栈实现队列。


关于栈与队列的讲解可以在我blog中去查看
 （https://coderjtao.github.io/2018/04/14/数据结构：栈与队列/）
 */

// MARK: - 栈定义
class Stack {
    // 是否为空
    var isEmpty: Bool {
        return stack.isEmpty
    }

    // 栈的大小
    var size: Int {
        return stack.count
    }

    // 栈顶元素
    var peek: Int? {
        return stack.last
    }

    // 入栈
    func push(_ value: Int) {
        stack.append(value)
    }

    // 出栈
    func pop() -> Int? {
        return stack.popLast()
    }

    private var stack: [Int] = []
}

// MARK: - 用栈实现队列
class ImplementQueueByStack {
    private var enterStack = Stack()
    private var outStack = Stack()

    var isEmpty: Bool {
        return enterStack.isEmpty && outStack.isEmpty
    }

    var size: Int {
        return enterStack.size + outStack.size
    }

    var peek: Int? {
        get {
            tab()
            return outStack.peek
        }
    }

    func enterQueue(_ value: Int) {
        enterStack.push(value)
    }

    func outQueue() -> Int? {
        tab()
        return outStack.pop()
    }

    // 将 enter 中的值，加入到 out 中
    private func tab() {
        if outStack.isEmpty {
            while !enterStack.isEmpty {
                outStack.push(enterStack.pop()!)
            }
        }
    }
}


// MARK: - 队列定义
class Queue {
    // 是否为空
    var isEmpty: Bool {
        return queue.isEmpty
    }

    // 队列的大小
    var size: Int {
        return queue.count
    }

    // 队头元素
    var peek: Int? {
        return queue.last
    }

    // 入队操作
    func enterQueue(_ value: Int) {
        queue.append(value)
    }

    // 出队操作
    func outQueue() -> Int? {
        if let element = queue.first {
            queue.removeFirst()
            return element
        }
        return nil
    }

    private var queue: [Int] = []
}

// MARK: - 队列实现栈
class ImplementStackByQueue {
    private var enterQueue = Queue()
    private var tempQueue = Queue()

    var isEmpty: Bool {
        return enterQueue.isEmpty && tempQueue.isEmpty
    }

    var size: Int {
        return enterQueue.size
    }

    var peek: Int? {
        get {
            tab()
            let peekElement = enterQueue.peek
            tempQueue.enterQueue(enterQueue.outQueue()!)
            swap()
            return peekElement
        }
    }

    func push(_ value: Int) {
        enterQueue.enterQueue(value)
    }

    func pop() -> Int? {
        tab()
        let popElement = enterQueue.outQueue()
        swap()
        return popElement
    }

    private func tab() {
        while enterQueue.size != 1 {
            tempQueue.enterQueue(enterQueue.outQueue()!)
        }
    }

    private func swap() {
        (enterQueue, tempQueue) = (tempQueue, enterQueue)
    }
}

