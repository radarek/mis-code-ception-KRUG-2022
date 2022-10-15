def prime?(n)
  '1'*n !~ /^1?$|^(11+?)\1+$/
end

p (0..100).select { prime?(_1) }
