# 巜程序员修练之道》

## 第六章 当你编码时

### 靠巧合编程

避免靠巧合编程，要深思熟虑地编程。

对于偶然实现的代码，需要冒把已经实现的代码弄垮的风险来进行修正，原因是：

* 代码也许不是真的能工作，只是看起来能工作
* 依靠的边界条件也许是一个偶然
* 没有记入文档的行为可能会随着库的下一次发布而变化
* 多余的河不必要的调用会使代码变慢
* 多余的调用还会增加引入新bug的风险

对于编写给他人调用的代码，良好的模块化以及将实现隐藏在撰写良好文档的小接口之后会很有帮助。定制良好的合约有助于消除误解。

#### 语境的偶然

在编写模块或者其它代码的时候，尽可能不要假定模块应该在某种特定的情况下使用，如只有英语用户会使用，只在GUI下使用等。

#### 隐含的假定

巧合可以在所有层面上将人引入歧途，从生成需求直到测试。测试中容易出现虚假的因果关系和巧合的输入，因此需要去证明，不要假定。

不以明确的事实为基础的假定是所有项目的祸害。**不要靠巧合编程**

#### 怎样深思熟虑地编程

深思熟虑地编程，能让编写代码的所花的时间更少，能在开发周期的早期抓住并修正错误，更少制造错误。

如何深思熟虑地编程：

* 总是意识到自己在做什么
* 不要盲目地编程，不要试图构建自己不完全理解的应用以及不要试图使用不熟悉的技术
* 按照计划行事
* 依靠可靠的事物。不要依靠巧合或假定
* 为自己的假定建立文档，"按合约设计"有助于澄清头脑中的假定
* 不要只是测试代码，还要测试假定。不要猜测，要实际尝试它。编写断言来测试假定
* 为工作划分优先级。把时间花在重要的方面；很有可能，这方面是最难的部分
* 不要做历史的奴隶。不要让已有的代码支配将来的代码。当代码不再适用，则替换它。即使在程序中也不要让已经做完的事约束下一步要做的事，准备好重构，标准是重构带来的项目进度的影响比不重构要小。

### 算法速率

只要是编写含有循环或递归调用的程序，就需要检查运行时间和内存需求。可以快速确认在做的事情在各种情况下是有意义的。但有时候也需要用O()表示法

#### O()表示法

O()表示法是处理近似值计算的一种数学途径。可以把O视为"阶为......"的意思。O()表示对在度量的事物（时间、内存等）设置了上限。但由于习惯做法会去掉所有低阶项，并对任何常数系数都不考虑，因此在一个算法比另一个算法快1000倍等常数的情况下，从表示法上是看不出来的。

O()表示法并非只适用于时间；还可以用它表示算法适用的其它任何资源。为资源消耗建模。

#### 常识估算

用常识可以估算的许多基本算法的阶：

* 简单循环——O(n)，有穷举查找、生成校验和等
* 嵌套循环——O(n2)，冒泡排序等
* 二分法——O(ln(n))，有序列表的二分查找，遍历二叉树等
* 分而治之——O(nln(n))，快速排序等。
* 组合——阶乘，旅行商问题、最优包装问题。

**估算自己的算法的阶**，遇到较高阶的算法，尽可能地将它的阶数降低

在使用算法时要考虑代码自身所做的事情。因为有时候对于较小的值，简单的O(n2)循环的性能可能比复杂的O(nln(n))算法更好。并且随着输入值的增加，系统开始颠簸。算法的用时很可能会退化。因此需要我们设法既考虑理论问题，有考虑实践问题。且在进行估算后，唯一作数的计时是代码运行在实际工作环境中、处理真实数据时的速率。因此要**测试我们的估算**

#### 最好的并非总是最好的

最快的算法对于工作而言不一定是最好的，在合适的情况下选择易于编码和调试的语言，且不影响程序的高效运行才是最重要的，就像有高昂设置开销的算法，即使是最快的，但是在小输入集上使用效果不见得会好。

### 重构

重写、重做和重新架构代码合起来称为重构。

#### 何时应该重构

当代码不再合适、有东西应该合并或者任何感觉是"错误"的东西都应该进行重构，如果代码具有以下特征，就应该进行重构代码：

* **重复**，发现对DRY原则的违反。
* **非正交的设计**。
* **过时的知识**，事情变了，需求改了，或者对问题了解加深了。代码需要跟上变化
* **性能**，为改善性能，需要把功能从系统的一个区域移到另一个区域。

需要重构的代码就像是一个"肿瘤"，需要"侵入性"外科手术。如果不重构，就可能需要冒更昂贵、更危险、甚至"丧命"的代价。

**早重构，常重构**

追踪需要重构的事物，如果不能立即重构某样东西，需要将它列入计划，确保受到影响的代码使用者知道代码计划要重构，以及重构会带来的影响。

#### 怎样进行重构

重构就其核心而言就是重新设计。根据新的事实、更深的理解、变化的需求等重新进行设计。但是无节制地撕毁代码可能会让自己处于更糟的位置上。

重构是一项需要慎重、深思熟虑的活动，进行利大于弊的重构需要：

* 不要试图在重构的同时增加功能
* 在开始重构之前，确保拥有良好的测试。并经常运行测试
* 采取短小、深思熟虑的步骤。重构常常涉及到进行许多局部改动，继而产生更大规模的改动，使步骤保持短小，并在每个步骤之后测试，能够避免长时间的调试

在重构时，确保对模块做出的剧烈改动（以一种不兼容的方式更改了模块的接口或功能等）会破坏构建。这样有助于找出旧有的无法通过编译的代码。并做出必要的改动，进行及时的更新。

对于不合理的代码，既要修正它，也要修正依赖它的每样东西。要记住，现在有损害的，以后的损害会更大，最好一劳永逸地修正它。

### 易于测试的代码

软件IC用于比喻基于组件的开发以及讨论可复用性，意思是软件组件应该像集成电路一样进行组合。这只有在使用的组件是可靠的才能行之有效。

从一开始就应该把可测试性构建进软件中，并对各个部分连接在一起之前对每个部分进行彻底的测试。

#### 单元测试

单元测试指的是：在隔离状态下对每个模块进行测试，目的是检验其行为。软件的单元测试是对模块进行演练的代码。

#### 针对合约进行测试

这里会把单元测试视为针对合约的测试。通过编写测试用例，确保给定的单元遵守其合约。通过这样的方式能够知道：代码是否符合合约，以及合约的含义是否与认为的一样。通过广泛的测试用例与边界条件，可以测试模块是否实现了所允诺的功能。

现实中，模块会有依赖关系，对模块的组合进行测试一般会按照以下顺序：

1. 全面测试一个基础模块的合约
2. 全面测试另外的基础模块的合约
3. 测试组合模块的合约。

一旦子模块得到了检验，就可以测试模块自身，并根据问题出现情况判断出问题的节点。能够减少调试工作。

**为测试而设计**

当设计模块或单个例程时，应该要设计其合约，同时设计测试该合约的代码。通过设计能够通过测试、并履行其合约的代码，可以仔细地考虑边界条件和其它不这样做便不会发现的问题。一开始就避免错误是最好的。

#### 编写单元测试

单元测试应该易于查找与使用，使测试代码易于找到，能够给开发者提供两个无价的资源：

1. 例子，说明怎样使用模块的所有功能
2. 构建回归测试，验证未来对代码的任何改动是否正确的一种手段

有时候，可以让各个类或者模块包含自己的单元测试，这样做让测试更方便。

#### 使用测试装备

编写大量测试代码并进行大量测试时，需要工具来让测试更加方便，测试功能更多，因此需要测试装备。

测试装备可以处理一些常用操作，如记录状态、分析输出结果能否符合预期、选择和运行测试等。

不管采用的技术是什么，测试装备应该具备以下功能：

* 用以指定设置与清理的标准途径。
* 用以选择个别或所有可用测试的方法
* 分析输出是否是预期（或意外）结果的手段
* 标准化的故障报告形式

测试应该是可以组合的，也就是可以由子组件的子测试组合到任意深度，这一特性得以使用同样的工具、轻松地测试系统的选定部分或整个系统。

#### 构建测试窗口

含有跟踪消息的日志文件的日志消息格式应该正规、一致。当自动解析它们时，用以推断程序所用的处理时间或逻辑路径。当现实世界的数据由程序处理时，可以通过视图展现出来。

#### 测试文化

所有的软件都将进行测试，如果不是开发者，那就是使用者。**测试软件，否则用户就得测试**

### 邪恶的向导

向导可以自动生成骨架代码。但是使用向导却不理解它制作的代码，就无法控制应用，就没有能力维护它，且在调试时会遇到很大的困难。

**不要使用不理解的向导代码**
