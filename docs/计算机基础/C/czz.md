与c prime plus重叠的不提,这本书是给学习过高级语言但没学过C的人准备的,入门不浅,内容部分过时  
站在2024年角度,我并不推荐这本书

1. 使用#if 0 ........#endif去除代码
2. 警惕三字母词
3. typedef声明的标识符是无链接的
4. 可用寄存器有限,函数用之前要在运行时堆栈中保存原有数据
5. 自动变量初始化与赋值无差别
6. 注意for与while在使用continue时的区别 (迭代)
7. 算术移位与逻辑移位取决于实现
8. 内嵌赋值可能因为截断而发生错误
9.  三元运算符先判断后运算 (没运算的不会有副作用)
10. 真值太多了,if(a)!=if(a==TRUE)
11. 移位必须是非负
12. 指针的比较标准保证可以比较数组与数组最后的下一个位置,但不保证非数组或者数组前一个位置的情况,但实现可能会按照你的预期
13. 结构会自动对齐,所以安排好成员顺序
14. 一位的signed int 只有-1和0
15. 警惕内存分配失败,文件打开失败
16. 用sizeof提高可移植性
17. 注意缓冲区大小
18. 调试用的printf后强制刷新
19. 注意分配的缓冲区的生存周期
20. 链接器决定外部标识符的最大长度

PS：这本书每一章后的总结非常好,建议看总结就行