class OrderMailer < ActionMailer::Base
  
  # methods
  
  ######################################################
  # -- Output: send mail with text plain format
  # LongPH - Oct 27th, 2011
  #    create
  ######################################################
  def confirm(order)
    subject    'WindRunner Shop: confirmation email for your order'
    recipients order.email
    from       'windrunnershop@gmail.com'
    sent_on    Time.now
    
    body       :order => order
  end

  ######################################################
  # -- Output: send mail with HTML format
  # LongPH - Oct 27th, 2011
  #    create
  ######################################################
  def sent(order)
    subject    'WindRunner Shop: confirmation email for your order'
    recipients order.email
    from       'windrunnershop@gmail.com'
    sent_on    Time.now
    
    body       :order => order
  end
  
  ######################################################
  # -- Output: email saved in database
  # LongPH - Oct 27th, 2011
  #    create
  ######################################################
  def receive(email)
    ticket = Ticket.new
    ticket.from_email = email.from[0]
    ticket.initial_report = email.body
    if email.has_attachments?
      email.attachments.each do |attachment|
        collateral = TicketCollateral.new(
          :name => attachment.original_filename,
          :body => attachment.read)
        ticket.ticket_collaterals << collateral
      end
    end
    ticket.save
  end

	######################################################
  # -- Output: send mail with love information
  # LongPH - Dec 3rd, 2011
  #    create
  ######################################################
  def love_sent(name_array)
    subject    'WindRunner Shop: love email from a mysterious person'
    recipients 'phanhoanglong2610@gmail.com'
    from       'windrunnershop@gmail.com'
    sent_on    Time.now
    
    body       :name_array => name_array
  end
  
  
end
