class ImportController < ApplicationController
  def manifest_update
    json = params['manifest_json']
    @manifest = Manifest.from_json(json)

    if @manifest.save
      redirect_to @manifest, notice: 'Manifest was successfully created.'
    else
      render :manifest
    end
  end
end
