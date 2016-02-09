class ImportController < ApplicationController
  def manifest_update
    json = params['manifest_json']
    parsed = JSON.parse(json)
    @manifest = Manifest.create_from_json_hash(parsed)

    redirect_to @manifest, notice: 'Manifest was successfully created.'
  rescue => e
    flash[:error] = e.message
    logger.error('ImportController#manifest_update failed.')
    logger.error('-- BEGIN BACKTRACE --')
    logger.error(e.backtrace.join("\n"))
    logger.error('-- END BACKTRACE --')
    redirect_to '/import/manifest'
  end
end
