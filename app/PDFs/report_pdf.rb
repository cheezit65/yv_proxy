class ReportPdf < Prawn::Document
  def initialize(farm, sale)
    super()
    @farm = farm
    @sale = sale
    text "#{@farm.name} Report for ", :align => :center, :size => 18 
    text "#{sale.Name}", :align => :center, :size => 18
    move_down 15
    printHorses(sale)
  end
  def printHorses(sale)
  @horsePerPage = 1    
  @pageNumber = 1
  @horses = Horse.where(:farm => @farm.id).all ||Horse.where(:farm2 => @farm.id).all
       @saleDetails = Sale.find(@sale.id)
       @horses = Horse.all 
       @horses = @horses.sort_by{|a| a.HipNumber.to_i }
     text "Hip Number                                        Name                                        Page Views       ", :align => :left, :size => 11
       text "----------------------------------------------------------------------------------------------------------------------------", :align => :left, :size => 11
            move_down 24
              
       @horses.each do |horse| 
        if horse.Sale.to_i == @saleDetails.id.to_i && (horse.farm.to_i == @farm.id.to_i || horse.farm2.to_i == @farm.id.to_i) 
           y_position = cursor - 5
          bounding_box([10, y_position],:width => 30,:height => 30) do
          text "#{horse.HipNumber}", :align => :left, :size => 14
          end
          bounding_box([360, y_position],:width => 280,:height => 30) do
          text "#{horse.Name}", :align => :left, :size => 12
          end
          bounding_box([435, y_position],:width => 30,:height => 30) do
          text "#{horse.PageViews}", :align => :left, :size => 12
          end
          # bounding_box([505, y_position],:width => 30,:height => 30) do
          # text "#{horse.g_count}", :align => :left, :size => 12
          # end
       if @horsePerPage.to_i == 17 && @pageNumber.to_i == 1
            start_new_page
            move_down 20
            @horsePerPage = 1
            @pageNumber = 2
          elsif  @horsePerPage.to_i == 20
            start_new_page
            move_down 20
            @horsePerPage = 1            
          else   
              @horsePerPage = @horsePerPage + 1
          end
       end 
       end
  end
end