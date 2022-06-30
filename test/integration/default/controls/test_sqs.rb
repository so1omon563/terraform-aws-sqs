# frozen_string_literal: true

include_controls 'inspec-aws'
require './test/library/common'

tfstate = StateFileReader.new
sqs_url = tfstate.read['outputs']['sqs']['value']['queue']['url'].to_s

control 'default' do
  describe aws_sqs_queue(sqs_url) do
    # https://github.com/inspec/inspec-aws/blob/main/docs/resources/aws_sqs_queue.md
    it { should exist }
    its('is_fifo_queue') { should cmp false }
    its('visibility_timeout') { should eq 30 }
    its('maximum_message_size') { should eq 262_144 }
    its('message_retention_period') { should eq 345_600 }
    its('delay_seconds') { should eq 0 }
    its('receive_message_wait_timeout_seconds') { should eq 0 }
    its('content_based_deduplication') { should cmp false }
    its('redrive_policy') { should eq nil }
    its('kms_master_key_id') { should eq nil }
    its('kms_data_key_reuse_period_seconds') { should eq nil }
  end
end
