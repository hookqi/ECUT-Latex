%
%	ECUTPaper.cls
%	@author Husper
% 	@date 2023/10/25
%	@version v0.0.1
%	This template follows thefancypagestyle MIT License
%

%	---	定义的新的类
\def\EP@name{ECUTPaper}
\def\EP@date{2023-10-25}
\def\EP@version{v0.0.1}
\def\EP@introduction{Provide ECUT graduation thesis template}
\ProvidesClass{\EP@name}[\EP@date~\EP@version~\EP@introduction]
\NeedsTeXFormat{LaTeX2e}
%
%	---	定义类的选项
%
\RequirePackage{xstring}%使用条件语句
%字体组
\def\HGP@fontset{}
\def\HGP@noto{}
\DeclareOption{autofont}{}%自动设置字体
\DeclareOption{adobefont} {
	\def\HGP@fontset{,fontset=adobe}
}%使用Adobe 公司的四款中文字体
\DeclareOption{fandolfont} {
	\def\HGP@fontset{,fontset=fandol}
}%使用Fandol 中文字体
\DeclareOption{founderfont} {
	\def\HGP@fontset{,fontset=founder}
}%使用方正公司的中文字体
\DeclareOption{macfont} {
	\def\HGP@fontset{,fontset=mac}
}%使用Mac OS X 系统下的华文字体
\DeclareOption{ubuntufont} {
	\def\HGP@fontset{,fontset=ubuntu}
}%使用Ubuntu 系统下的文泉驿和文鼎字体
\DeclareOption{winfont} {
	\def\HGP@fontset{,fontset=windows}
}%使用简体中文Windows 系统下的中文字体
\DeclareOption{winnewfont} {
	\def\HGP@fontset{,fontset=windowsnew}
}%使用简体中文Windows Vista或之后系统下的中易字体和微软雅黑字体
\DeclareOption{winoldfont} {
	\def\HGP@fontset{,fontset=windowsold}
}%使用简体中文Windows XP或之前系统下的中易字体
\DeclareOption{nofont} {
	\def\HGP@fontset{,fontset=none}
}%不配置中文字体，需要用户自己配置

%页脚样式
\def\HGP@footlinelength{6.7cm}
\DeclareOption{footline}{\def\HGP@footlinelength{6.7cm}}%有页脚线
\DeclareOption{nofootline}{\def\HGP@footlinelength{0cm}}%无页脚线
%引用样式
\def\HGP@citestyle{normal}
\DeclareOption{normalcite}{\def\HGP@citestyle{normal}}%使用正文式引用样式
\DeclareOption{supercite}{\def\HGP@citestyle{super}}%使用上标型引用样式
\def\HGP@citebst{gbt7714-2005}
\DeclareOption{gbtcite}{\def\HGP@citebst{gbt7714-2005}}%使用GBT7714-2005样式
\DeclareOption{gbt15cite}{\def\HGP@citebst{gbt7714-2015}}%使用GBT7714-2015样式
\DeclareOption{tsinghuacite}{\def\HGP@citebst{thuthesis}}%使用清华样式
%查重协助（临时功能）
\DeclareOption{chachong}{\AtBeginDocument{\chachong}}%使用查重协助
\ProcessOptions
\ExecuteOptions{autofont,normalcites,gbtcite}
\relax

\RequirePackage{setspace}%目录设置


%ooooooooooooo00000000000000ooooooooooooo00000000000000ooooooooooooo00000000000000



%
%	---	载入Class
%
\LoadClass[a4paper]{article}
%页面基本设置
\RequirePackage[AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}
\RequirePackage[zihao=-4,UTF8,heading=true\HGP@fontset]{ctex}

%
%	---	定义页边距
%
%执行标准:上边距2.8cm、下边距2.5cm、左边距2.5cm、右边距2.5cm、页眉1.6cm、页脚1.5cm、装订线为0.5cm。
\RequirePackage{geometry}
\geometry{a4paper,left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,headsep=0.6cm,footskip=1cm,headheight=0.6cm,bindingoffset=5mm}
%此处参数注明意义：
%%“页眉顶端距离”= top - headheight - headsep；
%%“页脚底端距离”= bottom - footskip。

%
%	---	定义字体
%
%用于设置非常用字体
\setmainfont{Times New Roman}

%
%	---	定义页眉页脚
%
%使用fancyhdr库
\RequirePackage{fancyhdr}
%设置页眉样式
%使用fancyhdr库
\RequirePackage{fancyhdr}
%设置页眉样式
\newcommand{\headstyle}{
	\fancyhead[L]{\songti \zihao{5}  东华理工大学毕业设计（论文）}
    \fancyhead[R]{\rightmark}
    %\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
}
\renewcommand{\sectionmark}[1]{% 修改sectionmark命令
    \markright{#1}% 设置section标题作为页眉
    \headstyle% 应用自定义的section页眉样式
}
%设置页脚样式
\newcommand{\footstyle}{\fancyfoot[C]{\songti \zihao{5} \thepage}
	%\fancyfoot[L]{\rule[5pt]{\HGP@footlinelength}{0.4pt}}
	%\fancyfoot[R]{\rule[5pt]{\HGP@footlinelength}{0.4pt}}
}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle
%定义一种新的格式叫做main
\fancypagestyle{main}{%
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}

%
%	---	定义标题和段落样式
%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.62}
%设置各个标题样式
%不需要使用part和chapter层级
\ctexset{section={format={\centering \heiti \bfseries \zihao{-2}}}} %节
\newcommand{\sectionbreak}{\clearpage} %小节从新的一页开始
\ctexset{subsection={format={\raggedright \heiti \bfseries \zihao{4}}}} %小节
\ctexset{subsubsection={format={\raggedright \heiti \bfseries \zihao{-4}}}} %小小节
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
	{0ex \@plus1ex \@minus.2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
	{0ex \@plus1ex \@minus .2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\RequirePackage[indentafter]{titlesec}
%设置新的标题层级subsubsubsection
\titleclass{\subsubsubsection}{straight}[\subsubsection]
%设置编号
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
%设置标题样式
\titleformat{\subsubsubsection}{\raggedright \heiti \bfseries \zihao{-4}}{\thesubsubsubsection}{1em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
%设置目录样式
\RequirePackage{tocloft}
%重新设置目录等级，支持hyperref宏包
\RequirePackage{hyperref}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@subparagraph{6}
%参考tocloft，定义\l@subsubsubsection
\newcommand{\l@subsubsubsection}[2]{%
	\ifnum \c@tocdepth > 3 \relax
	\vskip \cftbeforesubsubsubsecskip
	{\leftskip \cftsubsubsubsecindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubsubsubsecindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubsubsubsecnumwidth\relax
		\let\@cftbsnum \cftsubsubsubsecpresnum
		\let\@cftasnum \cftsubsubsubsecaftersnum
		\let\@cftasnumb \cftsubsubsubsecaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubsubsubsecfont #1}\nobreak
		\cftsubsubsubsecfillnum{#2}}%
	\fi}
\newlength{\cftbeforesubsubsubsecskip}
\setlength{\cftbeforesubsubsubsecskip}{\z@ \@plus.2\p@}
\newlength{\cftsubsubsubsecindent}
\newlength{\cftsubsubsubsecnumwidth}
\setlength{\cftsubsubsubsecindent}{7em}
\setlength{\cftsubsubsubsecnumwidth}{4em}
\newcommand{\cftsubsubsubsecfont}{\normalfont}
\newcommand{\cftsubsubsubsecpresnum}{}
\newcommand{\cftsubsubsubsecaftersnum}{}
\newcommand{\cftsubsubsubsecaftersnumb}{}
\newcommand{\cftsubsubsubsecleader}{\normalfont\cftdotfill{\cftsubsubsubsecdotsep}}
\newcommand{\cftsubsubsubsecdotsep}{\cftdotsep}
\newcommand{\cftsubsubsubsecpagefont}{\normalfont}
\newcommand{\cftsubsubsubsecafterpnum}{}
\newcommand{\cftsubsubsubsecfillnum}[1]{%
	{\cftsubsubsubsecleader}\nobreak
		\makebox[\@pnumwidth][\cftpnumalign]{\cftsubsubsubsecpagefont #1}\cftsubsubsubsecafterpnum\par
	}

%重写tocloft相关定义，解决tocloft中无法修改目录等级的问题
\renewcommand*{\l@paragraph}[2]{%
	\ifnum \c@tocdepth > 4 \relax
	\vskip \cftbeforeparaskip
	{\leftskip \cftparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftparanumwidth\relax
		\let\@cftbsnum \cftparapresnum
		\let\@cftasnum \cftparaaftersnum
		\let\@cftasnumb \cftparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftparafont #1}\nobreak
		\cftparafillnum{#2}}%
	\fi}
\renewcommand*{\l@subparagraph}[2]{%
	\ifnum \c@tocdepth > 5 \relax
	\vskip \cftbeforesubparaskip
	{\leftskip \cftsubparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubparanumwidth\relax
		\let\@cftbsnum \cftsubparapresnum
		\let\@cftasnum \cftsubparaaftersnum
		\let\@cftasnumb \cftsubparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubparafont #1}\nobreak
		\cftsubparafillnum{#2}}%
	\fi}
%重新设置缩进
\setlength{\cftparaindent}{11em}
\setlength{\cftparanumwidth}{5em}
\setlength{\cftsubparaindent}{13em}
\setlength{\cftsubparanumwidth}{6em}
%设置目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
%设置附录
\RequirePackage[title,titletoc]{appendix}
\renewcommand{\appendixname}{附录}

%设置标题的引用
\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}

%
%	---	设置脚注格式
%
%脚注每页重新计数
\@addtoreset{footnote}{page}

%
%	---	设置图表格式
%
%设置图表标题的计数方式
\renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@table}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
%设置标题的样式
\RequirePackage{caption}
\DeclareCaptionFont{hust}{\normalsize \heiti}
\captionsetup{labelsep=quad}
\captionsetup{font={hust,singlespacing}}
\captionsetup[figure]{position=bottom,skip={0pt}}
\captionsetup[table]{position=top,skip={0pt}}
\setlength{\textfloatsep}{6pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%重新设置图表autoref
%\newcommand{\figureautorefname}{图}
\def\figureautorefname~#1\null{%
	图~#1~\null
}
%\newcommand{\tableautorefname}{表}
\def\tableautorefname~#1\null{%
	表~#1~\null
}
%使用tabularx库并定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
%添加复杂的表格需求库
\RequirePackage{booktabs}
%设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}
%添加图需要的库
\RequirePackage{graphicx}
%重新定义图和表的浮动环境，使其方便使用
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}

%
%	---	设置公式格式
%
%使用ams的数学库
\RequirePackage{amsmath}
%设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt}
}
%公式编号带章节
\numberwithin{equation}{section}
%重新设置公式autoref
%\newcommand{\equationautorefname}{等式}
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}

%
%	---	定义列表项的样式
%
\RequirePackage{enumitem}
\setlist{noitemsep}

%用于解析参数
\RequirePackage{kvsetkeys}
%添加几个新的文档属性
\def \@degree {}
\def \@major {}
\def \@school {}
\def \@stunum {}
\def \@instructor {}
\def \@englishtitle {}
\def \@englishname {}
\def \@jobtitle {}
\newcommand{\school}[1]{\def \@school {#1}}
\newcommand{\stunum}[1]{\def \@stunum {#1}}
\newcommand{\instructor}[1]{\def \@instructor {#1}}
\newcommand{\englishtitle}[1]{\def \@englishtitle {#1}}
\newcommand{\englishname}[1]{\def \@englishname {#1}}
\newcommand{\major}[1]{\def \@major {#1}}
\newcommand{\degree}[1]{\def \@degree {#1}}
\newcommand{\jobtitle}[1]{\def \@jobtitle {#1}}
%固定长度下划线
\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
%可变长度下划线
\RequirePackage{longtitle}

%
%	---	定义新的标题页面
%
%重置命令maketitle
\renewcommand{\maketitle}[1][12em]{
    \def\EP@titlecolor{ECUT.png}
    \begin{titlepage}
        \begin{center}
            \includegraphics[height=2.67cm]{\EP@titlecolor}\\
            \vspace*{5em}
            {\zihao{-0} \bfseries \songti   毕\kern 1.5em 业\kern 1.5em 论\kern 1.5em  文}\\
            \vspace{5.5em}
            {\zihao{3} \songti  \multilingualTitles
             {\bfseries \@title}
             {\bfseries \@englishtitle}}

            \vspace{6em}
            {\zihao{-3} \songti
                \renewcommand\arraystretch{1.3}
                    \begin{tabular}{cccc}
                    \bfseries 学生姓名 & \dlmu[2cm]{\@author} & \bfseries 申请学位门类 & \dlmu[2.5cm]{\@degree} \\
                    \bfseries 学 \hfill 号   & \multicolumn{3}{c}{\dlmu[8.5cm]{\@stunum}}          \\
                    \bfseries 专 \hfill 业   & \multicolumn{3}{c}{\dlmu[8.5cm]{\@major}}             \\
                   \bfseries 学 \hfill 院   & \multicolumn{3}{c}{\dlmu[8.5cm]{\@school}}            \\
                   \multicolumn{4}{l}{ {\bfseries 指导老师} \kern 0.5em \dlmu[2cm]{李打算} \kern 1em {\bfseries 职称} \kern 0.5em \dlmu[2.5cm]{副教授}}\\

                    \end{tabular}\\
            }
            \vspace{4em}
            {\zihao{3} \songti \@date}\\
        \end{center}
    \end{titlepage}
}
\RequirePackage{amssymb}

%设置命令\statement
\newcommand{\statement}{
	\clearpage
	\thispagestyle{empty}
	\begin{center}
	\kaishu \zihao{3} \bfseries	
    作 \space 者 \space 声 \space 明
	\end{center}
    \vspace{2em}
	\kaishu \zihao{4}
	
    本人以信誉郑重声明：所呈交的学位毕业设计（论文），是本人在指导教师指导下由本人独立撰写完成的，没有剽窃、抄袭、造假等违反道德、学术规范和其他侵权行为。文中引用他人的文献、数据、图件、资料均已明确标注出，不包含他人成果及为获得东华理工大学或其他教育机构的学位或证书而使用过的材料。对本设计（论文）的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本毕业设计（论文）引起的法律结果完全由本人承担。

    本毕业设计（论文）成果归东华理工大学所有。

    特此声明。

    \vspace{4em}
    \rightline{毕业设计（论文）作者（签字）：\hspace{6em}}

    \rightline{签字日期：\hspace{4em} 年 \hspace{2em} 月 \hspace{2em} 日}

	\vspace{4em}
	本人声明：该学位论文是本人指导学生完成的研究成果，已经审阅过论文的全部内容，并能够保证题目、关键词、摘要部分中英文内容的一致性和准确性。	
    \vspace{4em}

	\rightline{学位论文指导教师签名：\hspace{6em}}

	\rightline{签字日期：\hspace{4em} 年 \hspace{2em} 月 \hspace{2em} 日}	
	\clearpage
}

%设置命令\secondcover
\newcommand{\secondcover}{
	\clearpage
	\thispagestyle{empty}
\vspace*{\fill}
	\begin{center}
        {\zihao{2} \heiti \bfseries \@title}

        {\zihao{3} \songti \@author}

        \vspace{1em}

        \emph{\zihao{2} \@englishtitle}

        \emph{\zihao{3} \@englishname}
    \end{center}

\vspace*{\fill}
    \begin{center}
      {\vfill \zihao{3} \heiti \today}
    \end{center}
    \clearpage
}

%
%	---	定义新的中英文摘要环境
%
%中文摘要环境
%执行标准：中文摘要“摘要”之间空两格，小二号黑体、居中，与摘要内容空一行，内容为小四号宋体。
%中文“关键词：”小四号黑体、摘要下方顶格，内容为小四号宋体，各关键词之间有一个分号及空格。
\newenvironment{cnabstract}[1]{
	\clearpage
	\thispagestyle{empty}
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{摘要}
	\begin{center} \heiti  \zihao{-2} 摘 \qquad 要 \end{center}
    \songti \zihao{-4}
}
{
	\vspace{1em}
	\par\noindent {\heiti \zihao{-4} 关键词：} \songti \zihao{-4} \cnkeyword
	\clearpage
}
%英文摘要环境
\newenvironment{enabstract}[1]{
	\clearpage
	\thispagestyle{empty}
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{Abstract}
	\begin{center} \bfseries  \zihao{-2} Abstract \end{center}
	\zihao{-4}
}{
	\vspace{1em}
	\par\noindent {\zihao{-4} \bfseries Key Words: } \zihao{-4} \enkeyword
	\clearpage
}

%
%	---	定义新的目录页面
%
%超链接设置
\hypersetup{
	%colorlinks = true,
	%linkcolor  = black,
	pdfborder = 000,%去掉链接红框
	pdfstartview=FitH%打开页面以窗口宽度显示
}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \zihao{-2} }
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{\cftdotsep} %设置Section引导点
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
\renewcommand{\cftpartfont}{\songti } %设置Part字体
\renewcommand{\cftsecfont}{\songti } %设置Section字体
\renewcommand{\cftsecpagefont}{\songti}
\AtBeginDocument{
	%设置新的生成目录命令
	\let \oldtableofcontents \tableofcontents
	\renewcommand{\tableofcontents}{
		%修改hdr原plain格式
		%\fancypagestyle{main}
		%设置目录hdr和页码选项	
		%\pagestyle{fancy}
        \oldtableofcontents
		%\fancypagestyle{main}
	}
	%旧的命令
	\newcommand{\maketoc}[1][nopagenum]{
		\IfStrEqCase{#1}{{nopagenum}{\tableofcontents[pagenum=false,toc in toc=false]}
			{pagenum}{\tableofcontents[pagenum=true,toc in toc=false]}
			{pagenumtoc}{\tableofcontents[pagenum=true,toc in toc=true]}
		}
	}
}

%
%	---	定义新的致谢环境
%
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{致谢}
	\section*{致谢}
}{
	\clearpage
}
%
%	---	重新定义参考文献页
%
%设置参考文献
\RequirePackage{natbib}
\setcitestyle{numbers,square,comma}
\ctexset{bibname={参考文献}}
