require 'gosu'
require 'gosu_texture_packer'

def media_file(subfolder,file)
  File.join(File.dirname(__FILE__),'Media',subfolder,file)
end

class LoadTiles<Gosu::Window
  WIDTH=800
  HEIGHT=600
  TILE_SIZE=128

  def initialize
    super(WIDTH,HEIGHT,false)
    # self.caption "TileMap"
    @tileset=Gosu::TexturePacker.load_json(self,media_file('ground_tilesest','ground.json'),:precise)
    puts media_file('ground_tilesest','ground.json')
    @redraw=true
  end

  def button_down(id)
    close if id==Gosu::KbEscape
    @redraw=true if id==MsRight
  end

  def needs_redraw?
    @redraw
  end

  def draw
    @redraw=false
    (0..WIDTH/TILE_SIZE).each do |x|
      (0..HEIGTH/TILE_SIZE).each do |y|
        @tileset.frame(@tileset.frame_list.sample).draw(x*(TILE_SIZE),y*(TILE_SIZE),0)
      end
    end
  end
end

window=LoadTiles.new
window.show
