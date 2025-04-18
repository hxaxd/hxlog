# C专家编程

* c专家编程 这本书非常有趣,讲了许多故事,比较深有用,建议深度学习 5

## C:穿越时空的迷雾

* C语言的发展与历史
* 除了位段与掩码,不要使用无符号整型

## 这不是BUG,而是语言特性

PS:重复内容比较多  
Switch标签打错了,编译器也不一定会发现,因为还有goto

## 分析c语言的声明

不重复

## 令人震惊的事实:数组与指针并不相同

不重复

## 对链接的思考

* 驱动器统筹 预处理器->前端 (语法与语义分析)->后端 (代码生成器)->汇编程序->链接-载入器,并在任意时优化,大多在前后端之间
* 静态链接与动态链接(更具优势) 静态库 (archive .a)与动态库 (ld .so)
* ABI (应用程序二进制接口)是动态链接的优势之一,减少更新库函数后对程序的维护
* 多个进程使用同一个函数在内存空间当中只会有一个副本
* 因为每个使用共享库的进程,一般会把它映射到不同的虚拟地址,所以使用与位置无关的代码,对于共享库来讲要更快
* -l选项永远在最后 (linker要先看到未定义的符号然后再去库里找,否则不知道要找啥)
* interpositioning会覆盖库函数,不仅仅是在你的程序里,所以若无必须,请像C++默认的一样声明static

## 运动的诗章:运行时数据结构

* a.out assembler output 但事实是链接器的输出
* UNIX系统常见ELF文件格式,其中以segment (段)划分,一个segment包含多个section (把UNIX的段与x86架构的段区分开)
* a.out包含text,data,bss段(记录没初始化的变量)  
gcc编译的程序运行时,就是这三部分  
text (指令与字符串常量)  
data (初始化的全局变量)  
bss (未初始化,如果你尝试初始化为0,会优化为不初始化)  
加上运行时分配的  
heap (动态内存分配的堆内存,与同名数据结构没有任何关系)  
stack (函数参数与局部变量,与同名数据结构有一些关系)  
但有时,共享库与链接器也在该进程的内存中  
* stack中,sp指针维护栈顶,栈中保存函数参数,局部变量,堆栈结构/过程活动记录 (返回地址,函数调用地址,不适合装入寄存器的参数以及寄存器原有值的保存)alloca函数可以申请到栈的空间
* stack为递归而独立存在,绝大多数cpu,stack往低内存生长
* setjump与longjump,在C++变成了异常
* unix的栈会生长,dos需要固定好 (8086中最大64kb)

## 对内存的思考

* 8086选择重叠两个16位 (偏移量与段)变成20位以访问1gb内存的同时兼容原本的16位程序,8086有4个段寄存器,CS,DS,SS,ES (附加)
* 虚拟模式/保护模式将内存控制器移到芯片外,段寄存器不与偏移量相加,而为存放实际段地址的表提供索引
* 虚拟内存以页的形式组织,进程尝试操纵不在物理内存当中的页会发生页错误,经过判定是否有效而选择将页载入或者返回段违规
* 当数据从内存读入,整块被装入cache的行的数据部分,该行的标签记录物理地址,以加速连续读取
* 堆内存的末端由break指针维护
* 未对齐的读写会引发总线错误,如要读4字节整形,但指定的地址不是4的倍数

## 为什么程序员无法分清万圣节和圣诞节

* 031==25 10==012
* 所有长度不到int和double的变量,在表达式中会自动类型提升,以保证在运算过程中不会溢出,但是如果编译器确定提升与否不影响结果,可以不提升 (适当的函数原形能阻止该过程)
* (float)3与(float)3.0的行为是不一样的

PS:这部分以实际程序经验为主

## 再论数组

已经让我们玩透了不是吗?

## 再论指针

同上

## 你懂得C,所以C++不在话下

不记录

#### _真正的大师之作_