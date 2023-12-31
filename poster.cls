\ProvidesClass{poster}[The intermediate fair has never looked better]

\LoadClass[oneside, landscape]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=poster,prefix=poster@}

\newif\ifawesome@english@

\DeclareVoidOption{english}{
	\awesome@english@true
}

\DeclareVoidOption{german}{
	\awesome@english@false
}

\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{smile}}

\ProcessKeyvalOptions*

\ifawesome@english@
	\RequirePackage[english]{babel}
\else
	\RequirePackage[ngerman]{babel}
\fi

\newlength\poster@margin
\poster@margin2cm


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[
	color,
	minted,
	tikz,
	footnote,
	hyperref
]{smile}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}
\RequirePackage[a3paper, landscape, vmargin=\z@, hmargin=\poster@margin, includefoot]{geometry}
\RequirePackage[skip=0.5\baselineskip, indent=\z@]{parskip}
\RequirePackage[tracking, expansion, babel]{microtype}

\RequirePackage{etoolbox}
\patchcmd\paragraph{3.25ex \@plus1ex \@minus.2ex}{\the\parskip plus 1ex minus .5ex}
{\typeout{Patching paragraph worked}}{\ClassWarning{poster}{Patching paragraph did not work}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[default]{FiraSans}
\RequirePackage[lining]{FiraMono}

\linespread{1.15}
\smile@linewidth1.2px

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ensureinfocommand{title}
\ensureinfocommand{author}
\ensureinfocommand{date}
\ensureinfocommand{uni}
\ensureinfocommand{institute}
\ensureinfocommand{location}
\ensureinfocommand{logoleft}
\ensureinfocommand{logoright}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand\maketitle{%
	\begingroup%
	\hspace{-\poster@margin}%
	\fboxsep\z@%
	\fboxrule\z@%
	\fcolorbox{accent}{accent!10}{%
		\begin{minipage}[b]{\paperwidth}%
			\vspace*{2.5ex}%
			\hspace\poster@margin%
			\begin{minipage}{5cm}%
				\raggedright%
				\includegraphics[height=1.2cm]{\@logoleft}
			\end{minipage}%
			\begin{minipage}{\dimexpr\paperwidth-2\poster@margin-10cm}%
				\centering\microtypesetup{tracking=false}% OMFG No tracking on the title sir
				\fontsize{30pt}{30pt}\textsc{\textbf{\@title}}\\[1ex]%
				\large\@author\par%
			\end{minipage}%
			\begin{minipage}{5cm}%
				\raggedleft%
				\includegraphics[height=1.2cm]{\@logoright}
			\end{minipage}%
			\vspace*{2.5ex}%
			\textcolor{accent}{\hrule height \smile@linewidth\relax}%
		\end{minipage}
	}
	\vskip2em\par%
	\endgroup%
}
\renewcommand\@thefoot{%
	\begingroup%
	\hspace{-\poster@margin}%
	\fboxsep\z@%
	\fboxrule\z@%
	\fcolorbox{accent}{accent!10}{%
		\begin{minipage}[b]{\paperwidth}%
			\textcolor{accent}{\hrule height \smile@linewidth\relax}
			\vspace*{0.7ex}%
			\hspace\poster@margin%
			\@date\hfill\@institute\hfill\@uni%
			\hspace\poster@margin%
			\vspace*{0.7ex}%
		\end{minipage}
	}
	\endgroup%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{titlesec}
\titleformat\section{\centering\bfseries\Large}{\thesection}{1em}{}[{\color{accent}\titlerule[\smile@linewidth]}]
\titleformat\subsection{\bfseries\large}{\thesubsection}{1em}{}
\titleformat\paragraph[runin]{\bfseries\color{accent}}{\theparagraph}{1em}{}


\RequirePackage[inline]{enumitem}
\setlist[enumerate]{itemsep=-0.5\parskip, label=(\arabic*)}
\setlist[itemize]{label=\textcolor{accent}{\fullcirc}, itemsep=-0.5\parskip}
\setlist[description]{style=sameline, labelsep=0.5em, itemsep=\dimexpr-\itemsep-\parsep, font=\color{accent}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newtcolorbox{mybox}[3]{boxrule=\smile@linewidth, IfBlankTF={#2}{toprule=2mm}{title=#2},colback=#1!5!white,colframe=#1,left=1em,
lefttitle=4mm, arc=\smile@rounding, enhanced, segmentation engine=path,
segmentation style={solid, shorten >=1em,shorten <=1em, line width=\smile@linewidth}, #3}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[grid]{multicol}
\renewcommand\columnseprulecolor{\color{accent}}
\columnseprule\smile@linewidth
\columnsep3em

\pagestyle{empty}
