def symbolize_string(str)
  ["''", *str.chars.map { decompose(_1.ord) }].join('<<')
end
