# CloudFormation SQS QueuePolicy docs: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html
module Jets::Resource::Sqs
  class QueuePolicy < Jets::Resource::Base
    def initialize(props={})
      @props = props # associated_properties from dsl.rb
    end

    def definition
      {
        policy_logical_id => {
          type: "AWS::SQS::QueuePolicy",
          properties: merged_properties,
        }
      }
    end

    def policy_logical_id
      "{namespace}_sqs_queue_policy"
    end
  end
end
