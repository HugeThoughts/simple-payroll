class Payslip < ActiveRecord::Base
  belongs_to :employee
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      payslip_hash = row.to_hash # exclude the price field
      payslip = Payslip.where(id: payslip_hash["id"])

      if payslip.count == 1
        payslip.first.update_attributes(payslip_hash)
      else
        Payslip.create!(payslip_hash)
      end # end if !payslip.nil?
    end # end CSV.foreach
  end # end self.import(file)
end # end class