class GalleriesController < ApplicationController
  def index
    @diaries = Diary.order('created_at DESC').page(params[:page]).per(12)
  end
end
