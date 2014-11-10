class ImportFile
  include ActiveAttr::Attributes

  attribute :bucket
  attribute :s3_file

  def bucket
    AWS::S3.new.buckets[Rails.application.secrets.s3_bucket]
  end

  def s3_file
    bucket.objects['my-json-data']
  end
end
