require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :valid
  attr_reader :transfer
  
  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @amount = transfer
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if  @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
        binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if  @status == "rejected"
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = "reversed"
    end
  end
end