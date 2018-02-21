# Analyze string methods
module AnalyzeString
  MAX_EXAMPLE_SIZE = 100_000

  # Given a non-empty string S consisting of N characters, returns 1 if S is
  # an anagram of some palindrome and returns 0 otherwise.
  def anagram_of_polindrome?(example)
    return nil unless valid?(example)
    letters = {}
    odd_letters = 0
    example.each_char { |char| letters[char] = (letters[char] || 0) + 1 }
    letters.each_value do |value|
      odd_letters += 1 if value.odd?
      return 0 unless polindrome?(example, odd_letters)
    end
    1
  end

  def valid?(example)
    example.is_a?(String) &&
      !example.empty? &&
      example.size <= MAX_EXAMPLE_SIZE &&
      example[/[a-z]+/] == example
  end

  def polindrome?(example, odd_letters)
    size = example.size
    odd_letters.zero? && size.even? ||
      odd_letters == 1 && size.odd?
  end
end

describe AnalyzeString do
  include AnalyzeString
  let(:correct_string) { 'dooernedeevrvn' }
  let(:incorrect_string) { 'aabcba' }
  let(:not_string) { 345 }
  let(:empty_string) { '' }
  let(:too_big_string) { 'a' * (AnalyzeString::MAX_EXAMPLE_SIZE + 1) }
  let(:mixed_string) { 'dffdg4k55' }
  describe 'anagram_of_polindrome?' do
    it 'returns 1 if example is anagram_of_polindrome' do
      expect(anagram_of_polindrome?(correct_string)).to eq(1)
    end

    it 'returns 0 if example is not anagram_of_polindrome' do
      expect(anagram_of_polindrome?(incorrect_string)).to eq(0)
    end

    it 'returns nil if example is not a string' do
      expect(anagram_of_polindrome?(not_string)).to be_nil
    end

    it 'returns nil if string is empty' do
      expect(anagram_of_polindrome?(empty_string)).to be_nil
    end

    it 'returns nil if string is longer than max examle size' do
      expect(anagram_of_polindrome?(too_big_string)).to be_nil
    end

    it 'returns nil if string includes not lowercase letters' do
      expect(anagram_of_polindrome?(mixed_string)).to be_nil
    end
  end
end
