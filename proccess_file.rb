require 'json'
class ProccessJsonFile
  def initialize(file_location)
    @file_location = file_location
  end

  def save_to_json(data, options: {})
    file = File.new(@file_location, 'w')
    file.write(JSON.generate(data, options))
    file.close
  end

  def read_from_json(options: {})
    file = File.new(@file_location, 'r')
    file_data = JSON.parse(file.read, options)
    file.close
    file_data
  rescue StandardError
    puts 'no file found to read'
    nil
  end
end

=begin
class testing contents
option = ProccessJsonFile.new('options.rb')
option3 = ProccessJsonFile.new('records.rb')
option.save_to_json(%w[t b c], options: {})
puts option.read_from_json
option.save_to_json(%w[d e f], options: {})
puts option.read_from_json
puts option3.read_from_json
=end

=begin
manual testing contents
=end
# file=File.open('options.txt','r')
# file.write('this is file content')
# file_data = file.read
# puts file_data
