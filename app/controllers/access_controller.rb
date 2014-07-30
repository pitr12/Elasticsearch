class AccessController < ApplicationController

TIME_LIMIT = 120
REQUEST_LIMIT = 20

  def index
  end

  before_filter :restrict

  def restrict
    r = Redis.new
    client_ip = request.env["REMOTE_ADDR"]
    key = "count:#{client_ip}"

    @count = r.get(key)

    unless @count
      r.set(key, 0)
      r.expire(key, TIME_LIMIT)
    end

    if @count.to_i > REQUEST_LIMIT
      render status: :forbidden, json: {error: 'Rate limit exceeded!'}
    end

    r.incr(key)
    @count

   end

end