#!/usr/bin/env ruby

require 'mathn'

class First
  def task_1
    (1..30).each do |i|
       if [10, 20, 25].include? i
         puts "ruby"
       else
         puts "<3 ruby #{i}"
       end
     end
  end
end


class Second
  def task_2(radius = nil)
    if radius == nil
      print "Input radius: "
      radius = gets.chomp.to_i
    end
    (-radius..radius).each do |x|
      s = ""
      (-radius..radius).each do |y|
        if radius > Math.sqrt(x**2.0 + y**2.0).to_f.round
          s += " * "
        else
          s += "   "
        end
      end
      puts s
    end
  end

  def test
    arr_test = [-10, -1, 0, 1, 2, 3, 5, 10, 15]
    arr_test.each do |i|
      begin
        puts i
        task_2(i)
      rescue => e
        puts e.message
      end
    end
  end
end


class Third
  def task_3(size_matrix=nil)
    if size_matrix == nil
      print "Input matrix size: "
      size_matrix = gets.chomp.to_i
    end
    array_matrix = Matrix.identity(size_matrix).to_a.map(&:inspect)
    puts array_matrix
  end

  def test
    arr_test = [-10, -1, 0, 1, 2, 3, 5, 10, 15, 50]
    arr_test.each do |i|
      begin
        puts i
        task_3(i)
      rescue => e
        puts e.message
      end
    end
  end
end


class Forth
  def task_4(hash)
    def rec_search(hash)
      $key9 = nil
      hash.each do |key, value|
        if key == :key9
          $key9 = value
          break
        elsif value.class == Hash
          rec_search(value)
        end
      end
      return $key9
    end
    rec_search(hash)
  end

  def test
    arr_test = [
      { key1: {}, key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }},
      {key9:5},
      {},
      { key1: {}, key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1} } }},
    ]
    arr_test.each do |i|
      begin
        puts "Input: \n\t#{i}\nOutput:\n\tkey9=#{task_4(i)}"
      rescue => e
        puts e.message
      end
    end
  end
end


class Fifth
  def formatize(str, format)
    split_str = str.split(%r{ |_|-})
    case format
    when :camel
      return split_str.collect{|i|  i.capitalize}.join
    when :underscore
      return split_str.join("_")
    when :css
      return split_str.join("-")
    else
      return "Error: Not found format '#{format}'"
    end
  end

  def test
    arr_test = [
      "i love ruby",
      "one two_three-four"
    ]
    arr_formats = [:camel, :underscore, :css]
    arr_test.each do |i|
      arr_formats.each do |f|
        begin
          puts "Input:\n\tString:#{i}\n\tType:#{f}\nOutput:\n\t#{formatize(i, f)}\n\n\n"
        rescue => e
          puts e.message
        end
      end
    end
  end
end

class Sixth
  def task_6(arr, type_variable)
    $arr_variable = []
    def get_all(arr, type_variable)
      arr.each do |i|
        if i.class == Array
          get_all(i, type_variable)
        elsif i.class == type_variable
          $arr_variable += [i]
        else
        end
      end
    end
    get_all(arr, type_variable)
    return $arr_variable
  end

  def test
    arr_test = [
      [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]],
      [2**32, 1, -2**64, "test string"],
    ]
    arr_types = [Fixnum, Bignum, String]
    arr_test.each do |i|
      arr_types.each do |t|
        begin
          puts "Input:\n\t#{t}\n\t#{i}\nOutput:\n\t#{task_6(i, t)}\n\n"
        rescue => e
          puts e.message
        end
      end
    end
  end
end



if __FILE__ == $0
  while true do
    puts "Make your choice(1-9): "; $choice =  gets.chomp.to_i
    case $choice
    when 1
      t = First.new
      t.task_1
    when 2
      t = Second.new
      t.test
    when 3
      t = Third.new
      t.test
    when 4
      t = Forth.new
      t.test
    when 5
      t = Fifth.new
      t.test
    when 6
      t = Sixth.new
      t.test
    when 0
      break
    else
      puts "Write, please, number 1..6!"
    end
  end
end
