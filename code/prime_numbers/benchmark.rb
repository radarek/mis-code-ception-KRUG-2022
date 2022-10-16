require 'prime'
require 'bundler/setup'
require 'benchmark/bigo'

require_relative './prime'

Benchmark.bigo do |x|
  x.config(time: 0.1, warmup: 0.1)
  x.min_size = 1
  x.step_size = 1
  x.steps = 200
  x.generator { |size| size }

  x.report("prime?(n)") do |n, _|
    prime?(n)
  end

  x.chart!
end

File.write('chart.html', File.read('chart.html').sub("http://chartkick.com/chartkick.js", "./chartkick.js"))
