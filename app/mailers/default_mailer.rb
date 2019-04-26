class DefaultMailer < ApplicationMailer
  default from: "info@"

  def query_email(query)
    @query = query
    mail(to: "detal.ev@yandex.ru", subject: 'Узнать стоимость ДВС, КПП...')
  end

  def comment_email(comment)
    @comment = comment
    mail(to: "detal.ev@yandex.ru", subject: "Добавлен новый комментарий от пользователя #{@comment.user.name}")
  end

  def feedback_email(feedback)
    @comment = feedback
    mail(to: "detal.ev@yandex.ru", subject: "Добавлен новый отзыв от пользователя #{@comment.name}")
  end

  def order_email(order)
    @order = order
    mail(to: "detal.ev@yandex.ru", subject: "Новый заказ от пользователя #{@order.name}")
  end
end
