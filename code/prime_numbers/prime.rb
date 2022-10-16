def prime?(n)
  '1'*n !~ /^1?$|^(11+?)\1+$/
end

if $PROGRAM_NAME == __FILE__
  p (0..100).select { prime?(_1) }
end
