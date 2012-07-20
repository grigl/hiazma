class FeedbacksController < ApplicationController
  def create
    @message = Feedback.new(params[:feedback])

    if @message.valid?
      render 'feedback_done', formats: :js
      FeedbackMailer.feedback(@message).deliver
    else
      render nothing: true
    end
  end
end
