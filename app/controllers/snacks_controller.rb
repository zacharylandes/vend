class SnacksController < ApplicationController


  def show
    @snack = Snack.find(params[:id])
    @machines = @snack.machines.all
  end
end
