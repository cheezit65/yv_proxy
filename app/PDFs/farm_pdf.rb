class FarmPdf < Prawn::Document
    require 'rqrcode'
  def initialize(farm, sale)
    super()
    @farm = farm
    text "QR Code List for #{@farm.name}", :align => :center, :size => 18
    start_new_page
    printHorses(sale)
  end
  def printHorses(sale)
  @horses = Horse.where(:farm => @farm.id).all ||Horse.where(:farm2 => @farm.id).all
        @saleDetails = Sale.find(sale)
       @horses = @horses.sort_by{|a| a.HipNumber.to_i }
              
       @horses.each do |horse| 
       qrcode = RQRCode::QRCode.new("http://www.yearlingvideos.com/horses/#{horse.id}")
       png = qrcode.as_png(
              resize_gte_to: false,
              resize_exactly_to: false,
              fill: 'white',
              color: 'black',
              size: 240,
              border_modules: 4,
              module_px_size: 6,
              file: nil # path to write
              )
       png.save('./tmp/temp.png')
        if horse.Sale.to_i == @saleDetails.id.to_i && (horse.farm.to_i == @farm.id.to_i || horse.farm2.to_i == @farm.id.to_i) 
          text "#{@farm.name.upcase}", :align => :center, :size => 18
          text "#{horse.HipNumber} #{horse.Name}", :align => :center, :size => 18
          image "./tmp/temp.png", :position => :center
          move_down 24
          text "Watch #{horse.Name}'s Video on", :align => :center, :size => 18
          text "YearlingVideos.com", :align => :center, :size => 18
          move_down 24
       end 
       end
  end
end