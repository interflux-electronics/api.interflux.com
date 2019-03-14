class SanityController < ApplicationController
  def check
    json = {
      status: 200,
      code: 'all-good',
      msg: 'This back-end is live and running. This request just successfully got passed Nginx, SSL, Puma, Rack, Rails and back! Have a beer.',
      build: {
        environment: environment,
        git: {
          branch: git_branch,
          revision: git_revision,
        }
      }
    }
    render status: 200, json: json
  end

  private

  def environment
    Rails.env || '?'
  end

  def git_branch
    ENV['GIT_BRANCH'] || '?'
  end

  def git_revision
    ENV['GIT_REVISION'] || '?'
  end
end
