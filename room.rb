class Room

  attr_reader :number, :guests, :capacity, :playlist, :class, :fee

  def initialize(room_number, capacity, playlist, room_class)
    @number = room_number
    @guests = []
    @capacity = capacity
    @playlist = playlist
    @class = room_class
    @fee = set_room_fee(room_class)
  end

  def set_room_fee(room_class)
    fees = {
      premium: 7,
      basic: 4
    }
    return fees[room_class]
  end

  def check_availability
    return guests.length < capacity
  end

  def add_song(song)
    @playlist << song
  end

  def check_out_guest(guest_name)
    leaver = @guests.find{|guest| guest.name == "Rob"}
    @guests.delete(leaver)
  end

  def close_room
    @guests.clear
  end

end
