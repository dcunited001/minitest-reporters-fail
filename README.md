# Minitest::Reporters::Fail

Add this to test/support/minitest_reporters.rb:

```ruby
# may want to skip this for CI!
require "minitest/reporters"
require 'minitest/reporters/fail'
emoji = {
    'P' => "\u{1F49A} ", # heart
    'E' => "\u{1f525} ", # flame
    'F' => "\u{1f4a9} ", # poop
    'S' => "\u{1f37a} "} # beer

MiniTest::Reporters.use! Minitest::Reporters::FailReporter.new(emoji: emoji)
```

To run tests:

```shell
bundle install
guard
# [enter]
```

