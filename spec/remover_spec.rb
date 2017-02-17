require 'spec_helper'

describe Annoyme::Remover do
  let(:file) { Annoyme::NotesFile.new(TEST_NOTES_FILE_PATH) }
  let(:remover) { Annoyme::Remover.new(file) }

  before(:each) { file.create }
  before(:each) { file.write('["hello", "world"]') }
  after(:each) { File.delete(TEST_NOTES_FILE_PATH) }

  describe '#remove' do
    it 'should remove the correct note' do
      remover.remove(1)

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('["world"]')
    end

    it 'should not remove anything if incorrect position was given' do
      remover.remove(3)

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('["hello", "world"]')
    end

    it 'should not remove anything if no number was given' do
      remover.remove("hello")

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('["hello", "world"]')
    end
  end
end
