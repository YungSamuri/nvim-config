;; extends

;([
;  (text) @injection.content
;  (attribute_value) @injection.content
;]
;  (#lua-match? @injection.content "{{[^>}]*}}")
;  (#set! injection.language "glimmer"))

; AlpineJS attributes
(start_tag
  (tag_name)
  (attribute
    (attribute_name) @_attr
    (#lua-match? @_attr "^x%-%l")
    (quoted_attribute_value
      (attribute_value) @injection.content ))
(#offset! @injection.content 0 1 0 -1)
(#set! injection.include-children)
(#set! injection.language "javascript"))
