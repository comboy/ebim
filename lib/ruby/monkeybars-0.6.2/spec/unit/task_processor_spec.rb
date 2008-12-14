require File.dirname(__FILE__) + '/../spec_helper.rb'
require 'monkeybars/task_processor'

describe Monkeybars::TaskProcessor, '#repaint_while' do
  class UsesTaskProcessor
    include Monkeybars::TaskProcessor
  end

  it "should return the return value of the task passed into it" do
    javax.swing.SwingUtilities.invoke_and_wait proc {
      UsesTaskProcessor.new.repaint_while {
        'heynow'
      }.should == 'heynow'
    }
  end
end

