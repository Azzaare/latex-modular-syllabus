# Modular LaTeX Syllabus Template

This repository contains a modular LaTeX syllabus template that allows for customization directly from the `.tex` file without needing to modify the class file. This makes it easier to create and maintain syllabus documents with a consistent style but customized content.

## Files

- `modular_syllabus.cls`: The class file containing the structure and styling definitions
- `modular_template.tex`: An example template showing how to use the modular class
- `template.tex`: The original template (using `inzane_syllabus.cls`)
- `inzane_syllabus.cls`: The original class file

## Key Improvements

The modular version offers several advantages over the original:

1. **Customization from the .tex file**: All styling and layout options can be set directly in the .tex file
2. **Flexible TA system**: Add any number of TAs, not just two
3. **Flexible FAQ system**: Add any number of FAQs, not just four
4. **Custom sidebar sections**: Add your own sections to the sidebar
5. **Section visibility control**: Show/hide specific sections as needed
6. **Icon style customization**: Choose between circle, square, or no icons
7. **Color and size customization**: Easily change the main color and sidebar width

## How to Use

### Basic Usage

1. Use `\documentclass[letterpaper]{modular_syllabus}` in your .tex file
2. Set customization options in the preamble
3. Add your content
4. Compile with your LaTeX compiler

### Customization Options

```latex
% Set the main color (HTML color code without #)
\setMainColor{046D0B} % Green - you can change this to any color you want

% Set the sidebar width (default is 9cm)
\setSidebarWidth{9cm}

% Set the profile image size (default is 5cm)
\setProfileImageSize{5cm}

% Set the icon style (options: circle, square, none)
\setIconStyle{circle}

% Show/hide sections (default: all shown except About)
\showInstructorSection
\showCourseSection
\showLabSection
\showTASection
\showAboutSection % Show the About section
\hideFAQSection % Hide the FAQ section
```

### Adding TAs

```latex
% Add as many TAs as needed
\addTA{Name}{Office Hours}{Office Location}{Email}
\addTA{Another TA}{Office Hours}{Office Location}{Email}
```

### Adding FAQs

```latex
\addFAQ{Question}{Answer}
\addFAQ{Another Question}{Another Answer}
```

### Adding Custom Sidebar Sections

```latex
\addSidebarSection{Section Title}{
  \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
    \textsc{\large\iconhalf{\faCalendarO}} & Content Line 1\\
    \textsc{\large\iconhalf{\faCalendarO}} & Content Line 2\\
  \end{tabular}
}
```

## Backward Compatibility

The modular template maintains backward compatibility with the original template. You can still use the old commands like `\taAname`, `\qOne`, etc., but the new flexible systems are recommended for new documents.

## Examples

See `modular_template.tex` for a complete example of how to use all the new features.
