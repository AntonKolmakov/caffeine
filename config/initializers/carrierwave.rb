CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  if %w(staging production).include? Rails.env
    config.fog_credentials = {
        provider:             'AWS',
        aws_access_key_id:     Rails.application.secrets.aws_access_key_id,
        aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
        region:                'eu-west-1',
        host:                  "s3.amazonaws.com/#{Rails.application.secrets.s3_bucket}"
    }

    config.fog_directory  = Rails.application.secrets.s3_bucket
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  end
end