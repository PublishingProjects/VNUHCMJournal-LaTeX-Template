\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper,9pt]{extarticle} % 'exarticle' for changing font size which is unchangable in 'article' class.
\ProvidesClass{definitions/vnuhcmj}[VNUHCM Journal article class]

\usepackage{xcolor}
\usepackage{fontspec}
\usepackage{fancyhdr}
\usepackage{calc}
\usepackage{geometry}
\usepackage{graphicx}
\usepackage{qrcode}
\usepackage[absolute]{textpos}
\usepackage{authblk}
\usepackage{lipsum}
\usepackage[english]{babel}
\usepackage{multicol}
\usepackage{indentfirst}% indent the first paragraph of each section (by default, no indentation for the first paragraph after a section heading).
\usepackage{enumitem}% for customizing itemize environments (no indentation, no extra space between items, etc.)
\usepackage[style=iso]{datetime2}
\usepackage{lastpage}% for getting the total number of pages
\usepackage[
    backend=biber,
    style=numeric,
    autocite=superscript,
    sorting=ynt
]{biblatex}
\usepackage[autostyle=true]{csquotes}% for biblatex to make quotes in the bibliography according to the language.
\usepackage[hidelinks,bookmarksopen]{hyperref}% load hyperref before bookmark to avoid option clash error.
\usepackage{bookmark}
\usepackage{fancyvrb}
\usepackage{ragged2e}% for aligning QR code to the left in the sidebar.
\usepackage{titlesec}

\titleformat{\section}{\normalfont\Large\bfseries\color{blue-600}}{\thesection.}{1em}{}

\definecolor{gray-600}{RGB}{75, 85, 99}
\definecolor{blue-200}{RGB}{191, 219, 254}
\definecolor{blue-600}{RGB}{37, 99, 235}
\definecolor{brown-600}{RGB}{109, 76, 65}
\hypersetup{
    colorlinks=true,
    linkcolor=blue-600,
    urlcolor=blue-600,
    citecolor=blue-600,
    pdftitle={VNUHCM Journal full-text article},
}

\urlstyle{same}

\directlua{require("definitions.vnuhcmj")}

\setmainfont{NotoSans}[
    Path=./definitions/fonts/NotoSans/,
    Extension = .ttf,
    UprightFont = NotoSans-VariableFont,
    BoldFont = NotoSans-VariableFont,
    ItalicFont = NotoSans-Italic-VariableFont,
    BoldItalicFont = NotoSans-Italic-VariableFont,
    BoldFeatures = {RawFeature={axis={wght=700}}},
    BoldItalicFeatures = {RawFeature={axis={wght=700}}}
]

\setsansfont{NotoSans}[
    Path=./definitions/fonts/NotoSans/,
    Extension = .ttf,
    UprightFont = NotoSans-VariableFont,
    BoldFont = NotoSans-VariableFont,
    ItalicFont = NotoSans-Italic-VariableFont,
    BoldItalicFont = NotoSans-Italic-VariableFont,
    BoldFeatures = {RawFeature={axis={wght=700}}},
    BoldItalicFeatures = {RawFeature={axis={wght=700}}}
]

\setmonofont{DejaVuSansMono}[
    Path=./definitions/fonts/DejaVu/,
    Extension = .ttf,
    UprightFont = DejaVuSansMono,
    BoldFont = DejaVuSansMono-Bold,
    ItalicFont = DejaVuSansMono-Oblique,
    BoldItalicFont = DejaVuSansMono-BoldOblique
]

\graphicspath{
    {./definitions/images/}
}

\newlength{\margin}
\setlength{\margin}{2cm}

\newlength{\lmargin}
\setlength{\lmargin}{7cm}

\newlength{\bmargin}
\setlength{\bmargin}{2.5cm}

\newlength{\shift}
\setlength{\shift}{\margin-\lmargin}

\newlength{\minorshift}
\setlength{\minorshift}{-0.3cm}% for minor adjustments in the title and authors box, cite box.

\geometry{a4paper, margin=\margin, lmargin=\lmargin, bmargin=\bmargin, headheight=2cm}

\newcommand{\FirstPageNumber}{1000}
\newcommand{\LastPageNumber}{\pageref{LastPage}}

\newcommand{\JournalTitle}{VNUHCM Journal of Mathematics and Computing Science}
\newcommand{\JournalAbbreviation}{VNUHCM J. Math. Comput. Sci.}
\newcommand{\MakeJournalTitle}{\noindent\normalsize\textbf{\textcolor{brown-600}{\JournalTitle}}}

\newcommand{\ArticleVolumeYear}{\the\year}
\newcommand{\ArticleVolume}{\textunderscore}
\newcommand{\ArticleIssue}{\textunderscore}
\newcommand{\ArticleID}{0000}

\newcommand{\CiteAuthors}{F Last, F Last}
\newcommand{\MakeCiteText}{%
    \CiteAuthors. \textbf{\@title}. \textit{\JournalAbbreviation} \ArticleVolumeYear; \ArticleVolume{}(\ArticleIssue{}):\FirstPageNumber{}-\LastPageNumber{}.
}

\newcommand{\MakeVolumeIsssueText}{\ArticleVolume(\ArticleIssue)}
\newcommand{\MakePageRangeText}{\FirstPageNumber{}-\LastPageNumber{}}
\newcommand{\ArticleType}{Research article}
\fancypagestyle{FirstPageStyle}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0.4pt}%
    \renewcommand{\headsep}{0.5cm}%
    \renewcommand{\headheight}{2cm}%
    \fancyheadoffset[lh]{-\shift}
    \fancyhead[L]{%
        \MakeJournalTitle\quad\normalsize{\textcolor{gray-600}{\textbf{\MakeVolumeIsssueText{}:\:\MakePageRangeText{}}}}\par
        \begin{minipage}[t]{.5\textwidth}%
            \includegraphics[scale=0.06,keepaspectratio]{open-access}%
            \hspace{2pt}%
            \raisebox{0.5\height}{\sffamily\small\textcolor{gray}{full text article}}%
        \end{minipage}%
    }%
    \fancyhead[R]{%
        \raisebox{0.5\height}{%
            \underline{%
                \textit{%
                    {\sffamily\normalsize\textbf{\textcolor{gray-600}{\ArticleType}}}%
                }%
            }%
        }%
    }
    \fancyhead[C]{%
    }
    \fancyfoot[L]{%
        \colorbox{blue-200}{%
            \begin{minipage}{\textwidth+\minorshift}%
                \textbf{Cite this:}\quad\MakeCiteText
            \end{minipage}
        }
    }
    \fancyfoot[R]{%
        \par%
        \vspace{0.8cm}%
        {\sffamily\bfseries\color{blue-600}\thepage}
    }
}

\fancypagestyle{PageStyle}{%
    \fancyhf{}%
    \fancyheadoffset[lh]{-\shift}
    %\fancyheadoffset[lh,rh]{0pt}
    \fancyhead[L]{%
        \MakeJournalTitle
    }
    \fancyfoot[L]{\ifodd\thepage{{\sffamily\bfseries\color{blue-600}\thepage}}\else{}\fi}
    \fancyfoot[R]{\ifodd\thepage{}\else{{\sffamily\bfseries\color{blue-600}\thepage}}\fi}
}

\definecolor{blue-200}{RGB}{231, 236, 247}
\newcommand{\KeywordsLabel}{Keywords}
\newcommand{\AbstractLabel}{Abstract}
\newcommand{\KeywordsText}{}
\newcommand{\AbstractText}{}
\renewcommand{\abstract}[1]{%
    \renewcommand{\AbstractText}{#1}
}
\newcommand{\keywords}[1]{%
    \renewcommand{\KeywordsText}{#1}
}

\newcommand{\AuthorsText}{\directlua{
    tex.sprint(get_authors_text(authors, author_affiliation_indices))
}}

\newcommand{\MakeArticleTitle}{\noindent\huge\bfseries\textcolor{blue-600}{\@title}}
\newcommand{\MakeAuthorsText}{\noindent\normalsize\mdseries\AuthorsText}

\newcommand{\QRUrl}{https://mcs.scienceandtechnology.com.vn/index.php/mcs/article/view/\ArticleID}
\newcommand{\MakeQRCode}{%
    \begin{minipage}[t]{-\shift - 0.2cm}%
        \vspace{0pt}%
        \begin{FlushLeft}%
            %\hspace{10pt}%
            %\includegraphics[width=2cm,keepaspectratio]{Article_QR_Code}%
            \qrcode[height=2cm]{\QRUrl}%
            %\vspace{-10\ArticleURLpt}
            \par%
        \end{FlushLeft}
    \end{minipage}%
}

\newcommand{\MakeTitleAndAuthorsBox}{%
    \hspace{\shift}%
    \begin{minipage}{\textwidth+-\shift+\minorshift}%
        \MakeArticleTitle{}%
        \par\vspace{0.5cm}%
        \MakeAuthorsText{}%
    \end{minipage}%
}

\newcommand{\MakeAbstract}{%
    \noindent%
    \MakeTitleAndAuthorsBox\par
    \vspace{0.5cm}
    \noindent
    \hspace{\shift}%
    \MakeQRCode
    {\setlength{\fboxsep}{10pt}%
        \colorbox{blue-200}{%
            \begin{minipage}[t]{\textwidth-0.6cm}% adjust the width of the abstract box to prevent overflow.
                \vspace{0pt}%
                {\sffamily\Large\bfseries\color{blue-600}\AbstractLabel}\par%
                \vspace{3pt}%
                {\AbstractText}\par%
                \vspace{10pt}%
                {\bfseries\KeywordsLabel:} \KeywordsText
            \end{minipage}
    }}
}

\newcommand{\Correspondences}{%
    \noindent%
    \raggedright%
    \directlua{
        tex.sprint(
            get_correspondences(authors)
        )
    }%
}

\newcommand{\MakeCorrespondencesText}{%
    \textbf{Correspondence to}: \Correspondences
}

\newcommand{\Affiliations}{\directlua{
    tex.sprint(get_affiliations(affiliations))
}}

\newcommand{\ArticleDOI}{10.32508/vnuhcmjmcs.v\ArticleVolume i\ArticleIssue .\ArticleID}
\newcommand{\ArticleReceivedDate}{\today}
\newcommand{\ArticleRevisedDate}{}
\newcommand{\ArticleAcceptedDate}{}
\newcommand{\ArticlePublishedDate}{}

\newcommand{\MakeArticleHistory}{
    \textbf{Received:} \ArticleReceivedDate\newline
    \textbf{Revised:} \ArticleRevisedDate\newline
    \textbf{Accepted:} \ArticleAcceptedDate\newline
    \textbf{Published:} \ArticlePublishedDate
}
\newcommand{\MakeJournalCopyright}{\textcopyright \the\year{} by the authors. Licensee VNUHCM Journal. This article is an open access article distributed under the terms of the \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution License (CC-BY 4.0)}.}

\newcommand{\MakeArticleDOIText}{\textbf{DOI:} \ArticleDOI}
\newcommand{\CrossmarkURL}{https://crossmark.crossref.org/dialog/?doi=\expanded{\ArticleDOI}\&domain=pdf&date_stamp=\ArticlePublishedDate}
\newcommand{\MakeCrossmarkButton}{%
    \href{\expanded{\CrossmarkURL}}{\includegraphics[scale=0.45, keepaspectratio]{crossmark}}
}

\newcommand{\MakeSideBar}{%
    \noindent%
    \newcommand{\SideBarWidth}{-\shift-0.5cm}%
    \begin{textblock*}{\SideBarWidth}(\margin, 0cm)% 
        \noindent%
        \begin{minipage}[t][\paperheight-\margin+1.4cm][t]{\SideBarWidth}%
            \small
            \vspace*{\fill}% pull the textblock to the bottom of the page
            \rule{\SideBarWidth}{0.5pt}\par%
            \Affiliations\par\vspace{0.5cm}%
            \MakeCorrespondencesText\par\vspace{0.5cm}%
            \MakeArticleHistory\par\vspace{0.5cm}%
            \MakeArticleDOIText\par\vspace{0.5cm}%
            \MakeCrossmarkButton\par\vspace{0.5cm}%
            \MakeJournalCopyright
        \end{minipage}
    \end{textblock*}
}
