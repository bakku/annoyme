require 'spec_helper'
require 'fileutils'

describe Annoyme::ShellFileAppender do
  describe '#append_command' do
    context 'when file does not exist' do
      it 'should throw an error' do
        expect { Annoyme::ShellFileAppender.new(TEST_SHELLFILE_PATH) }.to raise_error('shellfile does not exist')
      end
    end

    context 'when file is empty' do
      let(:appender) { Annoyme::ShellFileAppender.new(TEST_SHELLFILE_PATH) }

      before(:each) { FileUtils.touch(TEST_SHELLFILE_PATH) }
      after(:each) { File.delete(TEST_SHELLFILE_PATH) }

      it 'should add newline at beginning' do
        appender.append_command      
        
        lines = File.readlines(TEST_SHELLFILE_PATH)
        expect(lines.first).to eq("\n")
      end

      it 'should add comment after newline' do
        appender.append_command      
        
        lines = File.readlines(TEST_SHELLFILE_PATH)
        expect(lines[1]).to eq("# so annoyme gets executed on startup\n")
      end

      it 'should add command lastly' do
        appender.append_command

        lines = File.readlines(TEST_SHELLFILE_PATH)
        expect(lines[2]).to eq("annoyme print\n")
      end
    end

    context 'when file already has the command' do
      let(:appender) { Annoyme::ShellFileAppender.new(TEST_SHELLFILE_PATH) }

      before(:each) do 
        File.open(TEST_SHELLFILE_PATH, 'w+') do |f|
          f.write('annoyme print')
        end
      end

      after(:each) { File.delete(TEST_SHELLFILE_PATH) }

      it 'should stay the same' do
        appender.append_command

        lines = File.readlines(TEST_SHELLFILE_PATH)
        expect(lines.first).to eq('annoyme print') 
      end
    end
  end
end
