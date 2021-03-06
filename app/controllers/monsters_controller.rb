class MonstersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @monsters = Monster.search_by_monster_characteristic(params[:query])
    else
      @monsters = Monster.all
    end
  end

  def new
    @monster = Monster.new
  end

  def show; end

  def create
    @monster = Monster.new(monster_params)
    @monster.user = current_user

    if @monster.save
      redirect_to monsters_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @monster.update(monster_params)
    redirect_to monster_path(@monster)
  end

  def destroy
    @monster.destroy
    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :description, :price, :photo)
  end

  def set_monster
    @monster = Monster.find(params[:id])
  end
end
