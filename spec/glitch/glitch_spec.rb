require 'spec_helper'

describe :Glitch do
  describe :glitch do
    it do
      class String
        include Glitch
      end

      characters = ('a'..'z').to_a
      orig_str = (0..10000).to_a.map do
        characters.sample
      end.join

      (orig_str.to_sym == orig_str.to_glitch.to_sym).should be_false
    end
    it do
      class Array
        include Glitch

        def setup_glitch
          self.dup.join()
        end
      end

      characters = ('a'..'z').to_a
      arr = (0..10000).inject([]) do |a, i|
        a << characters.sample
      end

      (arr.join().to_sym == arr.to_glitch.to_sym).should be_false
    end
  end
end
