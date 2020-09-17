require "pry"
class Transfer
  # your code here

  attr_accessor :amount, :status
  attr_reader :sender, :receiver

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
      
    end

    def valid?
      self.receiver.valid? && self.sender.valid?   
    end

    def execute_transaction
      if self.valid? == true && self.sender.balance >= self.amount && self.status == "pending"
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == "complete"
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount
        self.status = "reversed"
      end
    end


end
