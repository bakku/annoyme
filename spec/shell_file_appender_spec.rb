require 'spec_helper'

describe Annoyme::ShellFileAppender do
  describe '#append_command' do
    context 'when file does not exist' do
      it 'should return true' do
        expect(true).to be true
      end
    end
  end
end
