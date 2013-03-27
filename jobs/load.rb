# Populate the graph with 0.00 results
points = []
(1..10).each do |i|
  points << { x: i, y: 0 }
end
last_x = points.last[:x]
 
SCHEDULER.every '2s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: rand(100).to_f }
 
  # puts points.inspect
 
  send_event('load', points: points)
end