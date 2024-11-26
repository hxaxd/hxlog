### 开始

- istream类的对象`cin`,ostream类的对象`cout cerr clog`,用处顾名思义
- endl结束行,刷新缓冲区,在流中叫操纵符
- istream对象作为条件,流未错误时true,EOF或无效输入返回false,原理是重载bool转换
- 另外,遇见错误是cin对象会设置错误状态,后续输入无效

## C++基础

### 变量和基本类型

#### 算术类型

- C++规定算术类型的最小尺寸,大多与C一致,注意wchar_t,char16_t是16位_tchar32_t是32位(后两种应对unicode)
- 对浮点型仅要求最小精度,6/10/10(一般来说7/16,32bit/64bit),bool值未定义
- 字节是可寻址的最小内存块,存储的基本单元为字
- 除bool与拓展char外,其他**整数**类型都有符号和无符号版本,分别用signed/unsigned修饰
- 除char外,其他算术类型本身就是signed,但char有三种,而其本身到底是signed还是unsigned则取决于编译器
- 强制类型转换,赋signed一个区间外的值会产生未定义行为,而赋unsigned则会产生模运算,值为初始值对容量取模,-1对256取模为255
- 混用signed和unsigned,signed会自动转换为unsigned 

