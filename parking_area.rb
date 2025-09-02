require "json"

class ParkingArea
    OCCUPANCY_RATE = ['L','M','H']
    def initialize
        @spots = JSON.parse(File.read("parking.json"), symbolize_names: true)
    end

    def total_spots
        @spots.size
    end

    def total_by_type
        @spots.group_by {|s| s[:type]}.map {|k,v| [k,v.size]}.to_h  #returning a hash 
    end

    def two_wheeler_spots
        @spots.count {|s| s[:type] == 1}
    end

    def four_wheeler_spots
        @spots.count {|s| s[:type] == 2}
    end

    def check_vacancy
        @spots.select {|s| s[:vacant]== true}   # array of vacant spots
    end

    def details_spot
        @spots.map do |s|           #[{},{}]
            {
                id: s[:id],
                type: s[:type],
                vacant: s[:vacant],
                close_exit: s[:close_exit]
            }
        end
    end

    def assign_spot(user)
        spot_id = user[:id]
        spot = @spots.find {|s| s[:id]== spot_id}
        return "Spot not found" unless spot 

        spot[:vacant] = false
        spot[:arriving_at] = Time.now.to_s
    end

    def check_occupancy
        total = @spots.size
        vacant = @spots.count {|s| s[:vacant]}
        percentage = (vacant / total) * 100
        if percentage > 90
            OCCUPANCY_RATE[2]
        elsif percentage >= 50 and percentage <= 90
            OCCUPANCY_RATE[1]
        else
            OCCUPANCY_RATE[0]
        end
    end

    def release_spot(user)
        spot_id = user[:id]
        spot = @spots.find{ |s| s[:id] == spot_id}
        return "Spot not found" unless spot
        return "Spot #{spot_id} is already vacant..." if spot[:vacant]

        spot[:vacant] = true
        spot[:exit_at] = Time.now.to_s
    end
end

# a = ParkingArea.new
# p a.total_spots
# p a.total_by_type
# p a.two_wheeler_spots
# p a.four_wheeler_spots
# p a.check_vacany
# p a.details_spot
# p a.check_occupancy
