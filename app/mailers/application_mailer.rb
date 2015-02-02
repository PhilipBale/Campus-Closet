class ApplicationMailer < ActionMailer::Base
  default from: "Gatechcampuscloset@gmail.com"
  
  def send_contact(message)
  	mail(to: "Gatechcampuscloset@gmail.com", subject: "Campus Closet Inquiry")
  end
end
