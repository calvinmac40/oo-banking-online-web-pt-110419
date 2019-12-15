require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :transfer, :status, :amount, :valid
  
  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if  @sender.valid? && @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "rejected"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  # def execute_transaction
  #   if @sender.balance > @amount || @status == "pending"
  #       @sender.balance - @amount
  #       @receiver.balance + @amount
  #       @status = "complete"
  #   elsif @sender != valid?
  #       @status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   end
  #   end
  
  def execute_transaction
    if  @sender.balance != valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      #binding.pry
    end
  end

   
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end

# instead of if @sender.balance > @amount && @status == "pending"
# User avatar
# John Chriest 9 MINUTES AGO
# try if valid? && @sender.balance > @amount && @status == "pending"
