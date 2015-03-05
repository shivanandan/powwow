class HomeController < ApplicationController
	# before_filter :authenticate_user!
	# load_and_authorize_resource

  def index
  	@announcements = Announcement.order('priority DESC').limit(4)
  end

  def abstracts_archive
  	@conference_id = params[:year].to_i - 2012
  	@approved = 1 if params[:type] == 'talks'
  	@approved = 2 if params[:type] == 'posters'
  	@params = params

	archive = SQLite3::Database.new 'db/past.sqlite3'
	@results =  archive.execute ("select * from submissions s LEFT OUTER JOIN users u ON s.user_id = u.id where s.conference_id=#{@conference_id} and s.approved=#{@approved} ORDER BY u.first_name")
  end

  def single_abstract
  	@id = params[:id].to_i
  	archive = SQLite3::Database.new 'db/past.sqlite3'
  	@result =  archive.execute ("select * from submissions s LEFT OUTER JOIN users u ON s.user_id = u.id where s.id=#{@id}")
    @attachment = archive.execute ("select * from attachments where attachable_id=#{@id} and attachable_type='Submission'")
  	@uid = @result[0][5].to_i
  	@users = archive.execute ("select * from users u LEFT OUTER JOIN details d ON u.id = d.user_id where u.id=#{@uid}")
  end

  def plenaries_archive
    @params = params
    @conference_id = params[:year].to_i - 2012
    archive = SQLite3::Database.new 'db/past.sqlite3'
    @results =  archive.execute ("select * from plenaries where conference_id=#{@conference_id}")
  end

  def single_plenary
    @params = params
    archive = SQLite3::Database.new 'db/past.sqlite3'
    @result =  archive.execute ("select * from plenaries where slug='#{@params[:slug]}'")
  end

  def workshops_archive
    @params = params
    @conference_id = params[:year].to_i - 2012
    archive = SQLite3::Database.new 'db/past.sqlite3'
    @results =  archive.execute ("select * from workshops where conference_id=#{@conference_id} ORDER BY presenter")
  end

  def single_workshop
    @params = params
    archive = SQLite3::Database.new 'db/past.sqlite3'
    @result =  archive.execute ("select * from workshops where id='#{@params[:id]}'")
  end

end
