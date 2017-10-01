class ImagesUploader < CarrierWave::Uploader::Base
  storage :file

  # 特定の拡張子のみ許可する
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end