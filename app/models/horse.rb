class Horse < ActiveRecord::Base 
    validates :Sale, presence: { message: "Missing Sale" }
    require 'date'
    before_create do
      
                       
            @saleName = self.Sale
            if !self.Sale.nil?
            if self.Sale.length < 6
              @saleList = Sale.all
              @saleList.each do |sale|
                if @saleName == sale.SaleCode
                  self.Sale = sale.id                  
                end              
              end
            elsif @saleName.is_a? Numeric
            @sale = Sale.all
            @sale.each do |s|
               if s.id == @saleName
                 self.sale = @saleName
               end
            end
            else               
            @saleList = Sale.all
            @saleList.each do |sale|
              if @saleList.name == sale.Name
                self.Sale = sale.id                  
              end              
            end
            end
            end 
################## Farms

            @farmName = self.farm
         #### 1. Farm Code   
            if self.farm.length < 5
            @farm = Farm.all
            @farm.each do |f|
               if f.FarmCode == @farmName
                 self.farm = f.id
               end
            end
            end

         #### 2. If entry is a number          
            if @farmName.is_a? Numeric
            @farm = Farm.all
            @farm.each do |f|
               if f.id == @farmName
                 self.farm = @farmName
               end
            end
            end 

         #### 3. Farm Name   
            if self.farm.length > 6
             @farm = Farm.all
             @farm.each do |f|
               if f.name == @farmName
                 self.farm = f.id
               end
             end
             end
###########################            
            @sireName = self.sire
# exact match            
            @sireList = Sire.all
            @sireList.each do |sire|
              if sire == self.sire
                @sire1 = self.sire
              end
            end
# match with ID
            if @sireName.is_a? Numeric
            @sire = Sire.all
            @sire.each do |s|
               if s.id == @sireName
                 @sire5 = @sireName
               end
            end
            end
            
# match without special chars or whitespace
            if @sire1.nil? && !self.sire.nil?
            @sireList = Sire.all
            @sireList.each do |sire|
              if sire.Name.gsub(/\s|"|'/, '').downcase == @sireName.gsub(/\s|"|'/, '').downcase
                @sire2 = sire
              end
            end
            end
# no match - new sire and assign 00000 as name
            if @sire1.nil? && @sire2.nil? && self.sire.nil?
              @sire3 = "00000"
            end
# no sire input at all
            if self.sire.nil?
              @sire4 = "00000"
            end
            
            if !@sire1.nil?
              self.sire = @sire1.id
            elsif !@sire2.nil?
              self.sire = @sire2.id
            elsif !@sire3.nil?
              self.sire = @sire3
            elsif !@sire4.nil?
              self.sire = @sire4
             elsif !@sire5.nil?
              self.sire = @sire5
            end          
          
                       
            if self.Gender == "f" 
              self.Gender = "filly"              
            elsif self.Gender == "c"
              self.Gender = "colt"              
            elsif self.Gender == "g"
              self.Gender = "gelding"              
            end
            
            if self.Gender == "filly"
              self.Gender = "filly"
            elsif self.Gender == "colt"
              self.Gender = "colt"
             elsif self.Gender == "gelding"
               self.Gender = "gelding"
            end
        
        current_time = DateTime.now
        new_time = current_time.strftime "%y"
        @video  = self.BulkUploadVideoName
            if @video == "" || @video.nil?
              @sale = Sale.all
              @sale.each do |sale|
                if sale.id.to_i == self.Sale.to_i
                  self.BulkUploadVideoName = new_time + sale.SaleCode + self.HipNumber + ".mp4"                  
                end
              end
             else
            self.BulkUploadVideoName = @video
           end
           
           
  end

def self.search(search)
  where("name LIKE ?", "%#{search}%") 
end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      return :failed unless Horse.create! row.to_hash
    end
  end
end
 