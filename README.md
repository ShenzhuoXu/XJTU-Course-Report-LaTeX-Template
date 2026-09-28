<div align="center">

# XJTU Course Report LaTeX Template

一份简洁、现代、西安交通大学视觉风格的课程报告 LaTeX 模板。

![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX-008080?style=flat-square&logo=latex)
![CTeX](https://img.shields.io/badge/Chinese-ctexart-b31b1b?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-2f855a?style=flat-square)
![Status](https://img.shields.io/badge/status-ready%20to%20write-2f855a?style=flat-square)

</div>

## 项目简介

这是一个面向西安交通大学课程报告、实验报告、课程论文与读书报告的 LaTeX 模板。模板基于 `ctexart`，默认支持中文排版，并提供了完整的封面、摘要、目录、页眉页脚、章节样式、表格、公式与参考文献示例。

如果你希望快速写出一份结构清楚、版面干净、风格统一的课程报告，可以直接从 `main.tex` 开始修改。

仓库同时提供一个 **thesis 版本**：把样式抽成 `xjtu-thesis.cls`，正文独立为 `thesis.tex`。两者视觉风格完全一致，区别只在于样式是否与正文分离。`main.tex` 与 thesis 版本互相独立，可任选其一使用。

## 特色

- `XJTU` 风格封面：包含校名、校徽区域、课程信息表与报告标题。
- 中文友好：基于 `ctexart`，适合中文课程报告写作。
- 结构完整：内置摘要、关键词、目录、正文、结果分析、总结与参考文献。
- 版式清爽：统一配色、页眉页脚、章节标题与行距设置。
- 常用元素齐全：提供数学公式、对齐公式、三线表与参考文献条目示例。
- 可继续扩展：已引入 `tcolorbox`、`booktabs`、`longtable`、`svg` 等常用宏包。

## 快速开始

1. 克隆或下载本仓库。
2. 打开 `main.tex`。
3. 修改报告基本信息：

```tex
\newcommand{\ReportTitle}{课程报告题目}
\newcommand{\CourseName}{课程名称}
\newcommand{\StudentName}{你的名字}
\newcommand{\StudentID}{你的学号}
\newcommand{\School}{你的学院}
\newcommand{\Major}{你的专业}
\newcommand{\ClassName}{你的班级}
\newcommand{\Instructor}{你的指导教师}
\newcommand{\DateInfo}{\today}
```

4. 将正文示例替换为自己的内容。
5. 使用 XeLaTeX 编译。

```bash
xelatex main.tex
xelatex main.tex
```

如果你安装了 `latexmk`，也可以使用：

```bash
latexmk -xelatex main.tex
```

## 使用 thesis 版本

如果你希望样式与正文分离，便于长期维护或复用同一套版式，使用 thesis 版本：

```bash
latexmk -xelatex thesis.tex
```

`thesis.tex` 只写内容，样式全部在 `xjtu-thesis.cls` 中。开头的信息填写部分用 `\renewcommand` 覆盖文档类中的默认值：

```tex
\renewcommand{\ReportTitle}{课程报告题目}
\renewcommand{\DocType}{课程报告}          % 如「作业论文」「实验报告」
\renewcommand{\CourseName}{课程名称}
\renewcommand{\School}{你的学院}
\renewcommand{\Major}{你的专业}
\renewcommand{\ClassName}{你的班级}
\renewcommand{\StudentName}{你的名字}
\renewcommand{\StudentID}{你的学号}
\renewcommand{\Instructor}{你的指导教师}
\renewcommand{\DateInfo}{\today}
```

几个可选的定制点：

| 变量 / 选项 | 作用 |
| --- | --- |
| `\DocType` | 封面灰底框与页眉左侧显示的文字，默认「课程报告」 |
| `\LogoPath` | 封面校徽路径，默认 `figs/logo.png` |
| `\CoverFooter` | 封面底部居中灰色小字，默认留空（即不显示） |
| `svg` 类选项 | `\documentclass[svg]{xjtu-thesis}` 启用 `svg` 宏包以插入 SVG 图片，需要本机安装 Inkscape |

页码切换由文档类提供的 `\frontpages`（罗马数字，用于摘要与目录）与 `\mainpages`（阿拉伯数字，用于正文）两个命令控制，正文中无需再手写 `\pagenumbering`。

> thesis 版本保持「节」级结构（1 / 1.1），与 `main.tex` 一致，不包含 `\chapter`。

## 推荐环境

- TeX Live、MacTeX 或 MiKTeX
- XeLaTeX
- Inkscape，可选，仅当你需要插入或转换 SVG 图片时使用

模板使用了 `ctexart`，因此建议优先使用 XeLaTeX 编译，不建议直接使用 pdfLaTeX。

## 目录结构

当前项目结构非常轻量：

```text
.
├── LICENSE
├── README.md
├── .gitignore
├── main.tex              # 课程报告模板（单文件，样式与内容在一起）
├── thesis.tex            # thesis 版本正文（只写内容）
├── xjtu-thesis.cls       # thesis 版本样式类
└── figs/
    └── logo.png
```

其中：

- `main.tex` 是课程报告模板主文件，样式与内容都在其中。
- `thesis.tex` 是 thesis 版本的正文文件，需要配合 `xjtu-thesis.cls` 使用。
- `xjtu-thesis.cls` 是 thesis 版本的样式类，由 `main.tex` 的导言区抽取而来。
- `figs/logo.png` 是封面使用的校徽图片资源。
- `figs/` 建议继续用于存放报告中的图片素材。

## 注意事项

当前 `main.tex` 中封面图片路径写为：

```tex
\includegraphics[width=0.72\textwidth]{figs/logo.png}
```

因此请确保校徽图片位于 `figs/logo.png`。如果编译时提示找不到图片，可以检查文件名大小写、图片格式以及相对路径是否一致。thesis 版本中该路径由 `\LogoPath` 控制，默认值相同。

关于 SVG：`main.tex` 会无条件加载 `svg` 宏包，因此若需插入 SVG 图片，请确保本机已安装 Inkscape 且命令行可访问 `inkscape`。thesis 版本默认**不**加载该宏包，仅在传入 `svg` 类选项时才启用，因此未安装 Inkscape 也不影响编译。

关于封面：`main.tex` 与 thesis 版本的封面左上角都只排校徽图片，没有额外的校名文字块——新版 `figs/logo.png` 图片本身已含校名。原模板曾在此处另排一行「西安交通大学 / Xi'an Jiaotong University」文字，该段代码仍以注释形式保留在 `main.tex` 中，如需恢复，取消注释即可。


## 来源与致谢

本项目 fork 自 [lnscq/XJTU-Course-Report-LaTeX-Template](https://github.com/lnscq/XJTU-Course-Report-LaTeX-Template)，原作者为 **lnscq**。原项目的模板设计、封面版式与配色方案均出自原作者之手。

本仓库在此基础上新增了 thesis 版本（`xjtu-thesis.cls` + `thesis.tex`），并更新了校徽图片与说明文档。感谢原作者的开源工作。

## License

本项目基于 [MIT License](LICENSE) 开源，允许自由使用、修改与分发。使用时请保留原许可证声明。版权归原作者 **lnscq** 与本仓库维护者 **ShenzhuoXu** 共同所有，具体见 [LICENSE](LICENSE)。

请注意：仓库中的校徽等西安交通大学校方资源**不在 MIT 授权范围内**。原始图片资源来源于西安交通大学官方资源，无意侵犯任何著作权利，如有疑问请随时联系。
