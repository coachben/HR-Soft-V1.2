RailsAdmin.config do |config|

  #This helps the una-authorized access errors to work effectivly
  config.parent_controller = 'ApplicationController'

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with  do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  

  # config.main_app_name = ["HR Soft Admin", "BackOffice"]
  config.main_app_name = ["HR Soft", ""]


  ## == Cancan ==
  # config.authorize_with :cancan 
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # Include the necessary models in the navigation like this and rails s
  # config.included_models = ["User", "Post"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    
    # n/b this permits edit for User model only
    # edit do
    #    only ["User"]
    # end
  end
  

end
