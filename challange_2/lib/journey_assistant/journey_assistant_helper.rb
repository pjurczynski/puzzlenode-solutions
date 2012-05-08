module JourneyAssistant
  def self.in_minutes(time)
    time.split(':').inject { |hours,minutes| minutes.to_i + hours.to_i*60 }
  end

  def self.to_time(minutes)
    [(minutes/60).to_s.rjust(2,'0'), (minutes%60).to_s.rjust(2,'0')].join(':')
  end
end
