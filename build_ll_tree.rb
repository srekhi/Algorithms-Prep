require 'byebug'
def min_meeting_rooms(intervals)
    max_conflicts = counter = 0
    starts = []
    ends = []
    intervals.each do |interval|
        starts << interval.start
        ends << interval.end
    end
    starts.sort!
    ends.sort!

    (0...intervals.length).each do |index|
        if ends[index] < starts[index]
            counter -= 1
            ends.shift
        else
            counter += 1
            starts.shift
        end
        max_conflicts = [max_conflicts, counter].max
    end
    max_conflicts
end

p min_meeting_rooms([[0, 30],[5, 10],[15, 20]])
