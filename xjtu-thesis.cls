%% xjtu-thesis.cls
%% 西安交通大学课程报告 / 作业论文样式类
%%
%% 由 main.tex 的导言区抽取而来，视觉风格与原模板保持一致。
%% 正文文件只写内容，样式全部集中在本类中。
%%
%% 可选选项：
%%   svg    启用 svg 宏包（需要本机安装 Inkscape 且可执行文件在 PATH 中）。
%%          默认不启用，未使用 SVG 插图时无需该依赖。
%%
%% 本类未包含 \chapter，正文保持「节」级（1 / 1.1）结构。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xjtu-thesis}[2026/09/28 XJTU course report / assignment paper style]

% ==================== 选项处理 ====================
\newif\ifxjtu@svg
\xjtu@svgfalse
\DeclareOption{svg}{\xjtu@svgtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

% ==================== 基础文档类 ====================
\LoadClass[12pt,a4paper]{ctexart}

% ==================== 页面与基础宏包 ====================
\RequirePackage[a4paper,margin=2.2cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{amsmath,amssymb}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{abstract}

% svg 宏包按需加载，避免在未安装 Inkscape 的环境中引入无谓依赖
\ifxjtu@svg
  \RequirePackage{svg}
\fi

% ==================== 颜色定义 ====================
\definecolor{xjtuRed}{RGB}{165,30,55}
\definecolor{darkText}{RGB}{45,45,45}
\definecolor{lightGray}{RGB}{245,245,245}
\definecolor{midGray}{RGB}{120,120,120}
\definecolor{lineGray}{RGB}{220,220,220}

% ==================== 超链接 ====================
\hypersetup{
    colorlinks=true,
    linkcolor=xjtuRed,
    urlcolor=xjtuRed,
    citecolor=xjtuRed
}

% ==================== 行距 ====================
\setstretch{1.35}

% ==================== 信息变量（在正文导言区用 \renewcommand 覆盖） ====================
\newcommand{\ReportTitle}{课程报告题目}
\newcommand{\DocType}{课程报告}
\newcommand{\CourseName}{课程名称}
\newcommand{\StudentName}{你的名字}
\newcommand{\StudentID}{你的学号}
\newcommand{\School}{你的学院}
\newcommand{\Major}{你的专业}
\newcommand{\ClassName}{你的班级}
\newcommand{\Instructor}{你的指导教师}
\newcommand{\DateInfo}{\today}
% 封面校徽路径与封面底部小字（留空则不显示）
\newcommand{\LogoPath}{figs/logo.png}
\newcommand{\CoverFooter}{}

% ==================== 页眉页脚 ====================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\textcolor{midGray}{西安交通大学\DocType}}
\fancyhead[R]{\textcolor{midGray}{\leftmark}}
\fancyfoot[C]{\textcolor{midGray}{\thepage\ /\ \pageref{LastPage}}}

% ==================== 标题 ====================
\titleformat{\section}
  {\Large\bfseries\color{xjtuRed}}
  {\thesection}{0.8em}{}

\titleformat{\subsection}
  {\large\bfseries\color{darkText}}
  {\thesubsection}{0.8em}{}

% ==================== 页码切换 ====================
% 摘要与目录用罗马数字，正文用阿拉伯数字
\newcommand{\frontpages}{\pagenumbering{Roman}}
\newcommand{\mainpages}{\pagenumbering{arabic}}

% ==================== 封面 ====================
\newcommand{\makecover}{%
\begin{titlepage}
\thispagestyle{empty}

\vspace*{0.5cm}

\noindent
\begin{minipage}[c]{0.7\textwidth}
    \includegraphics[width=0.72\textwidth]{\LogoPath}
\end{minipage}

\vspace{2.2cm}

\begin{center}
    {\fontsize{26pt}{32pt}\selectfont\bfseries\color{darkText}\ReportTitle}

    \vspace{1.2em}

    \begin{tcolorbox}[
        colback=lightGray,
        colframe=lightGray,
        boxrule=0pt,
        arc=2mm,
        width=0.78\textwidth
    ]
    \centering
    {\Large\bfseries\color{xjtuRed} \DocType}
    \end{tcolorbox}
\end{center}

\vspace{2cm}

\renewcommand{\arraystretch}{1.6}
\begin{center}
\begin{tabular}{p{3.2cm} p{8.5cm}}
课程名称： & \CourseName \\
学\hspace{1cm}院： & \School \\
专\hspace{1cm}业： & \Major \\
班\hspace{1cm}级： & \ClassName \\
姓\hspace{1cm}名： & \StudentName \\
学\hspace{1cm}号： & \StudentID \\
指导教师： & \Instructor \\
日\hspace{1cm}期： & \DateInfo \\
\end{tabular}
\end{center}

\vfill

\begin{center}
\color{midGray}\CoverFooter
\end{center}

\end{titlepage}
}

\endinput
