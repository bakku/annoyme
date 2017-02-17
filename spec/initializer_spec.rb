require 'spec_helper'
require 'fileutils'

describe Annoyme::Initializer do
  let(:file) { Annoyme::NotesFile.new(TEST_NOTES_FILE_PATH) }

  describe '#new' do
    it 'should raise an error if shell can not be detected' do
      ENV['SHELL'] = '/bin/ksh'

      expect { Annoyme::Initializer.new(file) }.to raise_error('Your shell is not supported by annoyme. You can submit an issue at the github page')
    end
  end

  describe '#perform' do
    context 'if shell is bash' do
      let(:shellfile) { '/tmp/.bashrc' }

      before(:each) do
        FileUtils.touch(shellfile)
        ENV['SHELL'] = '/bin/bash'
        ENV['HOME'] = '/tmp'
      end

      after(:each) do
        FileUtils.rm(shellfile)
        FileUtils.rm(TEST_NOTES_FILE_PATH)
      end

      it 'should create notes file if it does not exist' do
        Annoyme::Initializer.new(file).perform

        expect(File.exist?(TEST_NOTES_FILE_PATH)).to be(true)
      end

      it 'should overwrite notes file if it already exists' do
        file.write('hello')

        Annoyme::Initializer.new(file).perform

        lines = File.readlines(TEST_NOTES_FILE_PATH)

        expect(lines[0]).to eq('[]')
      end

      it 'should append shell command to the shellfile' do
        Annoyme::Initializer.new(file).perform

        lines = File.readlines(shellfile)

        expect(lines.first).to eq("\n")
        expect(lines[1]).to eq("# so annoyme gets executed on startup\n")
        expect(lines[2]).to eq("annoyme print\n")
      end
    end

    context 'if shell is zsh' do
      let(:shellfile) { '/tmp/.zshrc' }

      before(:each) do
        FileUtils.touch(shellfile)
        ENV['SHELL'] = '/bin/zsh'
        ENV['HOME'] = '/tmp'
      end

      after(:each) do
        FileUtils.rm(shellfile)
        FileUtils.rm(TEST_NOTES_FILE_PATH)
      end

      it 'should create notes file if it does not exist' do
        Annoyme::Initializer.new(file).perform

        expect(File.exist?(TEST_NOTES_FILE_PATH)).to be(true)
      end

      it 'should overwrite notes file if it already exists' do
        file.write('hello')

        Annoyme::Initializer.new(file).perform

        lines = File.readlines(TEST_NOTES_FILE_PATH)

        expect(lines[0]).to eq('[]')
      end

      it 'should append shell command to the shellfile' do
        Annoyme::Initializer.new(file).perform

        lines = File.readlines(shellfile)

        expect(lines.first).to eq("\n")
        expect(lines[1]).to eq("# so annoyme gets executed on startup\n")
        expect(lines[2]).to eq("annoyme print\n")
      end
    end
  end
end
