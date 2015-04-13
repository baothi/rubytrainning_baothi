class ProductMailer < ActionMailer::Base
  default from: "baothi246@gmail.com"
  def send_email(products,email)
    @products = products
    mail(to: email , subject: 'Send Email all product')
  end
end