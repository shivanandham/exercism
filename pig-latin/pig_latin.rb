=begin
Write your code for the 'Pig Latin' exercise in this file. Make the tests in
`pig_latin_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pig-latin` directory.
=end

module PigLatin

    def self.translate(phrase)
        phrase
            .split
            .map(&method(:translate_word))
            .join(" ")
    end

    class << self
        VOWEL_SOUNDS = %w{
            [aeiou]
            xr
            yt
        }.join('|').freeze

        CONSONANT_SOUNDS = %w{
            qu
            [^aeiou]+qu
            [^aeiou]+(?=y)
            [^aeiou]+
        }.join('|').freeze

        private

        def translate_word(word)
            word << 'ay' if add_ay?(word)
            word
        end

        def add_ay?(word)
            word.start_with?(/#{VOWEL_SOUNDS}/) || 
            word.gsub!(/\A(#{CONSONANT_SOUNDS})(.+)/, '\2\1')
        end
    end
end