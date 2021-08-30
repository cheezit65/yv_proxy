class LinkersController < InheritedResources::Base
 require 'yaml'
# Create report in controller

def new
  if params[:sale2]
    @salelist = Sale.all    
    @salelist.each do |sale|
    if sale.id.to_i == params[:sale2][:sale_id2].to_i
      @sale = sale        
      end     
    end     
    filewrite = File.open("app/PDFs/#{@sale.Name} Itemized Report.doc",'w')  
    filewrite.write(@sale.Name + "\n\n")
    @farmList = Farm.all
    @farmList.each do |farmy|
      @horselist1 = Horse.where(:Sale => @sale.id).all 
      @horselist = @horselist1.order('created_at DESC') 
      @horselist.each do |hy|      
        if hy.farm.to_s == farmy.id.to_s
          if hy.HipNumber.length == 1          
            filewrite.write(hy.HipNumber + "\t\t")
          elsif hy.HipNumber.length == 2          
            filewrite.write(hy.HipNumber + "\t\t")
          elsif hy.HipNumber.length == 3          
            filewrite.write(hy.HipNumber + "\t\t")
          end          
          filewrite.write(hy.Name)
          if hy.Name.length > 13
            filewrite.write("\t")
          elsif hy.Name.length < 8
            filewrite.write("\t\t\t")
          else
            filewrite.write("\t")
          end
          if !hy.farm.nil? && !hy.farm2.nil? && hy.farm2 != ""  
            @farm = Farm.find(hy.farm)
            @farm2 = Farm.find(hy.farm2)
            filewrite.write(@farm.name + "\t\t" + @farm2.name + "\n")
          else
            @farm = Farm.find(hy.farm)
            filewrite.write(@farm.name + "\n")
          end
        end
      end
    end   
    @farmList = Farm.all
    @farmList.each do |farmy|
      @horselist1 = Horse.where(:Sale => @sale.id).all 
      @horselist = @horselist1.order('created_at DESC') 
      @horselist.each do |hy|      
        if hy.farm2.to_s == farmy.id.to_s
          if hy.HipNumber.length == 1          
            filewrite.write(hy.HipNumber + "\t\t")
          elsif hy.HipNumber.length == 2          
            filewrite.write(hy.HipNumber + "\t\t")
          elsif hy.HipNumber.length == 3          
            filewrite.write(hy.HipNumber + "\t\t")
          end          
          filewrite.write(hy.Name)
          if hy.Name.length > 13
            filewrite.write("\t")
          elsif hy.Name.length < 8
            filewrite.write("\t\t\t")
          else
            filewrite.write("\t")
          end
          if !hy.farm.nil? && !hy.farm2.nil? && hy.farm2 != ""  
            @farm = Farm.find(hy.farm)
            @farm2 = Farm.find(hy.farm2)
            filewrite.write(@farm.name + "\t\t" + @farm2.name + "\n")
          else
            @farm = Farm.find(hy.farm)
            filewrite.write(@farm.name + "\n")
          end
        end
      end
    end   
    filewrite.close 
    send_file("app/PDFs/#{@sale.Name} Itemized Report.doc")
  else
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

end
