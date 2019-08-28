class DefaultMailer < ApplicationMailer
  default from: "detal.ev@yandex.ru"

  def query_email(query)
    @query = query
    mail(to: "yernazar@askarovich.kz", subject: 'Узнать стоимость ДВС, КПП...')
  end

  def comment_email(comment)
    @comment = comment
    mail(to: "yernazar@askarovich.kz", subject: "Добавлен новый комментарий от пользователя #{@comment.name}")
  end

  def feedback_email(feedback)
    @comment = feedback
    mail(to: "yernazar@askarovich.kz", subject: "Добавлен новый отзыв от пользователя #{@comment.name}")
  end

  def order_email(order)
    @order = order
    mail(to: "yernazar@askarovich.kz", subject: "Новый заказ от пользователя #{@order.name}")
  end
end
