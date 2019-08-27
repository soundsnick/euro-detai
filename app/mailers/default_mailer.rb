class DefaultMailer < ApplicationMailer
  default from: "detal.ev@yandex.ru"

  def query_email(query)
    @query = query
    mail(to: "soundsnick@gmail.com", subject: 'Узнать стоимость ДВС, КПП...')
  end

  def comment_email(comment)
    @comment = comment
    mail(to: "detal911@yandex.ru", subject: "Добавлен новый комментарий от пользователя #{@comment.name}")
  end

  def feedback_email(feedback)
    @comment = feedback
    mail(to: "detal911@yandex.ru", subject: "Добавлен новый отзыв от пользователя #{@comment.name}")
  end

  def order_email(order)
    @order = order
    mail(to: "detal911@yandex.ru", subject: "Новый заказ от пользователя #{@order.name}")
  end
end
