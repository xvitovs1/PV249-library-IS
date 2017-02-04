class ExpiredBorrowNotifier < ApplicationMailer

  # Send an email to a user with expired borrow date
  # @param user user with expired borrow date
  def send_expired_borrow_email(borrow)
    @borrow = borrow
    mail( :to => @borrow.get_user.email,
         :subject => 'Your borrow has expired')
  end
end
