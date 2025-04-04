\ProvidesClass{modular_syllabus}[2025/07/03 modular syllabus class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%   REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage{wasysym}
\RequirePackage{ifsym}
\RequirePackage{xparse}
\RequirePackage{booktabs, colortbl, xcolor}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{ltablex}
\RequirePackage{multirow}
\RequirePackage{lscape}
\RequirePackage{hyperref}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%   MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlist{nolistsep}

\newcolumntype{r}{>{\hsize=0.9\hsize}X}
\newcolumntype{w}{>{\hsize=0.6\hsize}X}
\newcolumntype{m}{>{\hsize=.9\hsize}X}

\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\arraystretch}{2.0}
\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%   COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{green}{HTML}{66FF66}

% Default main color - can be overridden in .tex file
\definecolor{myCOLOR}{HTML}{046D0B}

% Command to set main color from .tex file
\newcommand{\setMainColor}[1]{
  \definecolor{myCOLOR}{HTML}{#1}
}

%----------------------------------------------------------------------------------------
%   SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

% Default sidebar width - can be overridden in .tex file
\newlength{\sidebarWidth}
\setlength{\sidebarWidth}{9cm}

\newcommand{\setSidebarWidth}[1]{
  \setlength{\sidebarWidth}{#1}
}

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

% Command to set profile image size
\newcommand{\setProfileImageSize}[1]{
  \pgfmathsetlength{\imagewidth}{#1}
  \pgfmathsetlength{\imagescale}{\imagewidth/600}
}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
  \setlength\TotalSectionLength{\linewidth}% Set the total line width
  \settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
  \addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
  \addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
  \vspace{8pt}% Whitespace before the section title
  {\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

%----------------------------------------------------------------------------------------
%   Syllabus Header Info
%----------------------------------------------------------------------------------------
\newcommand{\classname}[1]{\renewcommand{\classname}{#1}}
\newcommand{\classnum}[1]{\renewcommand{\classnum}{#1}}

%----------------------------------------------------------------------------------------
%   Instructor Info
%----------------------------------------------------------------------------------------
\newcommand{\profname}[1]{\renewcommand{\profname}{#1}}
\newcommand{\officehours}[1]{\renewcommand{\officehours}{#1}}
\newcommand{\office}[1]{\renewcommand{\office}{#1}}
\newcommand{\site}[1]{\renewcommand{\site}{#1}}
\newcommand{\email}[1]{\renewcommand{\email}{#1}}

%----------------------------------------------------------------------------------------
%   Class Info
%----------------------------------------------------------------------------------------
\newcommand{\prereq}[1]{\renewcommand{\prereq}{#1}}
\newcommand{\classdays}[1]{\renewcommand{\classdays}{#1}}
\newcommand{\classhours}[1]{\renewcommand{\classhours}{#1}}
\newcommand{\classloc}[1]{\renewcommand{\classloc}{#1}}
\newcommand{\classinfo}[1]{\renewcommand{\classinfo}{#1}}

%----------------------------------------------------------------------------------------
%   Lab Info
%----------------------------------------------------------------------------------------
\newcommand{\labdays}[1]{\renewcommand{\labdays}{#1}}
\newcommand{\labhours}[1]{\renewcommand{\labhours}{#1}}
\newcommand{\labloc}[1]{\renewcommand{\labloc}{#1}}

%----------------------------------------------------------------------------------------
%   TA Info - Flexible system
%----------------------------------------------------------------------------------------
% Initialize empty TA list
\def\talist{}

% Command to add a TA to the list
\newcommand{\addTA}[4]{%
  \g@addto@macro\talist{%
    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \textsc{\large\icon{\faUser}} & #1\\
      \ifthenelse{\equal{#2}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & #2\\}
      \ifthenelse{\equal{#3}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & #3\\}
      \ifthenelse{\equal{#4}{}}{}{\textsc{\large\icon{@}} & \href{mailto:#4}{#4}\\}
    \end{tabular}
    \vspace{0.3cm}
  }
}

% For backward compatibility
\newcommand{\taAname}[1]{\renewcommand{\taAname}{#1}}
\newcommand{\taAofficehours}[1]{\renewcommand{\taAofficehours}{#1}}
\newcommand{\taAoffice}[1]{\renewcommand{\taAoffice}{#1}}
\newcommand{\taAemail}[1]{\renewcommand{\taAemail}{#1}}
\newcommand{\taBname}[1]{\renewcommand{\taBname}{#1}}
\newcommand{\taBofficehours}[1]{\renewcommand{\taBofficehours}{#1}}
\newcommand{\taBoffice}[1]{\renewcommand{\taBoffice}{#1}}
\newcommand{\taBemail}[1]{\renewcommand{\taBemail}{#1}}

%----------------------------------------------------------------------------------------
%   Misc. Info
%----------------------------------------------------------------------------------------
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\about}[1]{\renewcommand{\about}{#1}}

%----------------------------------------------------------------------------------------
%   FAQs - Flexible system
%----------------------------------------------------------------------------------------
% Initialize empty FAQ list
\def\faqlist{}

% Command to add an FAQ to the list
\newcommand{\addFAQ}[2]{%
  \g@addto@macro\faqlist{%
    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \textsc{\Large\icon{\faQuestion}} & \Large #1\\
      \textsc{\Large\icon{\faExclamation}} & #2\\
    \end{tabular}
    \vspace{0.3cm}
  }
}

% For backward compatibility
\newcommand{\qOne}[1]{\renewcommand{\qOne}{#1}}
\newcommand{\aOne}[1]{\renewcommand{\aOne}{#1}}
\newcommand{\qTwo}[1]{\renewcommand{\qTwo}{#1}}
\newcommand{\aTwo}[1]{\renewcommand{\aTwo}{#1}}
\newcommand{\qThree}[1]{\renewcommand{\qThree}{#1}}
\newcommand{\aThree}[1]{\renewcommand{\aThree}{#1}}
\newcommand{\qFour}[1]{\renewcommand{\qFour}{#1}}
\newcommand{\aFour}[1]{\renewcommand{\aFour}{#1}}

%----------------------------------------------------------------------------------------
%   Custom Sidebar Sections
%----------------------------------------------------------------------------------------
% Initialize empty custom sections list
\def\customsectionslist{}

% Command to add a custom section to the sidebar
\newcommand{\addSidebarSection}[2]{%
  \g@addto@macro\customsectionslist{%
    \profilesection{\vspace{0.5cm} #1}
    \vspace{0.1cm} % Add space between title and content
    \newline
    #2
    \vspace{0.3cm}
  }
}

%----------------------------------------------------------------------------------------
%   Section Visibility Controls
%----------------------------------------------------------------------------------------
% Default all sections to visible
\newif\ifinstructorsection
\instructorsectiontrue
\newif\ifcoursesection
\coursesectiontrue
\newif\iflabsection
\labsectiontrue
\newif\iftasection
\tasectiontrue
\newif\ifaboutsection
\aboutsectionfalse
\newif\iffaqsection
\faqsectiontrue

% Commands to toggle section visibility
\newcommand{\showInstructorSection}{\instructorsectiontrue}
\newcommand{\hideInstructorSection}{\instructorsectionfalse}
\newcommand{\showCourseSection}{\coursesectiontrue}
\newcommand{\hideCourseSection}{\coursesectionfalse}
\newcommand{\showLabSection}{\labsectiontrue}
\newcommand{\hideLabSection}{\labsectionfalse}
\newcommand{\showTASection}{\tasectiontrue}
\newcommand{\hideTASection}{\tasectionfalse}
\newcommand{\showAboutSection}{\aboutsectiontrue}
\newcommand{\hideAboutSection}{\aboutsectionfalse}
\newcommand{\showFAQSection}{\faqsectiontrue}
\newcommand{\hideFAQSection}{\faqsectionfalse}

%----------------------------------------------------------------------------------------
%   Icon Customization
%----------------------------------------------------------------------------------------
% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}
\newcommand*\icontwo[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=2pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}
\newcommand*\iconhalf[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1.5pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}

% Command to customize icon style
\newcommand{\setIconStyle}[1]{%
  \ifstrequal{#1}{circle}{%
    \renewcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
    \renewcommand*\icontwo[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=2pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
    \renewcommand*\iconhalf[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1.5pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
  }{}%
  \ifstrequal{#1}{square}{%
    \renewcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=rectangle,draw,inner sep=1pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
    \renewcommand*\icontwo[1]{\tikz[baseline=(char.base)]{\node[shape=rectangle,draw,inner sep=2pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
    \renewcommand*\iconhalf[1]{\tikz[baseline=(char.base)]{\node[shape=rectangle,draw,inner sep=1.5pt, fill=myCOLOR,myCOLOR,text=white] (char) {##1};}}
  }{}%
  \ifstrequal{#1}{none}{%
    \renewcommand*\icon[1]{{\color{myCOLOR}##1}}
    \renewcommand*\icontwo[1]{{\color{myCOLOR}##1}}
    \renewcommand*\iconhalf[1]{{\color{myCOLOR}##1}}
  }{}%
}

%----------------------------------------------------------------------------------------
%   SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=sidecolor, anchor=north, minimum width=\sidebarWidth, minimum height=\paperheight+1cm] (box) at (-5cm,0.3cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    %------------------------------------------------

    \ifthenelse{\equal{\profilepic}{}}{}{
      \begin{center}
        \begin{tikzpicture}[x=\imagescale,y=-\imagescale]
          \clip (600/2, 567/2) circle (567/2);
          \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
        \end{tikzpicture}
      \end{center}
    }

    %------------------------------------------------

    {\Huge\color{myCOLOR}\classname}

    %------------------------------------------------

    {\Large\color{myCOLOR}\classnum}

    %------------------------------------------------

    \renewcommand{\arraystretch}{1.6}

    %------------------------------------------------

    \ifinstructorsection
    \profilesection{\vspace{0.7cm} Instructor Info}

    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \ifthenelse{\equal{\profname}{}}{}{\textsc{\large\icon{\faUser}} & \profname \\}
      \ifthenelse{\equal{\officehours}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & \officehours\\}
      \ifthenelse{\equal{\office}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & \office\\}
      \ifthenelse{\equal{\site}{}}{}{\textsc{\Large\iconhalf{\faInfo}} & \site\\}
      \ifthenelse{\equal{\email}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\email}{\email}}
    \end{tabular}
    \fi

    \ifcoursesection
    \profilesection{\vspace{0.5cm} Course Info}

    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \ifthenelse{\equal{\prereq}{}}{}{\textsc{\large\iconhalf{\faBolt}} & \prereq\\}
      \ifthenelse{\equal{\classdays}{}}{}{\textsc{\iconhalf{\faCalendarO}} & \classdays\\}
      \ifthenelse{\equal{\classhours}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & \classhours\\}
      \ifthenelse{\equal{\classloc}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & \classloc\\}
    \end{tabular}
    \fi

    \iflabsection
    \profilesection{\vspace{0.5cm} Lab Info}

    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \ifthenelse{\equal{\labdays}{}}{}{\textsc{\iconhalf{\faCalendarO}} & \labdays\\}
      \ifthenelse{\equal{\labhours}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & \labhours\\}
      \ifthenelse{\equal{\labloc}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & \labloc\\}
    \end{tabular}
    \fi

    \iftasection
    \profilesection{\vspace{0.5cm} TA Info}

    % Check if we're using the new flexible TA system
    \ifx\talist\empty
    % Use the old system for backward compatibility
    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \ifthenelse{\equal{\taAname}{}}{}{\textsc{\large\icon{\faUser}} & \taAname\\}
      \ifthenelse{\equal{\taAofficehours}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & \taAofficehours\\}
      \ifthenelse{\equal{\taAoffice}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & \taAoffice\\}
      \ifthenelse{\equal{\taAemail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\taAemail}{\taAemail}\\}
      \ifthenelse{\equal{\taBname}{}}{}{\textsc{\large\icon{\faUser}} & \taBname\\}
      \ifthenelse{\equal{\taBofficehours}{}}{}{\textsc{\large\iconhalf{\ClockLogo}} & \taBofficehours\\}
      \ifthenelse{\equal{\taBoffice}{}}{}{\textsc{\large\iconhalf{\faMapMarker}} & \taBoffice\\}
      \ifthenelse{\equal{\taBemail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\taBemail}{\taBemail}\\}
    \end{tabular}
    \else
    % Use the new flexible system
    \talist
    \fi
    \fi

    \ifaboutsection
    \profilesection{\vspace{0.5cm} About}
    \begin{flushleft}
      \about
    \end{flushleft}
    \fi

    % Add any custom sections
    \customsectionslist

  \end{textblock}
}

\newcommand{\makeSide}{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=sidecolor, anchor=north, minimum width=\sidebarWidth, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    {\Huge\color{myCOLOR} FAQs}
    \renewcommand{\arraystretch}{2.5}

    % Check if we're using the new flexible FAQ system
    \ifx\faqlist\empty
    % Use the old system for backward compatibility
    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
      \ifthenelse{\equal{\qOne}{}}{}{\textsc{\Large\icon{\faQuestion}} & \Large\qOne\\}
      \ifthenelse{\equal{\aOne}{}}{}{\textsc{\Large\icon{\faExclamation}} & \aOne\\}
      \ifthenelse{\equal{\qTwo}{}}{}{\textsc{\Large\icon{\faQuestion}} & \Large\qTwo\\}
      \ifthenelse{\equal{\aTwo}{}}{}{\textsc{\Large\icon{\faExclamation}} & \aTwo\\}
      \ifthenelse{\equal{\qThree}{}}{}{\textsc{\Large\icon{\faQuestion}} & \Large\qThree\\}
      \ifthenelse{\equal{\aThree}{}}{}{\textsc{\Large\icon{\faExclamation}} & \aThree\\}
      \ifthenelse{\equal{\qFour}{}}{}{\textsc{\Large\icon{\faQuestion}} & \Large\qFour\\}
      \ifthenelse{\equal{\aFour}{}}{}{\textsc{\Large\icon{\faExclamation}} & \aFour\\}
    \end{tabular}
    \else
    % Use the new flexible system
    \faqlist
    \fi
  \end{textblock}
}

\newcommand{\makeFullPage}{
  \newgeometry{margin=1cm}
}

%----------------------------------------------------------------------------------------
%   COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
  {%
    \round{#1}{
      \ifcase\value{colorCounter}%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\or%
      myCOLOR\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  {%
    \color{gray}%
    \Large\sectioncolor{#1}%
  }
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}{%
    \large\color{gray} #1%
  }
  \par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%   LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
  }{%
  \end{tabular*}
}

\newcommand{\twentyitem}[4]{%
  #1&\parbox[t]{0.83\textwidth}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\
}

%----------------------------------------------------------------------------------------
%   SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
  }{%
  \end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
  #1&\parbox[t]{0.83\textwidth}{%
    \textbf{#2}%
  }\\
}

%----------------------------------------------------------------------------------------
%   MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}