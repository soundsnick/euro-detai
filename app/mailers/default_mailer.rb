class DefaultMailer < ApplicationMailer
  default from: "detal.ev@yandex.ru"
  @to = "yernazar@askarovich.kz"

  def query_email(query)
    @query = query
    mail(to: @to, subject: 'Узнать стоимость ДВС, КПП...')
  end

  def comment_email(comment)
    @comment = comment
    mail(to: @to, subject: "Добавлен новый комментарий от пользователя #{@comment.name}")
  end

  def feedback_email(feedback)
    @comment = feedback
    mail(to: @to, subject: "Добавлен новый отзыв от пользователя #{@comment.name}")
  end

  def order_email(order)
    @order = order
    mail(to: @to, subject: "Новый заказ от пользователя #{@order.name}")
  end
end
