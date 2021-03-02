# vscode-flex-bison-workspace
一个简单、开箱即用的vscode编译原理学习环境(flex&amp;bison) 

## 简介&背景

​	编译原理应该是计算机专业学生的必修课了，我上这门课的时候(19年)要求使用lex和yacc去自己实现词法分析和语法分析，但是老师介绍的软件过于古老，没有好看的界面，兼容性也成大问题，于是我想到了使用vscode作为编辑器，再加上[CodeRunner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)和[Flex&Bison](https://aquamentus.com/flex_bison.html)去构建以一个更方便的编译原理实验环境。

## 依赖

- VSCode
- CodeRunner插件
- GCC
- PowerShell *(可选，用于运行一些功能性脚本)

## 使用

首先

``git clone https://github.com/LonelyInstantN/vscode-flex-bison-workspace.git``

克隆本项目到本地。

然后用VSCode打开仓库文件夹。

*(可选)用`init.ps1`脚本创建新项目的文件夹

或进入`example`文件夹中编辑器打开`.l`文件，按快捷键`Ctrl+Alt+N`运行，命令行中会提醒是否清理之前临时文件的提示，确认后会自动调用`tool`文件夹中的flex&bison生成词法&语法分析器的代码，并自动调用GCC编译，最后会直接运行编译好的Parser，直接在命令行中输入即可。

## 目录结构

        ...
        │   clean.ps1 		//clean脚本 在具体项目文件夹下使用
        │   init.ps1		    //创建新项目脚本 在本仓库根目录
        │
        ├───.vscode
        │       settings.json	//VSCode配置文件，CodeRunner运行脚本也在这里
        │
        ├───example		//示例 加减乘除表达式解析
        │       exp.l
        │       exp.y
        │
        ├───template	//两种文件的模板
        │       __.l
        │       __.y
        │
        └───tool		//flex&bison程序和依赖
                bison.exe
                bison.hairy
                Bison.htm
                bison.simple
                flex.exe
                flex.htm

#### 注意，本项目脚本较依赖文件结构，若想开箱即用请注意脚本的使用路径且不要破坏文件结构

## 贡献

​	我估计也没什么人会想贡献这个吧...有问题就issue，想改进就fork好了。
