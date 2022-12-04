class GalleriesController < ApplicationController
  def index
    @diaries = Diary.order('created_at DESC')
  end
end
