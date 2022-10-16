require "minitest/autorun"
require "benchmark/ips"
require "stringio"

class TestBenchmarkIPS < Minitest::Test
  def setup
    @old_stdout = $stdout
    $stdout = StringIO.new
  end

  def teardown
    $stdout = @old_stdout
  end

  def test_ips
    report = Benchmark.ips do |x|
      x.config(:time => 1, :warmup => 1)
      x.report("sleep 0.25") { sleep(0.25) }
      x.report("sleep 0.05") { sleep(0.05) }
      x.compare!
    end

    rep1 = report.entries[0]
    rep2 = report.entries[1]

    assert_equal "sleep 0.25", rep1.label
    assert_equal 4, rep1.iterations
    assert_in_delta 4.0, rep1.ips, 0.2

    assert_equal "sleep 0.05", rep2.label
    assert_equal 20, rep2.iterations
    assert_in_delta 20.0, rep2.ips, 1.0
  end

  def test_ips_alternate_config
    report = Benchmark.ips do |x|
      x.time = 1
      x.warmup = 1
      x.report("sleep 0.25") { sleep(0.25) }
    end

    rep = report.entries.first

    assert_equal "sleep 0.25", rep.label
    assert_equal 4, rep.iterations
    assert_in_delta 4.0, rep.ips, 0.2
  end

  def test_ips_old_config
    report = Benchmark.ips(1,1) do |x|
      x.report("sleep 0.25") { sleep(0.25) }
    end

    rep = report.entries.first

    assert_equal "sleep 0.25", rep.label
    assert_equal 4, rep.iterations
    assert_in_delta 4.0, rep.ips, 0.2
  end

  def test_ips_defaults
    report = Benchmark.ips do |x|
      x.report("sleep 0.25") { sleep(0.25) }
    end

    rep = report.entries.first

    assert_equal "sleep 0.25", rep.label
    assert_equal 4*5, rep.iterations
    assert_in_delta 4.0, rep.ips, 0.2
  end
end
