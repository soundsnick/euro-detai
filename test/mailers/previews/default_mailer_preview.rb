# Preview all emails at http://localhost:3000/rails/mailers/default_mailer
class DefaultMailerPreview < ActionMailer::Preview
  def default_mail_preview
    DefaultMailer.query_email(Query.first)
  end
end
