Ramblethru Style Guide:

Fonts:
Title font - Mensch

[RUBY]
Coding Style:

	Spacing -
	Use soft-tabs with a two space indent.
	Keep lines fewer than 80 characters.
	Never leave trailing whitespace.
	End each file with a blank newline.
	Use spaces around operators, after commas, colons and semicolons, around { and before }.
	No spaces after (, [ or before ], ).
	No spaces after !.
	Use empty lines between defs and to break up a method into logical paragraphs.
	
	Syntax - 
	Use def with parentheses when there are arguments. Omit the parentheses when the method doesn't accept any arguments.
	
	Naming - 
	Use snake_case for methods and variables.
	Use CamelCase for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase.)
	Use SCREAMING_SNAKE_CASE for other constants.
	The names of predicate methods (methods that return a boolean value) should end in a question mark. (i.e. Array#empty?).
	Use hashrocket syntax for Hash literals instead of the JSON style introduced in 1.9.


[CSS]
Coding Style:

	Spacing -
	Use soft-tabs with a two space indent. Spaces are the only way to guarantee code renders the same in any person's environment.
	Put spaces after : in property declarations.
	Put spaces before { in rule declarations.
	Put line breaks between rulesets.
	When grouping selectors, keep individual selectors to a single line.
	Place closing braces of declaration blocks on a new line.
	Each declaration should appear on its own line for more accurate error reporting.
	
	Formatting - 
	Avoid specifying units for zero values, e.g., margin: 0; instead of margin: 0px;.
	
	Specificity (classes vs. ids):
	Elements that occur exactly once inside a page should use IDs, otherwise, use classes. When in doubt, use a class name.
	Good candidates for ids: header, footer, modal popups.
	Bad candidates for ids: navigation, item listings, item view pages (ex: issue view).

	