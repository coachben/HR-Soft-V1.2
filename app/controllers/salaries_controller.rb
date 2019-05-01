class SalariesController < ApplicationRecord

  def new
    @Salary = Salary.new
  end

  def create

    
    if @salary.save
        redirect to worker_path(@salary.worker), notice: 'Successfully Raised Salary'
    else
    
      render :new
      
    end
  end

  def destroy
    @salary = Salary.find(params[:id])
    
    msg = @salary.destroy ? 'Salary deleted Successfuly.' : 'Failed to delete salary. Please try again.'
    redirect_to worker_path(params[:worker_id]), notice: msg
  end

  private

  def salary_params
    params.require(:salary).permit(:id,:start_date, :annual_amount,:worker_id)
  end

end