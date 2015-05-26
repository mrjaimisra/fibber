# Level 1:
# after hours of beating myself against a brick wall, I found some code on stackoverflow,
# which I was able to refactor:
# print (0..15).inject([0, 1]) { |fibs, num| num > 1 ? fibs << fibs[-1] + fibs[-2] : fibs << 1 }
# the code I found uses the ternary operator, which Josh Cheek was able to help illuminate for me
# [if this part is true] ? [return this value] : [if false, return other value]

class Fibber
  attr_accessor :quantity

  def fib(quantity)
    @sequence = (0..quantity).inject([0]) do |fibs, num|
      if num > 1
        fibs << fibs[-1] + fibs[-2]
      else
        fibs << 1 end
    end

  end

  # Level 2:
  # so the method below #jagged puts all of the slices of 5 elements to a new line
  # now I need to make it output the elements as something other than a series of arrays.... getting closer...
  # several of my classmates, especially Justin Pease,
  # who explained this method of nesting an enumerator block within an enumerator block,

  def jagged
    @sequence.each_slice(5) do |slice| puts slice.join(" ")
    end
  end

  def better
    @sequence.each_slice(5) do |a, b, c, d, e|
      puts [a, b, c, d, e].map {|y| y.to_s.rjust(4)}.join(" ")
    end
  end

  # Level 3:
  # Can you output your sequence such that each element is padded to a string
  # with a size one greater than the number of digits in the last element that will be output?
  # So if the biggest number you'll output is three digits,
  # each element of the sequence is padded to four places.
  # But if the last element is four digits,
  # each element is padded to five places.
  # this is my own interpretation of that method of solving the padding problem:
  # Justin Pease also described his brilliant solution for finding the correct padding length - calculate as a variable

  def fancy
    @fancy_size = @sequence[-1].to_s.length+1 #thanks Justin Pease!
    @sequence.each_slice(5) do |a, b, c, d, e|
      puts [a, b, c, d, e].map {|y| y.to_s.rjust(@fancy_size)}.join(" ")
    end
  end
end

# the code to generate the fibonacci sequence for an arbitrary range of numbers, beginning with 0:

fibonacci_sequence = Fibber.new
fibonacci_sequence.fib(15)

# the code for outputting the sequence in a variety of forms:

fibonacci_sequence.jagged
fibonacci_sequence.better
fibonacci_sequence.fancy

# Thoughts for Instructor:
# I initially found it very frustrating that I was unable to solve any of these challenges on my own,
# despite finding some of the correct methods.
# I quickly learned that asking for help, from my peers and instructors was rewarding and helpful
# in ways I couldn't imagine when this project made me feel hopeless
# So,
# what you are looking at is an amalgamation of code I found, refactored, stole, traded for, and
# on which I added my little twist which I hope is apparent from the differences b/w my code and other students'
# solutions
# If it just looks like I copied a bunch of shit I don't understand, then I am sorry.
# I am not sure if learning more about how to collaborate and ask for help was the point of this lesson,
# but it's what I learned.
# -Jai
