;; extends

(command
  name: (command_name
          (word))
  argument: (word) @query
  (#eq? @query "--query")
  argument: (string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
