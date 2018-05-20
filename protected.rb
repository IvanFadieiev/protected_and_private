class Receiver
  def public_message
    protected_message
  end

  def self_public_message
    self.protected_message
  end

  protected

  def protected_message
    puts "This is a protected message"
  end
end

class Mailbox < Receiver
  def mb_public_message
    ::Mailbox.new.protected_message
  end
end

Receiver.new.public_message

Receiver.new.self_public_message

Mailbox.new.mb_public_message

begin
  Receiver.new.protected_message
rescue => e
  puts e
end

=begin
  Concludion:
  In Ruby, a protected method (or protected message handler) can only respond to a message with an implicit/explicit receiver (object) of the same family.
  It also cannot respond to a message sent from outside of the protected message handler context.
=end