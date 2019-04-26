class DefaultMailer < ApplicationMailer
  default from: "info@"

  def query_email(query)
    @query = query
    mail(to: "detal.ev@yandex.ru", subject: 'Узнать стоимость ДВС, КПП...')
  end
end
