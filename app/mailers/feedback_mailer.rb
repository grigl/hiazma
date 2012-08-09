class FeedbackMailer < ActionMailer::Base
  default from: "no-reply@ufna.ru"

  def feedback(message)
    @message = message
    mail to: Setting.where('name = ?', 'feedback_email_to').first.value, subject: 'Feedback'
  end
end
