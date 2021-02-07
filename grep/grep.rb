=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

class Grep
    def self.grep pattern, flags, filenames
      regexp_options = []
      regexp_options.push(Regexp::IGNORECASE) if flags.include? '-i'
  
      pattern = "^#{pattern}\n$" if flags.include? '-x'
      pattern = Regexp.new pattern, *regexp_options
  
      results = []
  
      filenames.each do |filename|
        File.open(filename, 'r') do |file|
          file.each_line.with_index do |line, line_number|
            prefix = filenames.length > 1 ? "#{filename}:" : ''
            prefix += "#{line_number + 1}:" if flags.include? '-n'
  
            if pattern.match?(line) ^ flags.include?('-v')
              if flags.include? '-l'
                results.push filename
                break
              end
  
              results.push "#{prefix}#{line.chomp}"
            end
          end
        end
      end
  
      results.join "\n"
    end
  end