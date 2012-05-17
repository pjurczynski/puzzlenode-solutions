module SpellChecker
  class Speller
    def initialize(messenger)
      @messenger = messenger
    end

    def run(suggestions)
      @messenger.puts "Enter the word:"
      @suggestions = suggestions
    end

    def check(word)
      output = {}
      @suggestions.each do |s|
        output[s] = /#{word.gsub(/(\w)/,'\1*')}/.match(s).to_s.length
      end
      best = output.max[1]
      @messenger.puts output.select { |k,v| v == best }.keys.first
    end
  end
end
