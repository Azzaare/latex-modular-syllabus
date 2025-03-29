# Modular LaTeX Syllabus Template

A modern, customizable LaTeX syllabus template with a clean sidebar design and flexible configuration options. This template allows instructors to create professional-looking syllabi without needing to modify the underlying class file.

## Credits

This LaTeX class is based on **Inzane Syllabus Template** by Carmine Spagnuolo (cspagnuolo@unisa.it) with major modifications by Zane Wolf (zwolf.mlxvi@gmail.com).

Further modifications for modularity by Jean-François Baffier (jf@baffier.fr).

This modular version allows for customization directly from the .tex file without needing to modify the class file.

## Features

Note that the README was generated and might have some issues. Please file one if needed.

- **Sidebar design** with customizable width, color, and icon styles
- **Flexible sections** that can be shown or hidden as needed
- **No limit** on the number of TAs or FAQ items you can include
- **Custom sidebar sections** for additional information
- **Profile picture** for a personalized touch
- **Color-coded modules** in the class schedule

## Getting Started

1. Use the `modular_syllabus` class in your document:
2.

   ```latex
   \documentclass[letterpaper]{modular_syllabus}
   ```

3. Configure your styling options
4. Add your course content
5. Compile with any standard LaTeX compiler

## Customization Options

### Core Style Options

```latex
% Set the main color (HTML color code without #)
\setMainColor{046D0B}  % Green theme

% Set the sidebar width
\setSidebarWidth{9cm}  % Default is 9cm

% Set the profile image size
\setProfileImageSize{5cm}  % Default is 5cm

% Set the icon style (options: circle, square, none)
\setIconStyle{circle}
```

### Section Visibility

Control which sections appear in your syllabus:

```latex
% Show standard sections (these are enabled by default)
\showInstructorSection
\showCourseSection

% Hide sections you don't need
\hideLabSection
\hideTASection

% Optional sections (disabled by default)
\showAboutSection  % Adds an "About" section with course description
```

### Course Information

Set up basic course information:

```latex
\classname{Fishes}
\classnum{OEB 177}

% Instructor information
\profname{Jane Smith}
\officehours{Office Hrs: Mon \& Wed 1-2p}
\office{Science Building 105}
\site{http://university.edu/jsmith}
\email{jsmith@university.edu}

% Course details
\prereq{Prereq: Biology 101}
\classdays{Tues \& Thurs}
\classhours{11a-12:30p}
\classloc{Science Center 401}

% Optional lab details
\labdays{Wed \& Fri}
\labhours{2-5p}
\labloc{Lab Building 302}
```

### Adding Teaching Assistants

Add as many TAs as needed:

```latex
\addTA{Name}{Office Hours}{Office Location}{Email}

% Examples:
\addTA{Alice Johnson}{Office Hrs: Tues \& Thurs 10-11a}{Science 104}{alice@university.edu}
\addTA{Bob Smith}{Office Hrs: Wed 1-2p}{Science 106}{bob@university.edu}
\addTA{Carol Zhang}{Office Hrs: Fri 3-4p}{Science 108}{carol@university.edu}
```

### Adding FAQs

Add frequently asked questions and their answers:

```latex
\addFAQ{Question text goes here?}{Answer text goes here.}

% Examples:
\addFAQ{Do we need the textbook for this course?}{Yes, the textbook is required and will be used extensively.}
\addFAQ{Are laptops allowed in class?}{Yes, but only for note-taking and class activities.}
```

### Custom Sidebar Sections

Add your own custom sections to the sidebar:

```latex
\addSidebarSection{Section Title}{
  \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
    \textsc{\large\iconhalf{\faCalendarO}} & Important Date 1\\
    \textsc{\large\iconhalf{\faCalendarO}} & Important Date 2\\
  \end{tabular}
}

% Example:
\addSidebarSection{Important Dates}{
  \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
    \textsc{\large\iconhalf{\faCalendarO}} & Midterm: Oct 15\\
    \textsc{\large\iconhalf{\faCalendarO}} & Project Due: Nov 20\\
    \textsc{\large\iconhalf{\faCalendarO}} & Final Exam: Dec 15\\
  \end{tabular}
}
```

### About Section

Add a course description or overview:

```latex
\about{This course explores the fascinating world of marine biology,
focusing on ecological relationships and conservation challenges.
Students will gain hands-on experience through lab work and field trips.}
```

## Page Layout Commands

Use these commands to create different parts of your syllabus:

```latex
\begin{document}

% Create the main sidebar with course info
\makeprofile

% Your main content goes here
\section{Overview}
Course overview text...

% For FAQ page with sidebar
\newpage
\makeSide

% For full-width pages (like schedules)
\newpage
\makeFullPage
\section{Class Schedule}
Schedule content...

\end{document}
```

## Formatting Helpers

The template includes several helper environments for consistent formatting:

```latex
% For grading scheme or simple lists
\begin{twentyshort}
  \twentyitemshort{15\%}{Review Paper}
  \twentyitemshort{15\%}{Lab Worksheets}
  \twentyitemshort{40\%}{Midterm Exams}
  \twentyitemshort{30\%}{Final Exam}
\end{twentyshort}

% For more detailed items with descriptions
\begin{twenty}
  \twentyitem{15\%}{Review Paper}{Due Nov 15}{Description of the paper assignment...}
\end{twenty}
```

## Example

See `modular_template.tex` for a complete example showing how to use all features of the template.
