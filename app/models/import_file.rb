class ImportFile
  include ActiveAttr::Attributes

  attr_reader :aws_bucket

  def initialize
    @aws_bucket = Aws::S3::Resource.new.bucket(Rails.application.secrets.s3_bucket)
  end

  attribute :bucket
  attribute :s3_file

  def bucket
    aws_bucket
  end

  def s3_file
    bucket.object('my-json-data')
  end

  def download_to(local_path)
    File.open(local_path, 'wb') do |file|
      file.write(s3_file.get.body.read)
    end

    Rails.cache.write('time', fetch_bucket, expires_in: 1.hour)
  end

  def fetch_bucket
    s3_file.last_modified
  rescue Aws::S3::Errors::NotFound
    nil
  end

end