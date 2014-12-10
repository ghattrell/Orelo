class DesiredLanguagesController < ApplicationController
  before_filter :set_desired_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @desired_languages = DesiredLanguage.all
    respond_with(@desired_languages)
  end

  def show
    respond_with(@desired_language)
  end

  def new
    @desired_language = DesiredLanguage.new
    respond_with(@desired_language)
  end

  def edit
  end

  def create
    @desired_language = DesiredLanguage.new(params[:desired_language])
    @desired_language.save
    respond_with(@desired_language)
  end

  def update
    @desired_language.update_attributes(params[:desired_language])
    respond_with(@desired_language)
  end

  def destroy
    @desired_language.destroy
    respond_with(@desired_language)
  end

  private
    def set_desired_language
      @desired_language = DesiredLanguage.find(params[:id])
    end
end
