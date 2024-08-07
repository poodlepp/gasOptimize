- 推荐使用严格不等式
    + 严格不等式 >  <
    + 大于等于  小于等于 不推荐,编译器需要转换
    + 一般规律
- require其中判断条件如果有多个(默认都要检查的)，建议拆分
    + 提前结束，节约gas
- revert中和上面是一样的
- 返回参数  实名、匿名 需要实际测试优劣
    + 一般来说 实名更优
- 避免使用！进行反向判断
    + 以实际效果来决定
- ++i  优于   i++
    + 后者堆栈上需要存储两个版本
- 溢出
    + solidity溢出就会revert
    + 但是有一些场景，需要允许溢出
        - for循环
        - 逻辑逻辑
        - 需要添加无溢出的代码块
- 最优的gas-for
    + for (uint256 i; i < limit; ) {
    + // inside the loop
    +   unchecked { ++i; }
    + }
- do-while 一般优于 for
- 数字使用uint8  solidity 会自动转换为uint256进行运算
    + 转换过程是需要gas的
    + 所以需要综合考虑，实际测试来决定类型
- 多个条件 结合 bool运算
    + 应进行短路运算，并且评估运算成本，成本较低的可以放在前面
    + 条件1 || 条件2
    + 条件1 && 条件2
- public变量会有一个隐式的get函数，增加跳转表的大小  增加合约字节码的大小
    + 优先使用私有变量
    + constant  immutable 直接都不占用存储空间了
- 优化器的runs参数
    + 根据实际场景来选择
    + 较小的runs代表优先考虑部署成本
    + 较大的runs代表优先考虑运行成本
- 字节码中不同的方法字节码顺序  按照选择器的十六进制排序
    + 方法不超过4个 线性搜索跳转表；
    + 方法超过4个，二分法搜索跳转表
    + 频繁使用的方法 应调整命名，以此来优化排序
    + 工具推荐 Solidity Zero Finder
- 位移操作 优于乘除
    + shr右移  shl左移  5gas
    + mul  div   3gas
    + 必须保证不能除0，不能溢出
- calldata缓存
    + 缓存length
    + 缓存item
    + 避免多次读取
- JUMP 操作码 比算法更加昂贵
    + 条件跳转  循环都是依赖JUMP操作码的
    + 某些情况下 可以通过逻辑调整，使循环次数减半，也是个办法
- 使用次数少的内部函数 没有存在的必要，直接内嵌为妙
- 字符串超过32bytes 通过hash比较equal，省gas
- 幂 对数的计算 可以考虑预制速查表
- 预编译合约 （模数乘以大数 或者 复制大块内存，可以考虑）
    + 可能导致L2 不兼容
