class Payslip < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash # exclude the price field
      product = Payslip.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        Payslip.create!(product_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end # end class