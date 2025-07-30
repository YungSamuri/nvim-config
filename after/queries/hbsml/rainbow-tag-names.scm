(element
  (start_tag
    (tag_name) @delimiter)
  (end_tag
    (tag_name) @delimiter @sentinel)
) @container

(element
  (self_closing_tag
    (tag_name) @delimiter @sentinel)
) @container

(element
  (start_tag
    (tag_name) @delimiter @_tag_name @sentinel)
  (#any-of? @_tag_name
   "area"
   "base"
   "br"
   "col"
   "embed"
   "hr"
   "img"
   "input"
   "link"
   "meta"
   "param"
   "source"
   "track"
   "wbr")
) @container

(style_element
  (start_tag
    (tag_name) @delimiter)
  (element (self_closing_tag) @delimiter)*
  (end_tag
    (tag_name) @delimiter @sentinel)
) @container

(script_element
  (start_tag
    (tag_name) @delimiter)
  (end_tag
    (tag_name) @delimiter @sentinel)
) @container
