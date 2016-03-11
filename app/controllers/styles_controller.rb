class StylesController < ApplicationController
  before_action :find_style, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @styles = Style.all.order("created_at DESC")
  end

  def show
  end

  def new
    @style = current_user.styles.build
  end

  def create
    @style = current_user.styles.build(style_params)

    if @style.save
      redirect_to @style, notice: "Style successfully created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @style.update(style_params)
      redirect_to @style, notice: "Style was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @style.destroy
    redirect_to root_path
  end

  def upvote
    @style.upvote_by current_user
    redirect_to :back
  end

  private

  def style_params
    params.require(:style).permit(:title, :description, :image)
  end

  def find_style
    @style = Style.find(params[:id])
  end
end
