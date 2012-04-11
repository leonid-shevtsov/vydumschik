# encoding: utf-8


module Vydumschik

  # This module generate lipsum-like russian pseudosentences.
  #
  # Warning!
  # To avoid using ActiveSupport for multibyte support, or anything similar,
  # I just assume that all russian chars are 2-byte (as in UTF8) and that I
  # always get a russian char when I ask for one.
  module Lorem

    # Word length
    WORD_LIMITS = [2, 10]

    # Sentence length, in words
    SENTENCE_LIMITS = [5, 10]

    # Paragraph length, in sentences
    PARA_LIMITS = [5, 10]

    # Russian consonants
    CONSONANTS = %w(б в г д ж з й к л м н п р с т ф х ц ч ш щ)

    # Russian vowels
    VOWELS = %w(а е ё и о у ы э ю я)

    # Consonants, normalized by character frequency
    CONSONANTS_NORMALIZED = %w(б б б б б б б б б б б б б б б б б б б в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в в г г г г г г г г г г г г г г г г г г г д д д д д д д д д д д д д д д д д д д д д д д д д д д д д д д д ж ж ж ж ж ж ж ж ж ж ж ж з з з з з з з з з з з з з з з з з з й й й й й й й й й й й к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к к л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л л м м м м м м м м м м м м м м м м м м м м м м м м м м м м м м м м н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н н п п п п п п п п п п п п п п п п п п п п п п п п п п р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р р с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с с т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т т ф х х х х х х х х ц ц ц ч ч ч ч ч ч ч ч ч ч ч ч ч ч ч ч ч ч ш ш ш ш ш ш ш ш ш щ щ щ)

    # Vowels, normalized by character frequency
    VOWELS_NORMALIZED = %w(а а а а а а а а а а а а а а а а а а а а а а а а а а а а е е е е е е е е е е е е е е е е е е е е е е е е е е е е е е е и и и и и и и и и и и и и и и и и и и и и и о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о о у у у у у у у у у ы ы ы ы ы ы э ю ю я я я я я я я)

    # Returns a random word. Passing a previous word affects the first character
    def self.word(previous_word=nil)
      if previous_word
        last_char = previous_word[-2,2]
        if CONSONANTS.include?(last_char)
          next_char = VOWELS_NORMALIZED
        else
          next_char = CONSONANTS_NORMALIZED
        end
      else
        next_char = rand>0.5 ? CONSONANTS_NORMALIZED : VOWELS_NORMALIZED
      end
      word = ''
      random_length(WORD_LIMITS).times do
        word << next_char[rand next_char.length]
        next_char = next_char===CONSONANTS_NORMALIZED ? VOWELS_NORMALIZED : CONSONANTS_NORMALIZED
      end

      word
    end

    # Returns a random sentence
    def self.sentence
      last_word = nil
      sentence = []
      random_length(SENTENCE_LIMITS).times do
        sentence << word(last_word)
      end
      capitalize_ru(sentence.join(' ')) + '.'
    end

    # Returns a random paragraph
    def self.paragraph
      sentences = []
      random_length(PARA_LIMITS).times do
        sentences << sentence
      end
      sentences.join(' ')
    end

    private

    # Random value based on limits
    def self.random_length(limits)
      limits.first + rand(limits.last-limits.first+1)
    end

    # Capitalizes a russian string. Works only with UTF8.
    def self.capitalize_ru(word)
      w = word.clone
      if RUBY_VERSION >= '1.9'
        w[0] = (w[0].ord - 32).chr('utf-8')
      else
        code = (w[1]-0b10000000) + ((w[0]-0b11000000)<<6)
        code -= 32
        w[1] = (code & 0b00111111) | 0b10000000
        w[0] = (code >> 6) | 0b11000000
      end
      w
    end
  end
end
