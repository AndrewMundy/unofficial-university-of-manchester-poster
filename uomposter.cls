%% Unofficial University of Manchester Poster Class
%% ------------------------------------------------
%% Copyright (C) Andrew Mundy 2013
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uomposter}%
[2013/10/16 Unofficial poster class for the University of Manchester]

%% Options
\newcommand{\@papersize}{a1paper}
\newlength{\@pad}
\setlength{\@pad}{20mm}

\newlength{\logo@width}
\setlength{\logo@width}{80mm}

\DeclareOption{a2paper}{%
  \renewcommand{\@papersize}{a2paper}
  \setlength{\@pad}{10mm}
  \setlength{\logo@width}{60mm}
}
\DeclareOption{a3paper}{%
  \renewcommand{\@papersize}{a3paper}
  \setlength{\@pad}{10mm}
  \setlength{\logo@width}{40mm}
}

\ProcessOptions

%% Load the `article` class
\LoadClass[20pt]{extarticle}

%% Set up the geometr
\RequirePackage[%
	\@papersize, top=\@pad, bottom=\@pad, right=\@pad, left=\@pad]%
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

\colorlet{contentgray}{black!85!white}
\color{contentgray}

%% Require TikZ
\RequirePackage{tikz}

%% Fonts
\RequirePackage[default,type1]{sourcesanspro}
\RequirePackage{ragged2e}
\RaggedRight

%% Logo configuration
\newlength{\logo@height}
\newlength{\logo@pad}

\setlength{\logo@height}{0.4347\logo@width}
\setlength{\logo@pad}{0.7391\logo@height}
\addtolength{\logo@pad}{-\@pad}

\RequirePackage{graphicx}

\newlength{\logo@pagewidth}
\setlength{\logo@pagewidth}{\logo@pad}
\addtolength{\logo@pagewidth}{\logo@width}

\newlength{\title@width}
\setlength{\title@width}{\textwidth}
\addtolength{\title@width}{-\logo@pagewidth}
\addtolength{\title@width}{-2\@pad}

\newlength{\title@preskip}
\setlength{\title@preskip}{0.3213\logo@height}

%% Purple dots
\newcommand{\uomdots}{%
	\begin{pgfpicture}
		\color{uompurple}
    \pgfsetlinewidth{8pt}
    \pgfsetroundcap
    \pgfsetdash{{0pt}{32pt}}{0cm}

    \pgfpathmoveto{\pgfpoint{0mm}{0mm}}
    \pgfpathlineto{\pgfpoint{\textwidth}{0mm}}

    \pgfusepath{stroke}
	\end{pgfpicture}%
}

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
  \hspace*{\logo@pad}%
	%% Position the logo on the background
	\begin{minipage}{\logo@width}
    \vspace*{\logo@pad}%
		\includegraphics[width=\logo@width]{TAB_col_white_background}%
	\end{minipage}
	\hspace*{\logo@pad}%
	\hspace*{\@pad}%
  \begin{minipage}[t]{\title@width}
    \vspace*{.75\logo@pad}
		%% Add the author / supervisor / co-supervisor information
		\begin{minipage}[c]{.50\textwidth}\color{uomgrey}
			\textbf{\@author}\\
			\color{uomgrey50}\@authoremail
		\end{minipage}%
		\begin{minipage}[c]{.25\textwidth}\color{uomgrey}
			{\color{uomgrey50}Supervisor}\\
      \textbf{\color{uomgrey75}\@supervisor}
		\end{minipage}%
		\begin{minipage}[c]{.25\textwidth}\color{uomgrey}
			{\color{uomgrey50}Co-Supervisor}\\
      \textbf{\color{uomgrey75}\@cosupervisor}
		\end{minipage}
		\vspace*{2\baselineskip}

		%% Add the title information
		{\Huge\addtolength{\title@preskip}{-42pt}%
		\vspace*{\title@preskip}}
    \raggedright{
      \fontsize{64pt}{72pt}\fontseries{bx}\selectfont%
      \color{uompurple}%
      \@title%
    }
		\vspace*{\title@preskip}
	\end{minipage}\\
	%% Draw dots across the bottom of the title
  \uomdots
  \vspace*{\title@preskip}
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
\renewcommand{\normalsize}{\fontsize{22pt}{24pt}\selectfont}
\renewcommand{\large}{\fontsize{24pt}{26pt}\selectfont}
\renewcommand{\Large}{\fontsize{28pt}{30pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{32pt}{34pt}\selectfont}
\renewcommand{\huge}{\fontsize{36pt}{38pt}\selectfont}
\renewcommand{\Huge}{\fontsize{48pt}{50pt}\selectfont}

%% Modify section titles
\RequirePackage{titlesec}
\titlelabel{}  % No labels
\titleformat*{\section}{\LARGE\color{uompurple}\bfseries}

%% No indent, EVER
\setlength{\parindent}{0mm}
\setlength{\parskip}{1cm}
