;; extends

(command
  name: (command_name
          (word))
  argument: (word) @query
  (#eq? @query "--query")
  argument: (string
              (string_content) @injection.content
            )
  (#set! injection.language "sql"))
