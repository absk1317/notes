class NotesController < ApplicationController
  def index
    flash[:success] = "Welcome #{current_user.name}!"
    @notes = current_user.notes.order(:created_at).page(params[:page])
  end
end