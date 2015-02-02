class ApplicationMailer < ActionMailer::Base
  default from: "gtcampuscloset@gmail.com"
  
  def send_contact(message)
  	mail(to: "gtcampuscloset@gmail.com", subject: "Campus Closet Inquiry")
  end
end
