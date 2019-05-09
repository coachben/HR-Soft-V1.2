module Companies

#disregard index,show and destroy method in routes since we in context of a client

    class WorkersController < ApplicationController
    
        def index
            @workers = Worker.all
        end
        
       def show
            @company = Company.find(params[:company_id])
            @worker = worker.find(params[:worker_id])
            @worker.company = @company
        end
        
        def new
            @company = Company.find(params[:company_id])
            @worker = Worker.new
        end
        
        def create
            @worker = Worker.new(worker_params)
            @company = Company.find(params[:company_id])
            @worker.company = @company
            
            
            if @worker.save(worker_params)
                redirect_to worker_path(@worker.id)
            else
                render 'new'
            end
            
        end
        
        def edit
            @company = Company.find(params[:company_id])
            @worker.company = @company        
        end        

        
        def update
            @company = Company.find(params[:company_id])
            @worker.company = @company
            
            if @worker.update(worker_params)
                redirect_to company_worker_path(@worker.id)
    
            else
                render 'edit'
            end
        end
        
        
        private
        def worker_params
            params.require(:worker).permit( :code, :first_name, :last_name, :emp_mode, :role, :email, :reporting_manager, :job_title, :exprerience, :tel, :status, :company_id)
        end
    end

end