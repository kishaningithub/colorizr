class String
  def self.colors
    color_hash.keys
  end
  def self.create_colors
    colors.each do |color|
      send(:define_method, "#{color}") do
        "\e[#{String.color_hash()[color]}m#{self}\e[0m"
      end
    end
  end
  def self.sample_colors
    colors.each do |color|
      puts "This is #{color.to_s.send color}"
    end
  end
  private
    def self.color_hash
     {
        red: 31,
        green: 32,
        yellow: 33,
        blue: 34,
        pink: 35,
        light_blue: 94,
        white: 97,
        light_grey: 37,
        black: 30
     }
   end
end
String.create_colors

