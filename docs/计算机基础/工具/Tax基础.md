# Tax

## 参考资料

* [知乎教程](https://zhuanlan.zhihu.com/p/456055339) - 够用 - 4

### 配置环境

* [Tex Live](http://mirror.ctan.org/systems/texlive/Images/)+vscode (插件 latex workshop/latex language support + 配置一下)

### 文档类型

* 英文, 可以用 `book article和beamer`
* 中文, 可以用 `ctexbook ctexart和ctexbeamer`, 这些类型自带了对中文的支持
* 不同的文件类型, 编写的过程中也会有一定的差异, 如果直接修改文件类型的话, 甚至会报错
* 以下统一选用 `ctexart` 在编辑框第一行, 输入如下内容来设置文件类型:

```tax
\documentclass[12pt(字体大小), a4paper(纸张大小), oneside(单面打印)]{ctexart}

\begin{document}

这里是正文.

\end{document}
```

### 宏包

* 与数学公式与定理环境相关的宏包为 `amsmath amsthm amssymb`
* 用于插入图片的宏包为 `graphicx`
* `\usepackage{amsmath, amsthm, amssymb, graphicx}`
* 另外, 在加载宏包时还可以设置基本参数, 如使用超链接宏包 hyperref, 可以设置引用的颜色为黑色等
* `\usepackage[bookmarks=true, colorlinks, citecolor=blue, linkcolor=black]{hyperref}`

### 标题

* 标题可以用 `\title{}` 设置, 作者可以用 `\author` 设置, 日期可以用 `\date{}` 设置, 这些都需要放在导言区
* 为了在文档中显示标题信息, 需要使用 `\maketitle`

```tax
\documentclass[12pt, a4paper, oneside]{ctexart}
\usepackage{amsmath, amsthm, amssymb, graphicx}
\usepackage[bookmarks=true, colorlinks, citecolor=blue, linkcolor=black]{hyperref}

% 导言区

\title{我的第一个\LaTeX 文档}
\author{Dylaaan}
\date{\today}

\begin{document}

\maketitle

这里是正文.

\end{document}
```

### 正文

* 正文可以直接在 document 环境中书写, 没有必要加入空格来缩进, 因为文档默认会进行首行缩进
* 相邻的两行在编译时仍然会视为同一段
* 在 LaTeX 中, 另起一段的方式是使用一行相隔

```tax
我是第一段.

我是第二段.
```

* 这样编译出来就是两个段落 在正文部分, 多余的空格 回车等等都会被自动忽略, 这保证了全文排版不会突然多出一行或者多出一个空格
* 另外, 另起一页的方式 `\newpage`

在正文中, 还可以设置局部的特殊字体:

| 字体   | 命令          |
| ---- | ----------- |
| 直立   | `\textup{}` |
| 意大利  | `\textit{}` |
| 倾斜   | `\textsl{}` |
| 小型大写 | `\textsc{}` |
| 加宽加粗 | `\textbf{}` |

### 章节

* 对于 ctexart 文件类型, 章节可以用 `\section {}` 和 `\subsection {}` 命令来标记

```tax
...
\begin{document}

\maketitle

\section{一级标题}

\subsection{二级标题}

这里是正文.

\subsection{二级标题}

这里是正文.

\end{document}
```

### 目录

* 在有了章节的结构之后, 使用 `\tableofcontents` 命令就可以在指定位置生成目录
* 通常带有目录的文件需要编译两次, 因为需要先在目录中生成 `.toc` 文件, 再据此生成目录

```tax
...
\begin{document}

\maketitle

\tableofcontents

\section{一级标题}

\subsection{二级标题}

这里是正文.

\subsection{二级标题}

这里是正文.

\end{document}
```

### 图片

```tax
\begin{figure}[htbp]
    \centering
    \includegraphics[width=8cm]{图片.jpg}
    \caption{图片标题}
\end{figure}
```

* `[htbp]` 的作用是自动选择插入图片的最优位置
* `\centering` 设置让图片居中
* `[width=8cm]` 设置了图片的宽度为 8cm
* `\caption{}` 用于设置图片的标题

### 表格

* LaTeX 中表格的插入较为麻烦, 可以直接使用 `Create LaTeX tables online – TablesGenerator.com` 来生成

```tax
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \begin{tabular}{ccc}
        1 & 2 & 3 \\
        4 & 5 & 6 \\
        7 & 8 & 9
    \end{tabular}
\end{table}
```

### 列表

* LaTeX 中的列表环境包含无序列表 `itemize`
* 有序列表 `enumerate`
* 描述 `description`

```tax
\begin{enumerate}
    \item 这是第一点;
    \item 这是第二点;
    \item 这是第三点.
\end{enumerate}
```

* 另外, 也可以自定义 `\item` 的样式

```tax
\begin{enumerate}
    \item[(1)] 这是第一点;
    \item[(2)] 这是第二点;
    \item[(3)] 这是第三点.
\end{enumerate}
```

### 定理环境

* 导言区加入以下代码
  * `\newtheorem{theorem}{定理}[section]`
  * 其中 `{theorem}` 是环境的名称
  * {定理} 设置了该环境显示的名称是 "定理"
  * `[section]` 的作用是让 theorem 环境在每个 section 中单独编号
* 在正文中, 用如下方式来加入一条定理:

```tax
\begin{theorem}[定理名称]
    这里是定理的内容.
\end{theorem}
```

* 其中 \[定理名称] 不是必须的
* 另外, 我们还可以建立新的环境, 如果要让新的环境和 theorem 环境一起计数的话, 可以用如下方式

```tax
\newtheorem{theorem}{定理}[section]
\newtheorem{definition}[theorem]{定义}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{example}[theorem]{例}
\newtheorem{proposition}[theorem]{命题}
```

### 页面

* 最开始选择文件类型时, 我们设置的页面大小是 a4paper

* 除此之外, 我们也可以修改页面大小为 b5paper 等等

* 为了让每一页显示的内容更多一些, 我们可以使用 geometry 宏包

```tax
\usepackage{geometry}
\geometry{left=2.54cm, right=2.54cm, top=3.18cm, bottom=3.18cm}
```

* 另外, 为了设置行间距, 可以 `\linespread{1.5}`

### 页码

* 默认的页码编码方式是阿拉伯数字, 用户也可以自己设置为小写罗马数字 `\pagenumbering{roman}`
* 另外,aiph 表示小写字母
* Aiph 表示大写字母
* Roman 表示大写罗马数字
* arabic 表示默认的阿拉伯数字
* 如果要设置页码的话, 可以用如下代码来设置页码从 0 开始 `\setcounter{page}{0}`

### 数学公式的输入方式

#### 行内公式

* 行内公式通常使用 $..$ 来输入, 这通常被称为公式环境

* `若$a>0$, $b>0$, 则$a+b>0$.`

* 公式环境通常使用特殊的字体, 并且默认为斜体

#### 行间公式

* 行间公式需要用 \[..] 或者 $$..$$ 来输入, 推荐使用

```tax
若$a>0$, $b>0$, 则
\[
a+b>0.
\]
```

#### 上下标

* 上标可以用 ^ 输入, 例如 `a^n`
* 下标可以用\_来输入, 例如 `a_1`
* 上下标只会读取第一个字符, 如果上下标的内容较多的话, 需要改成 ^{} 或\_{}

#### 分式

* 分式可以用 `\dfrac{}{}` 来输入, 例如 `\dfrac{a}{b}`
* 为了在行间 分子 分母或者指数上输入较小的分式 `\frac{}{}`, 如 `a^\frac{1}{n}`

#### 括号

* 括号可以直接用 `(..)` 输入
* 有时候括号内的内容高度较大, 需要改用 `\left(..\right)` 例如 `\left(1+\dfrac{1}{n}\right)^n`
* 在中间需要隔开时, 可以用 `\left(..\middle|..\right)`
* 另外, 输入大括号 `{}` 时需要用 `\{..\}`, 其中 \ 起到了转义作用

#### 加粗

* 对于加粗的公式, 建议使用 `bm` 宏包, 并且用命令 `\bm{}` 来加粗, 这可以保留公式的斜体

#### 大括号

* 在这里可以使用 `cases` 环境, 可以用于分段函数或者方程组

```tax
$$
f(x)=\begin{cases}
    x, & x>0, \\
    -x, & x\leq 0.
\end{cases}
$$
```

#### 多行公式

* 多行公式通常使用 `aligned` 环境

```tax
$$
\begin{aligned}
a & =b+c \\
& =d+e
\end{aligned}
$$
```

#### 矩阵和行列式

* 矩阵可以用 `bmatrix` 环境和 `pmatrix` 环境, 分别为方括号和圆括号

```tax
$$
\begin{bmatrix}
    a & b \\
    c & d
\end{bmatrix}
$$
```

如果要输入行列式的话, 可以使用 `vmatrix` 环境, 用法同上
