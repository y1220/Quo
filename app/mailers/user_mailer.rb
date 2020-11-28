class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer' # to make sure that your mailer uses the devise views

  default from: 'quo.notify.2020@gmail.com'

  #before_action :add_inline_attachment!

  def confirmation_instructions(record, token, opts={})
  #	byebug
   @resource= record 
   #attachments.inline['quo.png'] = File.read(Rails.public_path.join('quo.png'))
   @token= token
   mail(to: record.email, subject: 'Welcome Email')
   #super
  end

  private
  def add_inline_attachment!
    attachments.inline['header.jpg'] = File.read(File.join(Rails.public_path.join('quo.png')))
  end

end