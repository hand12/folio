CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      =>  'AKIAJLJLHUUUVVG3DPUQ',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  case Rails.env
  when 'development'
    config.storage = :fog
    config.fog_directory = "folio-by-yusuke"
    config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{config.fog_directory}"
  when 'test'
    config.storage = :file
    config.enable_processing = false
  when 'production'
    config.storage = :fog
    config.fog_directory = 'folio-by-yusuke'
    config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{config.fog_directory}"
  end

end
