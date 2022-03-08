
# raw_name format: <<photo_name>>.<<ext>>, <<city>>, <<date>> <<time>>
class FileName

    attr_accessor :raw_name, :name, :extension, :city, :date_time

    def initialize(raw_name)
        @raw_name = raw_name

        array_name = raw_name.split(',')

        @name = array_name[0].split('.')[0].gsub(/\s+/,'')

        @extension = array_name[0].split('.')[1]

        @city = array_name[1].gsub(/\s+/,'')

        @date_time = array_name[2]

        @new_name = nil
    end

    def get_new_name
        @new_name
    end

    def set_new_name(name)
        @new_name = name
    end
    
end

# s is a string representing a list of photos
def solution(s)
    name_array = s.split("\n")
  
    obj_name_array = []

    name_array.each do |name|

        fileName = FileName.new( name )

        obj_name_array.push(fileName)

    end

    grouped_cities = obj_name_array.group_by{ |e| [e.city]  }
    grouped_cities.each do |city, pictures|
        count = 0

        sorted_pics = pictures.sort_by{ |pic| [pic.date_time] }
        
        zero_pad_size = sorted_pics.length.to_s.length
        
        sorted_pics.each do |pic|
            count += 1 

            number = "%0#{zero_pad_size}d" % count

            new_name = pic.city + number + "." + pic.extension

            pic.set_new_name(new_name)
            
        end
        
    end

    obj_name_array.each do |pic|
        puts pic.get_new_name
    end

end

# test input contains new lines 
s = "photo.jpg, Warsaw, 2013-09-05 14:08:15
john.png, London, 2015-06-20 15:13:22
myFriends.png, Warsaw, 2013-09-05 14:07:13
Eiffel.jpg, Paris, 2015-07-23 08:03:02
pisatower.jpg, Paris, 2015-07-22 23:59:59 
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Paris, 2015-09-01 12:00:00 
me.jpg, Warsaw, 2013-09-06 15:40:22
a.png, Warsaw, 2016-02-13 13:33:50
b.jpg, Warsaw, 2016-01-02 15:12:22
c.jpg, Warsaw, 2016-01-02 14:34:30
d.jpg, Warsaw, 2016-01-02 15:15:01
e.png, Warsaw, 2016-01-02 09:49:09
f.png, Warsaw, 2016-01-02 10:55:32
g.jpg, Warsaw, 2016-02-29 22:13:11"

solution(s)