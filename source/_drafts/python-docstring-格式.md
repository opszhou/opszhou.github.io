---
title: python docstring 格式
date: {{ date }}
id: python-docstring-formats
tags: 
  - python
categories: python
---

# python docstring 的几种常见格式

## 介绍

对于项目而言，拥有良好的文档或至少有文档非常重要。特别是库或者是要集成到其他程序中的模块。用户应该可以访问功能及其参数的描述。

幸运的是，`Python`提供了非常强大的机制，动态地提取对象和函数中的文档。此外，像`Sphinx`这样的工具可以分析`docstrings`生成`Web`文档。

网上有一些关于`Python`文档管理的资料,`[PEP8](http://legacy.python.org/dev/peps/pep-0008/#documentation-strings)`, `[PEP257](http://legacy.python.org/dev/peps/pep-0257/)`, `[python开发指南](https://devguide.python.org/documenting/)`，或者[这个](http://docs.python-guide.org/en/latest/writing/documentation)。但是，没有太多关于`docstring`格式的总结。

在这篇文章中，您可以找到几种常见`docstring`格式和例子。


## Docstrings 

首先，`docstring`即'文档字符'，这是`Python`中的一种特殊的注释。

`docstrings`是用来描述`Python`元素的（函数，类，方法，变量）。开发人员在写`docstrings`时应该遵循一种特定语法约定。`docstrings`不仅针对开发人员，也针对用户。

`PEP8`提供了非常简要`docstrings`概念，`PEP257`也没有做到这些，只是一些示例（语法并不常见）。

### 常见格式

让我们看看`Python`文档字符串的主要可用语法格式：

**`reStructuredText`**，可能是最流行的`Python` `docstrings`格式，也有几种形式，主要用于与`Sphinx`的结合。请注意，此格式用于`Python`文档。
**`Epytext`**（基于`Javadoc`），很多年前用于`Python`，现在仍然可以找到这样用的。
**`Google style`**，主要有几个部分构成。
`Numpydoc`，看起来像`Google style`，主要用于`numpy`相关项目（但不仅仅是）

### `Python`内置的文档读取方法

运行`Python`解释器时，你可以使用函数`help()`获得有关模块的帮助信息或以`dosctrings`记录的任何其他内容：

```python
>>> import os 
>>> help(os)
```

也可以通过访问`__doc__`属性（对应于其`docstring`）来获取元素的描述：

```python
>>> import os 
>>> print os.path.__doc__
```

### 第三方文档生成器

由于`Python`知道如何提取`docstrings`向用户提供文档，因此外部工具可以通过解析模块生成`Python`文档。

例如，`Doxygen`通过解析代码一级解析在函数之前放置的格式化注释为`C / C ++`程序生成`HTML`页面（以及许多其他输出格式）。它也可以管理`Python`语言，但它并没有真正适配`Sphinx`。`Java`拥有自己的文档生成器`Javadoc` ，它曾经是[`Epydoc for Python`](http://epydoc.sourceforge.net/) 的灵感来源。

**Sphinx**

最流行的`Python`文档生成器是`Sphinx`。它将`reStructuredText`文档字符串格式输入转换为许多可能的输出格式，如`HTML`，`PDF`，`LaTeX`，`manuals`。还有一些插件允许使用其他格式，如`Numpydoc`，`Google`，等等。这是[例子](https://pythonhosted.org/an_example_pypi_project/sphinx.html)

**Epydoc**
一个古老的流行文档生成器是Epydoc，它将Epytext 文档字符串格式（基于Javadoc）转换为输出可读格式为HTML。

## 主要格式说明

如前所述，在`docstrings`中有几种​​可用的格式可以用来构建代码文档。下面是一些上述格式以及如何使用它们的一些示例。

1. **reStructuredText**

   - Descritption
   
      由于Sphinx默认使用这种格式，因此它是Python文档字符串中非常流行的格式。

      这是一个非常广泛的范围，不仅适用于文档字符串。`reST`格式被广泛用作`Markdown`格式的文档（`Github`，`Pelican`，`wiki`，...）。请注意，此博客 - 以及您当前正在阅读的行 - 是由`Pelican`使用`reStructured Text`格式生成的。

   - Parameters
   
      `reStructuredText`格式非常广泛。因此，可以用几种方式表示事物。参数及其类型就是这种情况。当然，您只能指定参数。

对于Javadoc格式，参数可以与类型分开表示：

“” 
：param param1：param1的描述
：type param1：str 
“”“
或者可以将参数与其类型一起表示：

“” 
：param param1 str：param1 
“”“的描述
退货价值
返回的内容的描述可以指定如下：

“” 
：“返回：返回的说明
”“”
也可以提供返回的类型：

“” 
：“rtype：str 
”“”
提出异常
应使用raises关键字后跟异常标签及其描述来描述每个异常：

“” 
：引发MyError：我的错误描述
“”“
Numpydoc
Descritption
Numpy建议使用自己的docstring格式，看起来像Google docstring格式，并使用一些reST语法元素。Sphinx有一个接受Numpydoc格式的插件。您可以参考 此文档。

参数
参数在名为Parameters的公共部分中指定。对于每个需要的参数，您应该指定其名称，空格，冒号，然后使用其他选项指定其类型。描述在下面缩进。要参考该参数，您可以使用`来包围它。

有一些例子：

1  “”“ 
2  参数
3  ---------- 
4  param1：int 
5      参数`param1`的描述
.6  param2：{'value1'，'value2'} 
7      具有两个可能值的参数的描述。
8  paramX，paramY：array_like 
9      参数阵列。
10  参数3：STR的列表中，可选
11      。参数`param3`的说明
12      ，它的默认值是[ “值”] 
13  “””
退货价值
对于参数，返回的值在特定部分中进行管理。该部分由关键字“ 返回”和下划线标识。

类型必须在一行中提供，下一行应包含缩进的描述：

msgstr“”“ 
返回
------- 
int 
    返回值的说明
”“”
也可以为返回的值命名：

msgstr“”“ 
返回
------- 
ret1：int 
    返回数字的描述
.ret2：str或None 
    字符串替换的描述。
”“”
提出异常
提升异常部分标记为“提升”，并包含例外列表，其中第二个预期行描述如下：

“” 
引发
------ 
MyError：
    我的错误
    描述MyOtherError：
其他错误的描述
“”“
Googledoc
Descritption
您可以猜测Google文档字符串样式是由谷歌使用和支持的，但不仅如此。它也很受欢迎，并以多种形式使用，Numpydoc是一种。您可以在Google样式指南中找到有关Python注释的信息。你也会在那里找到一些例子。

参数
参数在公共部分Args中指定。参数的类型在括号内提供。关键字optional指定参数具有默认值。要参考该参数，您可以使用`来包围它。

msgstr“”“ 
Args：
  param1（int）：参数`param1`的描述.param2 
  （str，optional）：参数描述。默认为None。
”“”
退货价值
返回值的一个部分名为Returns，然后列出返回的描述，从返回的类型开始。

msgstr“”“ 
返回：
  bool：根据结果判断为真或假。
”“
产量
对于返回的部分，Yields部分与产生的元素相关。

“” 
收益率：
  int：下一个收益率值。
“”
提出异常
提升异常部分标记为“提升”，并包含例外列表，其中第二个预期行描述如下：

“”“ 
举：
  MyError：我的错误，说明这是
    提出
  MyOtherError：一个其他错误的说明
‘’”
的Javadoc / Epytext
Descritption
该Epytext，或的Javadoc风格，从灵感的Java世界的到来之前reStructuredText的格式。几年前，它经常被用于Python文档字符串。该epydoc的软件，在2002年首次发布，但目前已停产，被转换Epytext格式非常相似的Javadoc到HTML或PDF。

参数
描述参数的方式接近reST方式。

msgstr“”“@ 
param param1：param1 
”“”的描述
您还可以指定一个预先确定参数名称的类型：

“”“ 
@type param1：str 
”“”
退货价值
可以提供如下返回的描述：

“”“ 
@return：什么是返回的描述
”“”
也可以提供返回的类型：

“”“ 
@rtype：str 
”“”
提出异常
函数中引发的异常可以使用异常的标签及其描述：

“” 
@raise MyError：我的错误描述
“”“
老学校/定制
你当然可以有自己的方式来编写文档字符串或根本不评论，但它不适合重用，改进，共享......

结论
这是关于文档字符串和主要格式的简短概述。不要犹豫，进一步提供所提供的参考资料和互联网研究。

您还可以探索现有工具（如Sphinx）生成文档或 Pyment（托管在Github上）以生成或转换Python文件的文档字符串。