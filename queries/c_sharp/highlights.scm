(member_access_expression
  name: (identifier) @property)

;; TODO: Ter forma melhor de não precisar de replicar essas quries aqui

(method_declaration
  name: (identifier) @method)

(local_function_statement
  name: (identifier) @method)

(invocation_expression
  (member_access_expression
    name: (identifier) @method))

(invocation_expression
  function: (conditional_access_expression
    (member_binding_expression
      name: (identifier) @method)))

(invocation_expression
      (identifier) @method)

(_
  type: (generic_name
   (identifier) @type))
; Generic Method invocation with generic type
(invocation_expression
  function: (generic_name
              . (identifier) @method))

(invocation_expression
  (member_access_expression
    (generic_name
      (identifier) @method)))

