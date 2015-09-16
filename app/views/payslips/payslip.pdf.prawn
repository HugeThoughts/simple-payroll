prawn_document(:page_layout => :portrait) do |pdf|
  #pdf.text "Hello World"
  #pdf.text @payslip.bonus
  # Assign the path to your file name first to a local variable.
  logopath = "public/images/logo.jpg"

  # Displays the image in your PDF. Dimensions are optional.
  pdf.image logopath

  pdf.move_down 70
 
	# Add the font style and size
	pdf.font "Helvetica"
	pdf.font_size 18
	pdf.text_box "PaySlip # #{ @payslip.id }", :align => :right
	 
	pdf.font_size 22
	pdf.text "Hey it can retrieve details from ActiveRecord (Basic Amount), #{ @payslip.basic }.", :align => :center
	pdf.move_down 20
	 
	pdf.font_size 14
	pdf.text "Below you can find your order details. We hope you shop with Awesome Company again in the future. Now unleash those fonts like hell have no fury!", :align=> :center

         
      
    
      
   
         

	payslipinfo =	[
						["Basic", @payslip.basic ],
						["Conveyance", @payslip.conveyance],
						["Medical", @payslip.conveyance],
						["Bonus", @payslip.bonus ],
						["HRA", @payslip.hra],
						["LTA", @payslip.lta],
						["Fuel", @payslip.fuel],
						["Mobile", @payslip.mobile ],
						["Loan", "- #{@payslip.loan}"],
						["Advance", "- #{@payslip.advance}"],
						["TDS", "- #{@payslip.tds}"],
						["Total", @payslip_total]
							
					]
 
	pdf.move_down 30
	 
	pdf.table payslipinfo

end

