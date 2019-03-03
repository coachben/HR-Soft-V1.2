class EmployeesController < ApplicationController
    before_action :set_employee, only:[ :show, :edit, :update, :destroy]



    def index
        @employees = Employee.all
    end
    

    def show
        @employee = Employee.find(params[:id])
    end
    
    def new
        @employee = Employee.new
    end
    

    def create
        @employee = Employee.new(employee_params)
        respond_to do |format|
            if @employee.save
                format.html {redirect_to @company, notice: 'Employee was created successfuly'}
                format.json{render :show, status: :created, location: @employee}
            else
                format.html{render :new}
                format.json { render json: :employee.errors, status: :unprocessable_entity }

            end
        end
    end



    def update
        respond_to do |format|
            if @employee.update(employee_params)
            format.html{redirect_to @employee, notice: 'Employee was successfully updated.'}
            format.json{render :show, status: :ok, location: @employee}
            else
              format.html{redirect_to @employee, notice: 'Employee was successfully updated.'}
              format.json{render :show, status: :ok, location: @employee}
            end
        end
    end
    
    def destroy
        @employee.destroy
        respond_to do |format|
            format.html{redirect_to employees_url, notice: 'Employee was successfully destroyed'}
            format.json{head "no_content"}
        end
    end
 
 
    private
    
    def set_employee
        @employee = Employee.find(params[:id])
    end
    
    #nevertrust the scary internet
    def employee_params
        params.require(:employee).permit(:firstname, :code, :nationalid, :company_id)
    end

end
