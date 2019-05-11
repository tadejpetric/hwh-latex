\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hwhProblem}[2019/04/30 v0.1 HWH latex template]

\LoadClass{article}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[a4paper, top=2cm, bottom=2cm]{geometry} % dimensions
\RequirePackage{multicol} % for alignment of challenge info
%\RequirePackage{xcolor}
\RequirePackage{hyperref} % to ensure footnote isn't refd
\RequirePackage[calc]{datetime2} % for date
\RequirePackage{graphicx} % for hwh logo
\RequirePackage{wrapfig} % for alignment of hwh logo


\DTMnewdatestyle{beedate}
{
  \renewcommand*{\DTMdisplaydate}[4]{\DTMtwodigits{##3} \DTMmonthname{##2} ##1}
}

\DTMnewdatestyle{isodate}
{%
  \renewcommand*{\DTMdisplaydate}[4]{##1-\DTMtwodigits{##2}-\DTMtwodigits{##3}}
}
\DTMsetdatestyle{isodate}

\DeclareOption{a4paper}
{%
  \setlength{\paperheight}{297mm}%
  \setlength{\paperwidth}{210mm}
}
\DeclareOption{letterpaper}
{%
  \setlength{\paperheight}{11in}%
  \setlength{\paperwidth}{8.5in}
}
\DeclareOption{beeees}
{% for beeees date style
  \DTMsetdatestyle{beedate}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


\pagenumbering{gobble}

\newcommand{\nostarfootnote}[1]
{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

\renewcommand{\maketitle}[3]
{%
  \pagenumbering{gobble}%
  \hypersetup{pageanchor=false}%
  \noindent\begin{minipage}{\textwidth}
    \begin{wrapfigure}{R}{2cm}
      \includegraphics[width=\linewidth]{hwhlogo.jpg}
    \end{wrapfigure}
    \paragraph{}
    \hspace{-0.33cm}{#1}
    \vspace{0.5cm}\\
    \noindent\textbf{\Large Homework Help Events}
    \vspace{0.2cm}\\
    \textbf{\LARGE ``\@title''}
  \end{minipage}
  \begin{multicols}{2}\noindent%
    \textbf{Date: }\@date \\ \textbf{Level: }{#2}\\
    \textbf{Event: }Challenge \\\textbf{Subject: }{#3}%
  \end{multicols}%
  \vspace{-0.5cm}
  \noindent\textcolor[RGB]{125,125,125}{\rule{0.99\textwidth}{0.8pt}}\\
  \textbf{PROBLEM SET}
  \begin{NoHyper}%
    \nostarfootnote{Created by \@author{} for Homework Help Events}%
  \end{NoHyper}
}