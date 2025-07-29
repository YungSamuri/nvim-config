;; extends

; AlpineJS attributes
(attribute_name) @_attr
(#lua-match? @_attr "^x%-%l")
_ @injection.content 
(#offset! @injection.content 0 1 0 -1)
(#set! injection.include-children)
(#set! injection.language "javascript")

; <script> tags
((element_node
  (element_node_start
    (tag_name) @_tag_name
    (#eq? @_tag_name "script"))) @injection.content
  (#offset! @injection.content 0 8 0 -9)
  (#set! injection.language "javascript")
  (#set! injection.include-children))

; <style> tags
((element_node
  (element_node_start
    (tag_name) @_tag_name
    (#eq? @_tag_name "style"))
  (text_node) @injection.content)
  (#set! injection.language "css")
  (#set! injection.include-children))
