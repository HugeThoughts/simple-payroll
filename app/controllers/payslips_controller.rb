class PayslipsController < ApplicationController

	before_action :authenticate_user! #, :except => [:index]
  def index


   	  #@payslip_total=@payslip.basic.to_f + @payslip.conveyance.to_f + @payslip.medical.to_f + @payslip.hra.to_f +  @payslip.bonus.to_f + @payslip.lta.to_f + @payslip.fuel.to_f + @payslip.mobile.to_f - @payslip.loan.to_f -  @payslip.advance.to_f- @payslip.tds.to_f
     # render plain: @payslip.inspect  
  end

  def show_POST
  	session[:month]=params[:show_payslip][:month]
    session[:year]=params[:show_payslip][:year]
    redirect_to(:controller=>'payslips',:action=>'show') 

  end

  def show


  	if current_user
     emp = Employee.where(:email=>current_user.email).first
     @emp_no=emp.emp_no
     #render json: @emp_no.inspect  
   	end

   	@show_month=session[:month]
  	@show_year=session[:year]
  	@payslip_count = Payslip.where("emp_no = ? AND month = ? AND year = ?",@emp_no,session[:month],session[:year]).first
  	
  	if @payslip_count.blank?
  		# flash message is not working... Fix it
  		redirect_to(:controller=>'payslips',:action=>'index', :flash => { :error => "Payslip not found!" })

  		
  	else
  		@payslip=Payslip.where("emp_no = ? AND month = ? AND year = ?",@emp_no,session[:month],session[:year]).first
  		@payslip_total=@payslip.basic.to_f + @payslip.conveyance.to_f + @payslip.medical.to_f + @payslip.hra.to_f +  @payslip.bonus.to_f + @payslip.lta.to_f + @payslip.fuel.to_f + @payslip.mobile.to_f - @payslip.loan.to_f -  @payslip.advance.to_f- @payslip.tds.to_f
    	#@filename = 'my_payslip.pdf'
  	end

    #@payslip_total=@payslip.basic.to_f + @payslip.conveyance.to_f + @payslip.medical.to_f + @payslip.hra.to_f +  @payslip.bonus.to_f + @payslip.lta.to_f + @payslip.fuel.to_f + @payslip.mobile.to_f - @payslip.loan.to_f -  @payslip.advance.to_f- @payslip.tds.to_f
    
    # render plain: @payslip.inspect  
  end

end
