class MyDeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  before_filter :add_inline_attachment!

  def add_inline_attachment!
   attachments.inline['quo.png'] = File.read(Rails.public_path.join('quo.png'))
  end
end