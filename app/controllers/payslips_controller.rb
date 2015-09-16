
class PayslipsController < ApplicationController

	before_action :authenticate_user!
  def index
	@emp_array = Employee.all.map { |emp| [emp.name, emp.emp_no] }
	@month_array = [["January", "1"], ["February", "2"], ["March", "3"],["April", "4"], ["May", "5"], ["June", "6"], ["July", "7"], ["August", "8"], ["September", "9"], ["October", "10"], ["November", "11"], ["December", "12"]]
  	@year_array = [["2015", "2015"]]
  	if current_user
     emp = Employee.where(:email=>current_user.email).first
     @isAdmin=emp.isAdmin
     @currentEmpNo=emp.emp_no
   	end 
  end

  def show_payslip
    
  	session[:show_emp_no]=params[:show_payslip][:emp_no]  
   	session[:show_month]=params[:show_payslip][:month]
  	session[:show_year]=params[:show_payslip][:year]
  	redirect_to(:controller=>'payslips',:action=>'payslip')

  end


  def payslip

  	@payslip_count = Payslip.where("emp_no = ? AND month = ? AND year = ?",session[:show_emp_no],session[:show_month],session[:show_year]).first
  	
  	if @payslip_count.blank?
  		flash[:payslip_error] = "Payslip not found!"
  		redirect_to(:controller=>'payslips',:action=>'index')

  		
  	else

  		@payslip=Payslip.where("emp_no = ? AND month = ? AND year = ?",session[:show_emp_no],session[:show_month],session[:show_year]).first
  		@payslip_total=@payslip.basic.to_f + @payslip.conveyance.to_f + @payslip.medical.to_f + @payslip.hra.to_f +  @payslip.bonus.to_f + @payslip.lta.to_f + @payslip.fuel.to_f + @payslip.mobile.to_f - @payslip.loan.to_f -  @payslip.advance.to_f- @payslip.tds.to_f

  	end

  end

  def import

  end

  def import_payslip
    begin
      Payslip.import(params[:file])
      redirect_to(:controller=>'payslips',:action=>'import', notice: "PaySlip has been imported.")
    rescue
      redirect_to(:controller=>'payslips',:action=>'import', notice: "Invalid CSV file format.")
    end
  end

end