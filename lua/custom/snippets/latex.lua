-- lua/custom/snippets/latex.lua

local ls = require("luasnip")
local s = ls.snippet
local parse = ls.parser.parse_snippet

return {
  s("article",
    parse(nil, [[ 
\documentclass[12pt,a4paper]{article}

% ===================== Packages =====================
\usepackage{graphicx}   % For including images
\usepackage{geometry}   % For controlling margins
\usepackage{setspace}   % For line spacing
\usepackage{fancyhdr}   % For header and footer
\usepackage{hyperref}   % For hyperlinks
\usepackage{titlesec}   % For customizing section titles
\usepackage{times}      % Use Times New Roman font

% ===================== Page Setup =====================
\geometry{top=2cm, bottom=2cm, left=2.5cm, right=2.5cm}
\setstretch{1.3}

% ===================== Footer =====================
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}

% ===================== Start Document =====================
\begin{document}

% --------- Cover Page ---------
\begin{titlepage}
\centering
% Cover image (top half of the page)
\vspace*{-3cm} % Push the image to start from the very top
\makebox[\textwidth]{\includegraphics[width=\paperwidth,height=0.4\paperheight]{images/${1:linux.png}}}
[1.5cm]

% Badge image
{\raggedright\href{https://academy.hackthebox.com/achievement/badge/8a257160-feeb-11ed-acfc-bea50ffe6cb4}{\includegraphics[width=0.25\textwidth]{images/${2:our-favorite-seabird.png}}}}
[1cm]

% Module title
{\Huge \textbf{\mbox{${3:Linux Fundamentals}}}}
[0.5cm]

% Additional information
{\Large Prepared by: ${4:Ahmed Samy}}
[0.2cm]
{\Large ${5:Ronin3s}}
[0.5cm]
{\large HackTheBox Academy}
[1cm]

\vfill
\end{titlepage}

% --------- Table of Contents ---------
\tableofcontents
\newpage

% --------- Main Content ---------
\section{Introduction}
Start writing the introduction of your module or summary here.

\section{Key Concepts}
Write the key concepts or main ideas covered in the module.

\section{Notes}
Add your personal notes, remarks, or practical examples.

\end{document}
]])
  )
}