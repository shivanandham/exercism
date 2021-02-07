=begin
Write your code for the 'Grade School' exercise in this file. Make the tests in
`grade_school_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grade-school` directory.
=end

class School

    def initialize
      @roster = Hash.new { |roster, grade| roster[grade] = [] }
    end
  
    def add(student_name, grade)
      @roster[grade] << student_name
      @roster[grade].sort!
    end
  
    def students(grade)
      @roster[grade]
    end
  
    def students_by_grade
      @roster
        .keys
        .sort
        .map { |grade| { :grade => grade, :students => students(grade) } }
    end
  end