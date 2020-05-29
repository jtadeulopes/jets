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

    # Do not name this method properties, that is a computed method of `Jets::Resource::Base`
    # def merged_properties
    #   {
    #     policy_document: {
    #       version: "2012-10-17",
    #       statement: {
    #         effect: "Allow",
    #         principal: { aws: "*"},
    #         action: "sqs:SendMessage",
    #         resource: "*",
    #         # Condition:
    #         #   ArnLike:
    #         #     aws:SourceArn: arn:aws:s3:::aa-test-95872017
    #       }
    #     },
    #     topics: ["!Ref {namespace}SnsTopic"],
    #   }.deep_merge(@props)
    # end

    def policy_logical_id
      "{namespace}_sqs_queue_policy"
    end
  end
end
