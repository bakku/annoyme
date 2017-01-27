require 'spec_helper'
require 'fileutils'

describe Annoyme::NotesFile do
  let(:file) { Annoyme::NotesFile.new(TEST_NOTES_FILE_PATH) }

  describe '#create' do
    it 'should write an empty json array to the file' do
      file.create

      lines = File.readlines(TEST_NOTES_FILE_PATH)
      expect(lines[0]).to eq('[]')
    end
  end

  describe '#exists?' do
    context 'if file exists' do 
      before(:each) { FileUtils.touch(TEST_NOTES_FILE_PATH) }
      after(:each) { File.delete(TEST_NOTES_FILE_PATH) }

      it 'should be true' do
        expect(file.exists?).to be(true)
      end
    end

    context 'if file does not exist' do
      it 'should be false' do
        expect(file.exists?).to be(false) 
      end
    end
  end

  describe '#parse' do
    after(:each) { File.delete(TEST_NOTES_FILE_PATH) }

    context 'with valid json' do
      before(:each) do
        File.open(TEST_NOTES_FILE_PATH, 'w') do |f|
          f.write('["test"]')
        end
      end

      it 'should return an array of the content' do
        content = file.parse 

        expect(content).to eq(['test'])
      end
    end
    
    context 'with invalid json' do
      before(:each) do
        File.open(TEST_NOTES_FILE_PATH, 'w') do |f|
          f.write('invalid json')
        end
      end

      it 'should raise and error' do
        expect { file.parse }.to raise_error('notes file seems to be corrupted')
      end
    end
  end

  describe '#write' do
    after(:each) { File.delete(TEST_NOTES_FILE_PATH) }

    context 'if file exists' do 
      before(:each) { FileUtils.touch(TEST_NOTES_FILE_PATH) }

      it 'should write to file correctly' do
        file.write('["hello"]')

        lines = File.readlines(TEST_NOTES_FILE_PATH)
        expect(lines[0]).to eq('["hello"]')
      end

      it 'should be able to be parsed again' do
        file.write('["hello"]')

        content = file.parse 
        expect(content).to eq(['hello'])
      end
    end

    context 'if file does not exist' do
      it 'should write to file correctly' do
        file.write('["hello"]')

        lines = File.readlines(TEST_NOTES_FILE_PATH)
        expect(lines[0]).to eq('["hello"]')
      end

      it 'should be able to be parsed again' do
        file.write('["hello"]')

        content = file.parse 
        expect(content).to eq(['hello'])
      end
    end
  end
end
