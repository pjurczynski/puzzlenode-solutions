require_relative '../lib/spellchecker.rb'
require_relative 'puzzle_reader'

SAMPLE_INPUT_PATH = '../data/sample/sample-input.txt'
INPUT_PATH        = '../data/input.txt'

tests = PuzzleReader.read(INPUT_PATH)
