class PayslipsController < ApplicationController

# handle on ly one employee monthly pay for now
# please note @salary refers to @worker_salary. 
# This is a design issue. to be refactored later

def index
    worker = Worker.find(1)
    @worker_salaries = worker.salaries
end

def new
#    @worker = Worker.find(1)
#    @worker= @worker.salaries.new

end

def show
    @worker = Worker.find(1)
    @worker_salaries = @worker.salaries.all
end

#
#def payslip
#
#    @data = EmployeeHelper.get_all
#    @worker = Worker.find(params[:id])
#    @salary = @worker.salary
#    
#    _month = params[:month].to_i
#    month = month_name(params[:month].to_i)
#    year = params[:year].blank? ? Time.now.year : params[:year].to_i
#    @period = "#{month}-#{year}"
#    
#    if @salary.blank?
#      @total_earnings = 0
#      @total_deduct = 0
#      @nett_salary = 0
#      
#      @salary = Salary.new
#      
#          respond_to do |fmt|
#            fmt.html { render 'payslip_monthly' }
#            fmt.json { render :json => [@worker, @total_earnings, @total_deduct, 
#                     @nett_salary] }
#          end
#          
#      else
#      
#        # otherwise if not blank then do the following
#        @total_overtime = 0
#        @total_overtime_earnings = 0.0
#        @adjustment = 0.0
#        @total_earnings = PayslipHelper.total_earnings(@salary)
#        @total_deduct = PayslipHelper.total_deductions(@salary)
#        @nett_salary = PayslipHelper.nett_salary(@total_earnings, @total_deduct)
#        
#        @basic_pay = @salary.salary #adjustments will be added here
#    
#            respond_to do |fmt|
#              fmt.html { render 'payslip_monthly' }
#              fmt.json { render :json => [@worker, @total_earnings, @total_deduct, 
#                                          @nett_salary, @total_overtime, 
#                                          @total_overtime_earnings, @adjustment, @basic_pay] }    
#            end
#      end
#    end


end