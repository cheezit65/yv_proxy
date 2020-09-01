class UploadsController < ApplicationController
 require 'yaml'
 
# Create report in controller
def new
    @salelist = Sale.all
    @salelist.each do |sale|
      if sale.id.to_i == params[:sale][:sale_id].to_i
        @sale = sale        
      end     
    end 
    filewrite = File.open("app/PDFs/#{@sale.Name}.doc",'w')  
    filewrite.write(@sale.Name + "\n\n")
    @horselist1 = Horse.where(:Sale => @sale.id).all 
    @horselist = @horselist1.order('created_at DESC') 
    @horselist.each do |hy|
      if hy.HipNumber.length == 1          
        filewrite.write(hy.HipNumber + "   ")
      elsif hy.HipNumber.length == 2          
        filewrite.write(hy.HipNumber + "  ")
      elsif hy.HipNumber.length == 3          
        filewrite.write(hy.HipNumber + " ")
      end  
        
        filewrite.write(hy.Name)
          if hy.Name.length > 13
            filewrite.write("\t")
          elsif hy.Name.length < 8
            filewrite.write("\t\t\t")
          else
            filewrite.write("\t")
               
          end
      filewrite.write("http://www.yearlingvideos.com/horses/" + hy.id.to_s + "\n")        
     end   
     filewrite.close 
 send_file("app/PDFs/#{@sale.Name}.doc")
end

  end