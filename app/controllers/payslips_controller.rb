class PayslipsController < ApplicationController
    before_action :set_form_params
    before_action :set_params, only: [:show_multiple]
    

    #add_crumb('Payslips') {|instance| instance.send :payslips_path }
    
    def index
        @tax_range_empty ||= TaxRange.all.empty?
        flash.now[:error] = 'Please setup Tax Range model on db:seed' if @tax_range_empty

    end
    
    def show_multiple
        respond_to do |format|
            if payslip_collection
                format.js { render 'show_multiple'}
                format.csv
            else
                flash[:error] = @errors.full_messages
                format.js { render 'show_multiple_error' }
            end
        end
    end
    

    private
    
    def payslip_collection
        @payslips = []; @errors = ''
        @workers.each do |worker|
            payslip = Payslip.new(worker: worker,pay_period_start_date: @pay_period_start_Date, pay_period_end_date: @pay_period_end_date)
            if payslip.errors.any?
                @errors = @payslip.errors
            else
                @payslips << payslip
            end
        end
        @errors.empty?
    end
    
    def set_form_params
        @workers_for_select ||= Worker.all
    end
    
    def set_params
        @workers = Worker.find(payslip_params[:worker_id]) if payslip_params[:worker_id]
        @pay_period_start_date = payslip_params[:payslip_start_date] if payslip_params[:payslip_start_date]
        @pay_period_end_date   = payslip_params[:payslip_end_date]   if payslip_params[:payslip_end_date] 
        @params_for_csv = {worker_id: @workers.map(&:id), payslip_end_date: @pay_period_end_date, payslip_start_date: @pay_period_start_date}
    end

    def payslip_params
        params[:payslips]
    end


end
#
## handle only one employee monthly pay for now
## please note @salary refers to @worker_salary. 
## This is a design issue. to be refactored later
#
##How I fixed One to Many relationship issue:
##***********
##Create Worker first from interface or seed. 
##and assign to @worker e.g. @worker =Worker.first
##Next Create a new @salary variable e.g. @salary=Salary.new
##Next. Attach a worker to that salary like this  before saving :  @salary.worker = @worker
##Finally allocate the created salary  and save.
##Finally save the salary : @salary = @salary.save!
#
#
#
#def index
#    @worker = Worker.first
#    @salaries = @worker.salaries.build
#end
#
#def new
#    @worker = Worker.first
#    @Salary = Salary.new
#
#end
#
#def create
#   @worker = Worker.first
#   @Salary = Salary.new
#   @salary.worker = @worker 
#   @salary.save!
#end
#
#def show
#   @worker = Worker.find(1)
#   @salaries = @worker.salaries
#   #we shall loop to get several salaries
#   @salary = @worker.salary[0]
#end
#
##===========================Always comment or remove================================================
##def payslip
##
##    @data = EmployeeHelper.get_all
##    @worker = Worker.find(params[:id])
##    @salary = @worker.salary
##    
##    _month = params[:month].to_i
##    month = month_name(params[:month].to_i)
##    year = params[:year].blank? ? Time.now.year : params[:year].to_i
##    @period = "#{month}-#{year}"
##    
##    if @salary.blank?
##      @total_earnings = 0
##      @total_deduct = 0
##      @nett_salary = 0
##      
##      @salary = Salary.new
##      
##          respond_to do |fmt|
##            fmt.html { render 'payslip_monthly' }
##            fmt.json { render :json => [@worker, @total_earnings, @total_deduct, 
##                     @nett_salary] }
##          end
##          
##      else
##      
##        # otherwise if not blank then do the following
##        @total_overtime = 0
##        @total_overtime_earnings = 0.0
##        @adjustment = 0.0
##        @total_earnings = PayslipHelper.total_earnings(@salary)
##        @total_deduct = PayslipHelper.total_deductions(@salary)
##        @nett_salary = PayslipHelper.nett_salary(@total_earnings, @total_deduct)
##        
##        @basic_pay = @salary.salary #adjustments will be added here
##    
##            respond_to do |fmt|
##              fmt.html { render 'payslip_monthly' }
##              fmt.json { render :json => [@worker, @total_earnings, @total_deduct, 
##                                          @nett_salary, @total_overtime, 
##                                          @total_overtime_earnings, @adjustment, @basic_pay] }    
##            end
##      end
##    end
#

#end