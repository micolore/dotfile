local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('java', {
  -- Main method
  s('main', fmt([[
    public static void main(String[] args) {{
        {}
    }}
  ]], { i(0) })),

  -- System.out.println
  s('sysout', fmt([[
    System.out.println({});
  ]], { i(0) })),

  -- For loop
  s('fori', fmt([[
    for (int {} = 0; {} < {}; {}++) {{
        {}
    }}
  ]], { i(1, 'i'), i(2, 'i'), i(3, '10'), i(4, 'i'), i(0) })),

  -- While loop
  s('while', fmt([[
    while ({}) {{
        {}
    }}
  ]], { i(1, 'condition'), i(0) })),

  -- If statement
  s('if', fmt([[
    if ({}) {{
        {}
    }}
  ]], { i(1, 'condition'), i(0) })),

  -- Else if statement
  s('elif', fmt([[
    else if ({}) {{
        {}
    }}
  ]], { i(1, 'condition'), i(0) })),

  -- Else statement
  s('else', fmt([[
    else {{
        {}
    }}
  ]], { i(0) })),

  -- Try-catch block
  s('try', fmt([[
    try {{
        {}
    }} catch ({}) {{
        {}
    }}
  ]], { i(0), i(1, 'Exception e'), i(2, 'e.printStackTrace();') })),

  -- Class definition
  s('class', fmt([[
    public class {} {{
        {}
    }}
  ]], { i(1, 'ClassName'), i(0) })),

  -- Method definition
  s('method', fmt([[
    public {} {}({}) {{
        {}
    }}
  ]], { i(1, 'void'), i(2, 'methodName'), i(3), i(0) })),

  -- Constructor
  s('constructor', fmt([[
    public {}({}) {{
        {}
    }}
  ]], { i(1, 'ClassName'), i(2), i(0) })),

  -- Public static final field
  s('psf', fmt([[
    public static final {} {} = {};
  ]], { i(1, 'String'), i(2, 'CONSTANT'), i(3, 'value') })),

  -- Public static void main
  s('psvm', fmt([[
    public static void main(String[] args) {{
        {}
    }}
  ]], { i(0) })),

  -- Private field
  s('pfield', fmt([[
    private {} {};
  ]], { i(1, 'String'), i(2, 'fieldName') })),

  -- Getter method
  s('getter', fmt([[
    public {} get{}() {{
        return {};
    }}
  ]], { i(1, 'String'), i(2, 'FieldName'), i(3, 'fieldName') })),

  -- Setter method
  s('setter', fmt([[
    public void set{}({} {}) {{
        this.{} = {};
    }}
  ]], { i(1, 'FieldName'), i(2, 'String'), i(3, 'fieldName'), i(4, 'fieldName'), i(3) })),

  -- toString method
  s('tostring', fmt([[
    @Override
    public String toString() {{
        return "{}{{}}";
    }}
  ]], { i(1, 'ClassName') })),

  -- Equals method
  s('equals', fmt([[
    @Override
    public boolean equals(Object o) {{
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        {} {} = ({}) o;
        return {};
    }}
  ]], { i(1, 'ClassName'), i(2, 'that'), i(3, 'ClassName'), i(0) })),

  -- HashCode method
  s('hashcode', fmt([[
    @Override
    public int hashCode() {{
        return Objects.hash({});
    }}
  ]], { i(0) })),

  -- Logger initialization
  s('logger', fmt([[
    private static final Logger logger = Logger.getLogger({}.class.getName());
  ]], { i(1, 'ClassName') })),

  -- Annotation
  s('annotation', fmt([[
    @{}
  ]], { i(1, 'Annotation') })),

  -- Package declaration
  s('package', fmt([[
    package {};
  ]], { i(1, 'com.example') })),

  -- Import statement
  s('import', fmt([[
    import {};
  ]], { i(1, 'java.util.*') })),
})

