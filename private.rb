class Receiver
  def public_message
    private_message
  end

  def self_public_message
    self.private_message
  end

  private

  def private_message
    puts "This is a private message"
  end
end

class R < Receiver
  def public_message
    private_message
  end

  def self_public_message
    self.private_message
  end
end

puts '---------------------------------------------------------------'
puts 'from Reciever'
puts '---------------------------------------------------------------'
Receiver.new.public_message

begin
  Receiver.new.self_public_message
rescue => e
  puts e
end

begin
  Receiver.new.private_message
rescue => e
  puts e
end
puts '---------------------------------------------------------------'
puts 'from R'
puts '---------------------------------------------------------------'
R.new.public_message

begin
  R.new.self_public_message
rescue => e
  puts e
end
puts '---------------------------------------------------------------'

=begin
  Conclusion:
    In Ruby, a private method (or private message handler) can only respond to a message with an implicit receiver (self).
    It also cannot respond to a message called from outside of the private message handler context (the object).
=end