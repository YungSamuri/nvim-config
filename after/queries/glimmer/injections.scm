;; extends

; AlpineJS attributes
(attribute_node
  (attribute_name) @_attr
    (#lua-match? @_attr "^x%-%l")
    (concat_statement) @injection.content 
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.include-children)
    (#set! injection.language "javascript"))
