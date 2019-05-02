class DefaultMailer < ApplicationMailer
  default from: "info@xn----8sbejcd7btry6i.xn--p1ai"

  def query_email(query)
    @query = query
    mail(to: "soundsnick@gmail.com", subject: 'Узнать стоимость ДВС, КПП...')
  end

  def comment_email(comment)
    @comment = comment
    mail(to: "soundsnick@gmail.com", subject: "Добавлен новый комментарий от пользователя #{@comment.name}")
  end

  def feedback_email(feedback)
    @comment = feedback
    mail(to: "soundsnick@gmail.com", subject: "Добавлен новый отзыв от пользователя #{@comment.name}")
  end

  def order_email(order)
    @order = order
    mail(to: "soundsnick@gmail.com", subject: "Новый заказ от пользователя #{@order.name}")
  end
end
