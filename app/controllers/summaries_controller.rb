class SummarysController < ApplicationController
  def create
    @summary = Summary.new(params.require(:summary).permit(:name, :description))
    if @summary.save
      redirect_to @summary, notice: "summary was saved successfully."
    else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end

  end

  def show
    @summary = Summary.find(params[:id])
  end
end
