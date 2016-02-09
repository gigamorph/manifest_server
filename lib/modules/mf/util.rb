module Mf
  module Util
    def self.extract_manifest_identifier(uri)
      m = uri.match(/\/([^\/]+)\/manifest$/)
      if m && m.captures
        return m.captures[0]
      else
        Rails.logger.error("Mf::Util.extract_manifest_identifier failed for uri: #{uri}")
        return nil
      end
    end
  end
end
