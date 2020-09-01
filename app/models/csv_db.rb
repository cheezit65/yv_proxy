require 'csv'
class CsvDb
  class << self
    def convert_save(model_name, csv_data, errors)
      $. = 0
      csv_file = csv_data.read
      lines = CSV.parse(csv_file)
      header = lines.shift
      lineNumber = 1
      lines.each do |line|
        attributes = Hash[header.zip line]
        target_model = model_name.classify.constantize
         unless target_model.create(attributes).valid?
           errors.push(lineNumber)
         end
         lineNumber = lineNumber + 1
      end
       return errors
    end
  end
end