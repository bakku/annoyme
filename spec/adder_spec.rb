require 'spec_helper'

describe Annoyme::Adder do
  let(:file) { Annoyme::NotesFile.new(TEST_NOTES_FILE_PATH) }
  let(:adder) { Annoyme::Adder.new(file) }

  before(:each) { file.create }
  after(:each) { File.delete(TEST_NOTES_FILE_PATH) }

  describe '#add' do
    it 'should write note as an array to the file' do
      adder.add('hello')

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('["hello"]')
    end

    it 'should be able to write multiple notes to the file' do
      adder.add('hello')
      adder.add('bye')

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('["hello", "bye"]')
    end
  end
end
