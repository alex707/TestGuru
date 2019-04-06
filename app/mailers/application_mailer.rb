class ApplicationMailer < ActionMailer::Base
  default from: 'servant.main@gmail.com',
          to: -> { Admin.pluck(:email) }
  layout 'mailer'
end
