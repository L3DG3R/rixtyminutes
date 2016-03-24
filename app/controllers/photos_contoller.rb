class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		project = @photo.project

		@photo.destroy
		@photos = Photo.where(project_id: project.id)

		respond_to :js
	end
end