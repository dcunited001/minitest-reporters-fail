#require 'minitest/unit'
#require 'minitest/reporters'

module Minitest
  module Reporters
    module Fail
      VERSION = "0.0.1"
    end

    # A reporter based on minitest-emoji by tenderlove
    #   and on minitest-reporters by CapnKernul
    #
    # @see https://github.com/tenderlove/minitest-emoji
    # @see https://github.com/CapnKernul/minitest-reporters
    class FailReporter
      #include Reporter
      #include ANSI::Code
      #include RelativePosition

      EMOJI = {
          'P' => "\u{1F49A} ", # heart
          'E' => "\u{1f525} ", # flame
          'F' => "\u{1f4a9} ", # poop
          'S' => "\u{1f37a} "  # beer
      }

      def initialize(opts = {})
        @emoji = EMOJI.merge(opts.fetch(:emoji, {}))
      end

      def before_suites(suite, type)
        @results = {
            'P' => 0,
            'E' => 0,
            'F' => 0,
            'S' => 0
        }
      end

      def after_suites(suites, type)
        %w(P E F S).each do |status|
          print("#{status}: " + @emoji[status]*@results[status] + " #{@results[status]}")
          puts;
        end
      end

      def before_suite(suite); end
      def after_suite(suite); end

      def before_test(suite,test)
        #print pad_test(test)
      end

      def pass(suite, test, test_runner)
        @results['P'] += 1
      end

      def skip(suite, test, test_runner)
        @results['S'] += 1
        puts; print(@emoji['S'] + yellow { pad_mark("#{print_time(test)} SKIP") } )
        puts; print(yellow { pad_mark(suite) } )
        puts; print(yellow { pad_mark(test) } )
      end

      def failure(suite,test,test_runner)
        @results['F'] += 1
        puts; print(@emoji['F'] + red { pad_mark("#{print_time(test)} FAIL") } )
        puts; print(red { pad_mark(suite) } )
        puts; print(red { pad_mark(test) } )
        puts; print_info(test_runner.exception)
      end

      def error(suite,test,test_runner)
        @results['E'] += 1
        puts; print(@emoji['E'] + red { pad_mark("#{print_time(test)} ERROR") } )
        puts; print(red { pad_mark(suite) } )
        puts; print(red { pad_mark(test) } )
        puts; print_info(test_runner.exception)
      end

      private

      def print_time(test)
        total_time = Time.now - (runner.test_start_time || Time.now)
        " (%.2fs)" % total_time
      end

    end
  end
end
