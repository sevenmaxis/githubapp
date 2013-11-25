require 'octokit'

class Fetcher

	TOKEN = "c283c34a7d57df51882dffe3b274fa99e9d3d294"

	EVENT_TYPES = %w(PushEvent PullRequestEvent PullRequestReviewCommentEvent IssueCommentEvent)

	def initialize(repo_name)
		@repo_name = repo_name
		client = Octokit::Client.new(access_token: TOKEN)
		binding.pry
		client.user.login
		@repo = client.repo repo_name
	end

	def fetch!
		got_new = false

		page = @repo.rels[:events]
		loop do
			page.get.data.each do |repo_event|
				
				if EVENT_TYPES.include? repo_event.type
					repo = Repo.find_or_create_by(name: @repo_name)

					user = repo.users.find_or_create_by(user_id: repo_event.actor.id) do |user|
						user.login = repo_event.actor.login
					end
					
					event = user.events.find_or_create_by(event_id: repo_event.id) do |event|
						event.type       = repo_event.type
						event.created_at = repo_event.created_at
						got_new = true
					end
				end
			end
			# binding.pry
			break unless got_new or (page = page.get.rels[:next])
		end
	end

	def hour_user
		active_user(1.hour.ago)
	end

	def day_user
		active_user(1.day.ago)
	end

	private

	def active_user(time)
		hash = Hash.new{ |h,k| h[k] = 0 }
		
		results = Event.where(:created_at.gte => time).each_with_object(hash) do |event, memo|
			memo[event.user_id] += 1
		end.sort_by { |user_id,score| score }
		binding.pry
		User.find(results.first.first)
	end
end