=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob

    ANSWER_TO = {
      a_question: "Sure.",
      a_yelled_question: "Calm down, I know what I'm doing!",
      a_yelled_remark: "Whoa, chill out!",
      actually_nothing: "Fine. Be that way!",
      anything_else: "Whatever."
    }
  
    def self.hey remark
      nothing_is_said = remark.strip.empty?
      return ANSWER_TO[:actually_nothing] if nothing_is_said
  
      is_a_question = remark.strip.end_with?("?")
      is_yelled = remark == remark.upcase && remark.upcase.count("A-Z") > 0
  
      case [is_yelled, is_a_question]
      when [true, true] then ANSWER_TO[:a_yelled_question]
      when [true, false] then ANSWER_TO[:a_yelled_remark]
      when [false, true] then ANSWER_TO[:a_question]
      else ANSWER_TO[:anything_else]
      end
    end
  
  end