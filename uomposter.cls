%% Unofficial University of Manchester Poster Class
%% ------------------------------------------------
%% Copyright (C) Andrew Mundy 2013
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uomposter}%
[2013/10/16 Unofficial poster class for the University of Manchester]

%% Load the `article` class
\LoadClass{article}

%% Set up the geometry, this will eventually be parameterized
\newlength{\@pad}
\setlength{\@pad}{10mm}
\RequirePackage[%
	a2paper, top=\@pad, bottom=\@pad, right=\@pad, left=\@pad]%
	{geometry}
\pagestyle{empty}

%% Colours
\RequirePackage{xcolor}
%% The University of Manchester Colours
\definecolor{uompurple}{HTML}{660099}
\colorlet{uompurple100}{uompurple!100!white}
\colorlet{uompurple75}{uompurple!75!white}
\colorlet{uompurple50}{uompurple!50!white}
\colorlet{uompurple25}{uompurple!25!white}
\colorlet{uompurple10}{uompurple!10!white}
\colorlet{uompurple5}{uompurple!5!white}

\definecolor{uomyellow}{HTML}{FFCC33}
\colorlet{uomyellow100}{uomyellow!100!white}
\colorlet{uomyellow75}{uomyellow!75!white}
\colorlet{uomyellow50}{uomyellow!50!white}
\colorlet{uomyellow25}{uomyellow!25!white}
\colorlet{uomyellow10}{uomyellow!10!white}
\colorlet{uomyellow5}{uomyellow!5!white}

\definecolor{uomgrey}{HTML}{999999}
\colorlet{uomgrey100}{uomgrey!100!white}
\colorlet{uomgrey75}{uomgrey!75!white}
\colorlet{uomgrey50}{uomgrey!50!white}
\colorlet{uomgrey25}{uomgrey!25!white}
\colorlet{uomgrey10}{uomgrey!10!white}
\colorlet{uomgrey5}{uomgrey!5!white}

\colorlet{contentgray}{black!75!white}
\color{contentgray}

%% Require TikZ
\RequirePackage{tikz}

%% Fonts
\RequirePackage[default,type1]{sourcesanspro}

%% Logo configuration
\newlength{\logo@width}
\newlength{\logo@height}
\newlength{\logo@pad}

\setlength{\logo@width}{40mm}
\setlength{\logo@height}{0.4347\logo@width}
\setlength{\logo@pad}{0.3213\logo@height}
\addtolength{\logo@pad}{-\@pad}

\RequirePackage{graphicx}

\newlength{\logo@pagewidth}
\setlength{\logo@pagewidth}{\logo@pad}
\addtolength{\logo@pagewidth}{\logo@width}

\newlength{\title@width}
\setlength{\title@width}{\textwidth}
\addtolength{\title@width}{-\logo@pagewidth}
\addtolength{\title@width}{-\@pad}
\addtolength{\title@width}{-1em}

\newlength{\title@preskip}
\setlength{\title@preskip}{0.3213\logo@height}

%% Override Maketitle
\newcommand{\@authoremail}{}
\newcommand{\@supervisor}{}
\newcommand{\@supervisoremail}{}
\newcommand{\@cosupervisor}{}
\newcommand{\@cosupervisoremail}{}
\newcommand{\@institute}{}
\newcommand{\authoremail}[1]{\renewcommand{\@authoremail}{#1}}
\newcommand{\supervisor}[2]{\renewcommand{\@supervisor}{#1}\renewcommand{\@supervisoremail}{#2}}
\newcommand{\cosupervisor}[2]{\renewcommand{\@cosupervisor}{#1}\renewcommand{\@cosupervisoremail}{#2}}
\newcommand{\institute}[1]{\renewcommand{\@institute}{#1}}

\renewcommand{\maketitle}{%
	\noindent%
	\vspace*{\logo@pad}
	\vskip0cm
	\hspace*{\logo@pad}
	%% Position the logo on the background
	\begin{minipage}{\logo@width}
		\includegraphics[width=\logo@width]{TAB_col_white_background}%
	\end{minipage}
	\hspace*{\logo@pad}%
	\hspace*{\@pad}%
	\begin{minipage}[t]{\title@width}
		{\Huge\addtolength{\title@preskip}{-42pt}%
		\vspace*{\title@preskip}}
		%% Add the title information
		\raggedright{\Huge\@title}\scriptsize\vskip\baselineskip

		%% Add the author / supervisor / co-supervisor information
		\begin{minipage}[c]{.33\textwidth}\color{uomgrey}
			\centering\textbf{\@author}\\
			\color{uomgrey50}\@authoremail
		\end{minipage}%
		\begin{minipage}[c]{.33\textwidth}\color{uomgrey}
			\centering\textit{\color{uomgrey75}Supervisor}\hspace*{1ex}\textbf{\@supervisor}\\
			\color{uomgrey50}\@supervisoremail
		\end{minipage}%
		\begin{minipage}[c]{.33\textwidth}\color{uomgrey}
			\centering\textit{\color{uomgrey75}Co-Supervisor}\hspace*{1ex}\textbf{\@cosupervisor}\\
			\color{uomgrey50}\@cosupervisoremail
		\end{minipage}
		\vskip.5\baselineskip
		\centering{\color{uomgrey50}\@institute}
		\vspace*{\baselineskip}
	\end{minipage}\\
	%% Draw dots across the bottom of the title
	\hspace*{-.5\@pad}%
	\begin{pgfpicture}
		\color{uomgrey50}
     		\pgfsetlinewidth{4pt}
        	\pgfsetroundcap
               	\pgfsetdash{{0pt}{10pt}}{0cm}
		
               	\pgfpathmoveto{\pgfpoint{-.5\@pad}{0mm}}
               	\pgfpathlineto{\pgfpoint{\textwidth+.5\@pad}{0mm}}
	
               	\pgfusepath{stroke}
	\end{pgfpicture}%
	\vspace*{2\baselineskip}
}

%% Column environment
\newenvironment{column}[1]{%
	\begin{minipage}[t]{#1}
}{%
	\end{minipage}
}

%% Renew font sizes
\renewcommand{\tiny}{\fontsize{10pt}{1ex}\selectfont}
\renewcommand{\scriptsize}{\fontsize{12pt}{1ex}\selectfont}
\renewcommand{\footnotesize}{\fontsize{14pt}{1ex}\selectfont}
\renewcommand{\small}{\fontsize{16pt}{1ex}\selectfont}
\renewcommand{\normalsize}{\fontsize{18pt}{1em}\selectfont}
\renewcommand{\large}{\fontsize{20pt}{1em}\selectfont}
\renewcommand{\Large}{\fontsize{22pt}{1em}\selectfont}
\renewcommand{\LARGE}{\fontsize{24pt}{1em}\selectfont}
\renewcommand{\huge}{\fontsize{28pt}{1em}\selectfont}
\renewcommand{\Huge}{\fontsize{48pt}{48pt}\selectfont}

%% No indent, EVER
\setlength{\parindent}{0mm}
