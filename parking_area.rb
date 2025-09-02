require "json"
require "time"
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
                close_to_exit: s[:close_exit]
            }
        end
    end

    def get_spot_by_id(spot_id)
        spot = @spots.find {|s| s[:id] == spot_id}
        return spot
    end

    def assign_spot(spot_id,duration)
        spot = @spots.find {|s| s[:id]== spot_id}
        return "Spot not found" unless spot 

        spot[:vacant] = false
        spot[:duration] = duration
        spot[:arriving_time] = Time.now.iso8601
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

    def set_exit_time(spot_id)
        spot[:exit_time] = Time.now.iso8601
    end

    def release_spot(spot_id)
        spot = @spots.find{ |s| s[:id] == spot_id}
        return "Spot not found" unless spot
        return "Spot #{spot_id} is already vacant..." if spot[:vacant]

        spot[:vacant] = true
        spot[:arriving_time] = nil
        spot[:exit_time] = nil
        spot[:duration] = nil
    end

    def real_time_spots
        puts "\nParking Lot Status:\n\n"
        @spots.each_slice(5) do |row|
            row.each do |s|
                print s[:vacant] ? "[ ] " : "[X] "
            end
            puts ""
        end
        puts "\n"
    end
end


