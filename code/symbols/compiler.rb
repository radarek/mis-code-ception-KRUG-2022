def decompose(n)
  n == 0 ? '(_-_)' : '('+'__*'+decompose(n/2)+'+_'*(n%2)+')'
end

def symbolize_string(str)
  ["''", *str.chars.map { decompose(_1.ord) }].join('<<')
end

def compile(code)
  "_=$$/$$;__=_+_;->(&___){___['',#{symbolize_string('eval')},#{symbolize_string(code)}]}[&:\"\#{#{symbolize_string('send')}}\"]"
end

puts compile(ARGF.read)
